package com.github.shimmerjordan.user.service;

import cn.hutool.core.util.RandomUtil;
import com.github.shimmerjordan.common.basic.enums.LoginTypeEnum;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.exceptions.ServiceException;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.core.utils.ResponseUtil;
import com.github.shimmerjordan.common.security.constant.SecurityConstant;
import com.github.shimmerjordan.msc.api.constant.SmsConstant;
import com.github.shimmerjordan.msc.api.dto.SmsDto;
import com.github.shimmerjordan.msc.api.feign.MscServiceClient;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
 * 手机管理Service
 *
 * @author shimmerjordan
 * @date 2021/03/02 09:35
 */
@Slf4j
@AllArgsConstructor
@Service
public class MobileService {

    private final RedisTemplate redisTemplate;

    private final MscServiceClient mscServiceClient;

    /**
     * 发送短信
     *
     * @param mobile     mobile
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/02 09:36:52
     */
    public ResponseBean<Boolean> sendSms(String mobile) {
        String key = CommonConstant.DEFAULT_CODE_KEY + LoginTypeEnum.SMS.getType() + "@" + mobile;
        // TODO 校验时间
        String code = RandomUtil.randomNumbers(Integer.parseInt(CommonConstant.CODE_SIZE));
        log.debug("Generate validate code success: {}, {}", mobile, code);
        redisTemplate.opsForValue().set(key, code, SecurityConstant.DEFAULT_SMS_EXPIRE, TimeUnit.SECONDS);
        // 调用消息中心服务，发送短信验证码
        SmsDto smsDto = new SmsDto();
        smsDto.setReceiver(mobile);
        smsDto.setContent(String.format(SmsConstant.SMS_TEMPLATE, code));
        ResponseBean<?> result = mscServiceClient.sendSms(smsDto);
        if (!ResponseUtil.isSuccess(result))
            throw new ServiceException("Send validate code error: " + result.getMsg());
        log.info("Send validate result: {}", result.getData());
        return new ResponseBean<>(Boolean.TRUE, code);
    }
}
