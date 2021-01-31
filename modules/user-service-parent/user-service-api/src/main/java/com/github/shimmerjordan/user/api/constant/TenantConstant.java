package com.github.shimmerjordan.user.api.constant;

/**
 * @author shimmerjordan
 * @date 2021/5/27 10:25
 */
public class TenantConstant {

    /**
     * 待审核
     */
    public static final Integer PENDING_AUDIT = 0;

    /**
     * 审核通过
     */
    public static final Integer APPROVAL = 1;

    /**
     * 审核不通过
     */
    public static final Integer AUDIT_FAIL = 2;
}
