package com.github.shimmerjordan.msc.properties;

import lombok.Data;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

/**
 * 短信相关配置
 *
 * @author shimmerjordan
 * @date 2021/03/22 13:31
 */
@Data
@Configuration
@RefreshScope
@ConditionalOnExpression("!'${sms}'.isEmpty()")
@ConfigurationProperties(prefix = "sms")
public class SmsProperties {

    /**
     * appKey
     */
    private String appKey;

    /**
     * appSecret
     */
    private String appSecret;

    /**
     * regionId
     */
    private String regionId;

    /**
     * domain
     */
    private String domain;

    /**
     * 签名
     */
    private String signName;

    /**
     * 模板code
     */
    private String templateCode;

    /**
     * 版本
     */
    private String version;

    /**
     * action
     */
    private String action;
}
