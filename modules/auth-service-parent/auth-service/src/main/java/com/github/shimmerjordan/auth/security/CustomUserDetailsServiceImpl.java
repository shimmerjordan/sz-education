package com.github.shimmerjordan.auth.security;

import com.github.shimmerjordan.auth.api.module.WxSession;
import com.github.shimmerjordan.auth.model.CustomUserDetails;
import com.github.shimmerjordan.auth.service.WxSessionService;
import com.github.shimmerjordan.common.basic.enums.LoginTypeEnum;
import com.github.shimmerjordan.common.basic.vo.UserVo;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.exceptions.CommonException;
import com.github.shimmerjordan.common.core.exceptions.ServiceException;
import com.github.shimmerjordan.common.core.exceptions.TenantNotFoundException;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.core.utils.DateUtils;
import com.github.shimmerjordan.common.core.utils.ResponseUtil;
import com.github.shimmerjordan.common.security.core.CustomUserDetailsService;
import com.github.shimmerjordan.common.security.core.GrantedAuthorityImpl;
import com.github.shimmerjordan.common.security.mobile.MobileUser;
import com.github.shimmerjordan.common.security.tenant.TenantContextHolder;
import com.github.shimmerjordan.common.security.wx.WxUser;
import com.github.shimmerjordan.user.api.dto.UserDto;
import com.github.shimmerjordan.user.api.enums.IdentityType;
import com.github.shimmerjordan.user.api.feign.UserServiceClient;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 从数据库获取用户信息
 *
 * @author shimmerjordan
 * @date 2021/03/14 14:36
 */
@AllArgsConstructor
@Service("userDetailsService")
public class CustomUserDetailsServiceImpl implements CustomUserDetailsService {

	private static final String GET_USER_INFO_FAIL = "get user information failed: ";

    private final UserServiceClient userServiceClient;

    private final WxSessionService wxService;

    /**
     * 加载用户信息
     * @param username username
     * @return UserDetails
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        long start = System.currentTimeMillis();
        ResponseBean<UserVo> userVoResponseBean = userServiceClient.findUserByIdentifier(username, TenantContextHolder.getTenantCode());
        if (!ResponseUtil.isSuccess(userVoResponseBean))
            throw new ServiceException(GET_USER_INFO_FAIL + userVoResponseBean.getMsg());
        UserVo userVo = userVoResponseBean.getData();
        if (userVo == null)
            throw new UsernameNotFoundException("user does not exist");
        return new CustomUserDetails(username, userVo.getCredential(), CommonConstant.STATUS_NORMAL.equals(userVo.getStatus()), getAuthority(userVo), userVo.getTenantCode(), userVo.getId(), start, LoginTypeEnum.PWD);

    }

    /**
     * 加载用户信息
     *
	 * @param tenantCode 租户标识
     * @param username 用户名
     * @return UserDetails
     * @throws UsernameNotFoundException,TenantNotFoundException
     */
    @Override
    public UserDetails loadUserByIdentifierAndTenantCode(String tenantCode, String username) throws UsernameNotFoundException, TenantNotFoundException {
        long start = System.currentTimeMillis();
        ResponseBean<UserVo> userVoResponseBean = userServiceClient.findUserByIdentifier(username, tenantCode);
        if (!ResponseUtil.isSuccess(userVoResponseBean))
            throw new ServiceException(GET_USER_INFO_FAIL + userVoResponseBean.getMsg());
        UserVo userVo = userVoResponseBean.getData();
        if (userVo == null)
            throw new UsernameNotFoundException("user does not exist");
        return new CustomUserDetails(username, userVo.getCredential(), CommonConstant.STATUS_NORMAL.equals(userVo.getStatus()), getAuthority(userVo), userVo.getTenantCode(), userVo.getId(), start, LoginTypeEnum.PWD);
    }

