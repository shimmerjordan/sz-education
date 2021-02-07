package com.github.shimmerjordan.common.security.enums;

import org.springframework.security.core.GrantedAuthority;

/**
 * 角色枚举
 *
 * @author shimmerjordan
 * @date 2021/04/02 12:30
 */
public enum Roles implements GrantedAuthority {
    /**
     * 普通用户
     */
    ROLE_USER,

    /**
     * 超级管理员
     */
    ROLE_ADMIN,

    /**
     * 租户管理员
     */
    ROLE_TENANT_ADMIN,

    /**
     * 老师
     */
    ROLE_TEACHER,

    /**
     * 预览角色
     */
    ROLE_PREVIEW;

    @Override
    public String getAuthority() {
        return name();
    }
}
