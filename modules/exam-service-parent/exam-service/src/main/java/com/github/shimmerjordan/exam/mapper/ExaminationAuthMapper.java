package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.ExaminationAuth;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考试权限Mapper
 *
 * @author shimmerjordan
 * @date 2021-07-16 14:03
 */
@Mapper
public interface ExaminationAuthMapper extends CrudMapper<ExaminationAuth> {
}
