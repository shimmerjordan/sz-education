package com.github.shimmerjordan.common.basic.vo;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 部门vo
 *
 * @author shimmerjordan
 * @date 2021/01/31 22:02
 */
@Data
public class DeptVo extends BaseEntity<DeptVo> {

    private String deptName;
}
