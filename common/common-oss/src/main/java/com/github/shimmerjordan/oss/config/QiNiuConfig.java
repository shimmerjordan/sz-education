package com.github.shimmerjordan.oss.config;

import lombok.Data;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * 七牛云配置
 * @author shimmerjordan
 * @date 2021/02/18 8:19
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "qiniu")
@ConditionalOnExpression("!'${qiniu}'.isEmpty()")
public class QiNiuConfig {

	private String accessKey;

	private String secretKey;

	private String bucket;

	/**
	 * 外部访问域名
	 */
	private String domainOfBucket;

	/**
	 * 链接超时时间，单位秒
	 */
	private Integer expire;
}
