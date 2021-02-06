package com.github.shimmerjordan.user.api.module;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 用户部门关系
 *
 * @author shimmerjordan
 * @date 2021/01/27 10:23
 */
@Data
public class UserDept extends BaseEntity<UserDept> {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 部门ID
     */
    private String deptId;
}
