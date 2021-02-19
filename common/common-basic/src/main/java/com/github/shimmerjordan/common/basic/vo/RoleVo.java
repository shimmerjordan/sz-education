package com.github.shimmerjordan.common.basic.vo;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 角色
 *
 * @author shimmerjordan
 * @date 2020/12/25 13:58
 */
@Data
public class RoleVo extends BaseEntity<RoleVo> {

    private String roleName;

    private String roleCode;

    private String roleDesc;

}
