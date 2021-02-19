package com.github.shimmerjordan.auth.listener;

import com.github.shimmerjordan.auth.model.CustomUserDetails;
import com.github.shimmerjordan.common.basic.model.Log;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.constant.ServiceConstant;
import com.github.shimmerjordan.common.core.utils.DateUtils;
import com.github.shimmerjordan.common.security.event.CustomAuthenticationSuccessEvent;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import com.github.shimmerjordan.user.api.dto.UserDto;
import com.github.shimmerjordan.user.api.feign.UserServiceClient;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationListener;
import org.springframework.http.HttpHeaders;
import org.springframework.scheduling.annotation.Async;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

/**
 *
 * 处理登录成功事件
 *
 * @author shimmerjordan
 * @date 2021/04/11 23:48
 */
@Slf4j
@AllArgsConstructor
@Component
public class LoginSuccessListener implements ApplicationListener<CustomAuthenticationSuccessEvent> {

	private final UserServiceClient userServiceClient;

	@Override
	public void onApplicationEvent(CustomAuthenticationSuccessEvent event) {
		// 登录成功后的处理
		UserDetails userDetails = event.getUserDetails();
		if (userDetails instanceof CustomUserDetails) {
			CustomUserDetails customUserDetails = (CustomUserDetails) userDetails;
			String tenantCode = customUserDetails.getTenantCode();
			String username = userDetails.getUsername();
			log.info("Login success, username: {} , tenantCode: {}", username, tenantCode);
			// 记录日志
			Log logInfo = new Log();
			logInfo.setTitle("用户登录");
			logInfo.setCommonValue(username, SysUtil.getSysCode(), tenantCode);
			logInfo.setTime(String.valueOf(System.currentTimeMillis() - customUserDetails.getStart()));
			logInfo.setType(CommonConstant.STATUS_NORMAL);
			ServletRequestAttributes requestAttributes = currentRequestAttributes();
			if (requestAttributes != null) {
				HttpServletRequest request = requestAttributes.getRequest();
				logInfo.setMethod(request.getMethod());
				logInfo.setRequestUri(request.getRequestURI());
				// 获取ip、浏览器信息
				logInfo.setIp(request.getRemoteAddr());
				logInfo.setUserAgent(request.getHeader(HttpHeaders.USER_AGENT));
			}
			logInfo.setServiceId(ServiceConstant.AUTH_SERVICE);
			// 记录日志和登录时间
			UserDto userDto = new UserDto();
			userDto.setId(customUserDetails.getId());
			userDto.setIdentifier(username);
			userDto.setLoginTime(DateUtils.asDate(LocalDateTime.now()));
			saveLoginInfo(logInfo, userDto);
		}
	}

	/**
	 * 异步记录登录日志
	 *
	 * @param logInfo logInfo
	 * @param userDto userDto
	 * @author shimmerjordan
	 * @date 2021/03/30 23:30
	 */
	@Async
	public void saveLoginInfo(Log logInfo, UserDto userDto) {
		try {
			userServiceClient.saveLog(logInfo);
			userServiceClient.updateLoginInfo(userDto);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	/**
	 *
	 * 获取当前request
	 *
	 * @return ServletRequestAttributes
	 * @author shimmerjordan
	 * @date 2021/04/12 00:15
	 */
	private static ServletRequestAttributes currentRequestAttributes() {
		try {
			RequestAttributes requestAttr = RequestContextHolder.currentRequestAttributes();
			if (!(requestAttr instanceof ServletRequestAttributes)) {
				throw new IllegalStateException("current request is not a servlet request");
			}
			return (ServletRequestAttributes) requestAttr;
		} catch (Exception e) {
			// do nothing
		}
		return null;
	}
}
