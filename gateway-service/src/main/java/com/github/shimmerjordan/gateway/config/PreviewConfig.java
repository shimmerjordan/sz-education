package com.github.shimmerjordan.gateway.config;

import lombok.Data;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;

/**
 * 演示环境配置
 *
 * @author shimmerjordan
 * @date 2021/04/23 13:38
 */
@Data
@Configuration
@RefreshScope
@ConditionalOnExpression("!'${preview}'.isEmpty()")
@ConfigurationProperties(prefix = "preview")
public class PreviewConfig {

    private List<String> ignores = new ArrayList<>();

}
