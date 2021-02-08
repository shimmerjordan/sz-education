package com.github.shimmerjordan.common.security.core;

import org.springframework.security.core.GrantedAuthority;

/**
 * GrantedAuthority封装
 *
 * @author shimmerjordan
 * @date 2021/03/17 14:29
 */
public class GrantedAuthorityImpl implements GrantedAuthority {

    private static final long serialVersionUID = -5588742812922519390L;

    private String roleName;

    public GrantedAuthorityImpl(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public String getAuthority() {
        return roleName;
    }
}
