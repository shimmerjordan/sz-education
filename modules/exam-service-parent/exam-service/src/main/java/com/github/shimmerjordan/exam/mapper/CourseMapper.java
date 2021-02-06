package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.Course;
import org.apache.ibatis.annotations.Mapper;

/**
 * 课程Mapper
 *
 * @author shimmerjordan
 * @date 2021/05/8 21:10
 */
@Mapper
public interface CourseMapper extends CrudMapper<Course> {
}
