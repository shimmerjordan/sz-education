package com.github.shimmerjordan.common.basic.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * ID生成配置
 *
 * @author shimmerjordan
 * @date 2021/03/26 10:47
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "cluster")
public class SnowflakeProperties {

    /**
     * 工作节点ID
     */
    private String workId;

    /**
     * 数据中心ID
     */
    private String dataCenterId;
}
