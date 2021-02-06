package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.user.api.module.Dept;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜单mapper
 *
 * @author shimmerjordan
 * @date 2020/12/26 22:34
 */
@Mapper
public interface DeptMapper extends CrudMapper<Dept> {
}
