package com.github.shimmerjordan.auth.api.module;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * OAuth2客户端信息
 *
 * @author shimmerjordan
 * @date 2021/3/30 16:35
 */
@Data
public class OauthClientDetails extends BaseEntity<OauthClientDetails> {

    /**
     * clientId
     */
    private String clientId;

    /**
     * resource_ids
     */
    private String resourceIds;

    /**
     * 密钥明文
     */
    private String clientSecretPlainText;

    /**
     * 密钥密文
     */
    private String clientSecret;

    /**
     * 授权范围
     */
    private String scope;

    /**
     * 授权类型
     */
    private String authorizedGrantTypes;

    /**
     * web_server_redirect_uri
     */
    private String webServerRedirectUri;

    /**
     * authorities
     */
    private String authorities;

    /**
     * access_token有效时间
     */
    private String accessTokenValidity;

    /**
     * refresh_token有效时间
     */
    private String refreshTokenValidity;

    /**
     * additional_information
     */
    private String additionalInformation;

    /**
     * autoapprove
     */
    private String autoapprove;

}