    /**
     * 根据社交账号查询
	 *
	 * @param tenantCode tenantCode
     * @param social     social
     * @param mobileUser mobileUser
     * @return UserDetails
     * @author shimmerjordan
     * @date 2021/03/22 21:08
     */
    @Override
    public UserDetails loadUserBySocialAndTenantCode(String tenantCode, String social, MobileUser mobileUser) throws UsernameNotFoundException {
        long start = System.currentTimeMillis();
        ResponseBean<UserVo> userVoResponseBean = userServiceClient.findUserByIdentifier(social, IdentityType.PHONE_NUMBER.getValue(), tenantCode);
        if (!ResponseUtil.isSuccess(userVoResponseBean))
            throw new ServiceException(GET_USER_INFO_FAIL + userVoResponseBean.getMsg());
        UserVo userVo = userVoResponseBean.getData();
        // 第一次登录
        if (userVo == null) {
            UserDto userDto = new UserDto();
            // 用户的基本信息
            if (mobileUser != null)
                BeanUtils.copyProperties(mobileUser, userDto);
            userDto.setIdentifier(social);
            userDto.setCredential(social);
            userDto.setIdentityType(IdentityType.PHONE_NUMBER.getValue());
            userDto.setLoginTime(DateUtils.asDate(LocalDateTime.now()));
            // 注册账号
            ResponseBean<Boolean> response = userServiceClient.registerUser(userDto);
            if (!ResponseUtil.isSuccess(response))
                throw new ServiceException("register failed: " + response.getMsg());
            // 重新获取用户信息
            userVoResponseBean = userServiceClient.findUserByIdentifier(social, IdentityType.PHONE_NUMBER.getValue(), tenantCode);
            if (!ResponseUtil.isSuccess(userVoResponseBean))
                throw new ServiceException(GET_USER_INFO_FAIL + userVoResponseBean.getMsg());
            userVo = userVoResponseBean.getData();
        }
        return new CustomUserDetails(userVo.getIdentifier(), userVo.getCredential(), CommonConstant.STATUS_NORMAL.equals(userVo.getStatus()), getAuthority(userVo), userVo.getTenantCode(), userVo.getId(), start, LoginTypeEnum.SMS);
    }

    /**
     * 根据微信code和租户标识查询
     * 将code换成openId和sessionKey
     *
	 * @param tenantCode tenantCode
     * @param code       code
     * @param wxUser     wxUser
     * @return UserDetails
     * @author shimmerjordan
     * @date 2021/03/05 20:05:36
     */
    @Override
    public UserDetails loadUserByWxCodeAndTenantCode(String tenantCode, String code, WxUser wxUser) throws UsernameNotFoundException {
        long start = System.currentTimeMillis();
        // 根据code获取openId和sessionKey
        WxSession wxSession = wxService.code2Session(code);
        if (wxSession == null)
            throw new CommonException("get openId failed");
        // 获取用户信息
        ResponseBean<UserVo> userVoResponseBean = userServiceClient.findUserByIdentifier(wxSession.getOpenId(), IdentityType.WE_CHAT.getValue(), tenantCode);
        if (!ResponseUtil.isSuccess(userVoResponseBean))
            throw new ServiceException(GET_USER_INFO_FAIL + userVoResponseBean.getMsg());
        UserVo userVo = userVoResponseBean.getData();
        // 为空说明是第一次登录，需要将用户信息增加到数据库里
        if (userVo == null) {
            UserDto userDto = new UserDto();
            // 用户的基本信息
            if (wxUser != null)
                BeanUtils.copyProperties(wxUser, userDto);
            userDto.setIdentifier(wxSession.getOpenId());
            userDto.setCredential(wxSession.getOpenId());
            userDto.setIdentityType(IdentityType.WE_CHAT.getValue());
            userDto.setLoginTime(DateUtils.asDate(LocalDateTime.now()));
            // 注册账号
            ResponseBean<Boolean> response = userServiceClient.registerUser(userDto);
            if (!ResponseUtil.isSuccess(response))
                throw new ServiceException("register failed: " + response.getMsg());
            // 重新获取用户信息
            userVoResponseBean = userServiceClient.findUserByIdentifier(wxSession.getOpenId(), IdentityType.WE_CHAT.getValue(), tenantCode);
            if (!ResponseUtil.isSuccess(userVoResponseBean))
                throw new ServiceException(GET_USER_INFO_FAIL + userVoResponseBean.getMsg());
            userVo = userVoResponseBean.getData();
        }
        return new CustomUserDetails(userVo.getIdentifier(), userVo.getCredential(), CommonConstant.STATUS_NORMAL.equals(userVo.getStatus()), getAuthority(userVo), userVo.getTenantCode(), userVo.getId(), start, LoginTypeEnum.WECHAT);
    }

    /**
     * 获取用户权限
     *
     * @param userVo userVo
     * @return Set
     * @author shimmerjordan
     * @date 2021/03/17 14:41
     */
    private Set<GrantedAuthority> getAuthority(UserVo userVo) {
        return userVo.getRoleList()
                .stream()
                .map(role -> new GrantedAuthorityImpl(role.getRoleCode().toUpperCase()))
                .collect(Collectors.toSet());
    }
}
