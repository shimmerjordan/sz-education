package com.github.shimmerjordan.common.security.tenant;

/**
 * ThreadLocal保存租户code
 *
 * @author shimmerjordan
 * @date 2021/03/28 20:54
 */
public class TenantContextHolder {

    private static final ThreadLocal<String> CONTEXT = new ThreadLocal<>();

    public static void setTenantCode(String tenantCode) {
        CONTEXT.set(tenantCode);
    }

    public static String getTenantCode() {
        return CONTEXT.get();
    }

    public static void clear() {
        CONTEXT.remove();
    }
}
