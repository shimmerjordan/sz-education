package com.github.shimmerjordan.common.security.constant;

/**
 * @author shimmerjordan
 * @date 2021/02/25 14:08
 */
public class SecurityConstant {

    /**
     * 租户管理员角色
     */
    public static final String ROLE_TENANT_ADMIN = "role_tenant_admin";

    /**
     * 默认生成图形验证码过期时间
     */
    public static final int DEFAULT_IMAGE_EXPIRE = 60;

    /**
     * 默认短信验证码过期时间
     */
    public static final int DEFAULT_SMS_EXPIRE = 15 * 60;

    /**
     * 正常状态
     */
    public static final String NORMAL = "0";

    /**
     * 手机登录URL
     */
    public static final String MOBILE_TOKEN_URL = "/mobile/token";

    /**
     * 微信登录URL
     */
    public static final String WX_TOKEN_URL = "/wx/token";

    /**
     * 租户编号请求头
     */
    public static final String TENANT_CODE_HEADER = "Tenant-Code";

    /**
     * 默认系统编号
     */
    public static final String SYS_CODE = "EXAM";

    /**
     * 默认租户编号
     */
    public static final String DEFAULT_TENANT_CODE = "gitee";

    /**
     * 租户编号
     */
    public static final String TENANT_CODE = "tenantCode";

    /**
     * JSON 资源
     */
    public static final String CONTENT_TYPE = "application/json; charset=utf-8";
}
