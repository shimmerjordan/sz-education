package com.github.shimmerjordan.common.security.annotations;

import org.springframework.security.access.prepost.PreAuthorize;

import java.lang.annotation.*;

/**
 * 普通用户权限
 *
 * @author shimmerjordan
 * @date 2021/03/22 12:44
 */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@PreAuthorize("hasRole(T(com.github.shimmerjordan.common.security.enums.Roles).ROLE_USER)")
public @interface UserAuthorization {
}
