package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.user.api.module.Student;
import org.apache.ibatis.annotations.Mapper;

/**
 * 学生Mapper
 *
 * @author shimmerjordan
 * @date 2021/07/09 15:27
 */
@Mapper
public interface StudentMapper extends CrudMapper<Student> {
}
