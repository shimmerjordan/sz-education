package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.user.api.module.Role;
import org.apache.ibatis.annotations.Mapper;

/**
 * 角色mapper
 *
 * @author shimmerjordan
 * @date 2020/12/26 09:33
 */
@Mapper
public interface RoleMapper extends CrudMapper<Role> {

    /**
     * 根据角色code查询
     *
     * @param role role
     * @return Role
     * @author shimmerjordan
     * @date 2021/04/21 12:08:29
     */
    Role findByRoleCode(Role role);
}
