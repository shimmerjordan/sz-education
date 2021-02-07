package com.github.shimmerjordan.auth.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 微信配置
 *
 * @author shimmerjordan
 * @date 2021/03/04 20:25
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "wx")
public class WxProperties {

    private String appId;

    private String appSecret;

    private String grantType;
}
