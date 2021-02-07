package com.github.shimmerjordan.msc.api.feign;

import com.github.shimmerjordan.common.core.constant.ServiceConstant;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.feign.config.CustomFeignConfig;
import com.github.shimmerjordan.msc.api.dto.SmsDto;
import com.github.shimmerjordan.msc.api.feign.factory.MscServiceClientFallbackFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

/**
 * 消息中心服务
 *
 * @author shimmerjordan
 * @date 2021/03/02 16:04
 */
@FeignClient(value = ServiceConstant.MSC_SERVICE, configuration = CustomFeignConfig.class, fallbackFactory = MscServiceClientFallbackFactory.class)
public interface MscServiceClient {

    /**
     * 发送短信
     *
     * @param smsDto smsDto
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/02 16:07:27
     */
    @PostMapping("/v1/sms/sendSms")
    ResponseBean<?> sendSms(@RequestBody SmsDto smsDto);
}
