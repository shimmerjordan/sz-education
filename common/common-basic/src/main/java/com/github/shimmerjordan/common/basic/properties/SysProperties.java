package com.github.shimmerjordan.common.basic.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @author shimmerjordan
 * @date 2021/02/26 11:54
 */
@Data
@Configuration
@ConfigurationProperties(prefix = "sys")
public class SysProperties {

    /**
     * 默认头像
     */
    private String defaultAvatar;

    /**
     * 管理员账号
     */
    private String adminUser;

    /**
     * 密码加密解密的key
     */
    private String key;

    /**
     * 缓存超时时间
     */
    private String cacheExpire;

    private String gatewaySecret;

    /**
     * logo路径
     */
    private String logoUrl;

    /**
     * logo数量
     */
    private Integer logoCount;

    /**
     * logo的后缀名
     */
    private String logoSuffix;

    /**
     * 二维码生成链接
     */
    private String qrCodeUrl;

    /**
     * 上传类型，1：本地目录，2：fastDfs，3：七牛云
     */
    private String attachUploadType;

    /**
     * 附件上传目录
     */
    private String attachPath;

    /**
     * 支持预览的附件后缀名，多个用逗号隔开，如：png,jpeg
     */
    private String canPreview;
}
