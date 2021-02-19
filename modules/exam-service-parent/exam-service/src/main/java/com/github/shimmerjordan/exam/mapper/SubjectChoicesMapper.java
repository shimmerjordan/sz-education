package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.SubjectChoices;
import org.apache.ibatis.annotations.Mapper;

/**
 * 选择题Mapper
 *
 * @author shimmerjordan
 * @date 2021/03/08 21:15
 */
@Mapper
public interface SubjectChoicesMapper extends CrudMapper<SubjectChoices> {

    /**
     * 物理删除
     *
     * @param subjectChoices subjectChoices
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:44
     */
    int physicalDelete(SubjectChoices subjectChoices);

    /**
     * 物理批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:44
     */
    int physicalDeleteAll(Long[] ids);
}
