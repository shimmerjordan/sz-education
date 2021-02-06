package com.github.shimmerjordan.common.core.exceptions;

/**
 * 租户不存在异常
 *
 * @author shimmerjordan
 * @date 2021/03/26 10:14
 */
public class TenantNotFoundException extends CommonException {

    private static final long serialVersionUID = -7285211528095468156L;

    public TenantNotFoundException() {
    }

    public TenantNotFoundException(String msg) {
        super(msg);
    }
}
