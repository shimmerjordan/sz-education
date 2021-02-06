package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.SubjectShortAnswer;
import org.apache.ibatis.annotations.Mapper;

/**
 * 简答题Mapper
 *
 * @author shimmerjordan
 * @date 2020/6/16 14:52
 */
@Mapper
public interface SubjectShortAnswerMapper extends CrudMapper<SubjectShortAnswer> {

    /**
     * 物理删除
     *
     * @param subjectShortAnswer subjectShortAnswer
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:54
     */
    int physicalDelete(SubjectShortAnswer subjectShortAnswer);

    /**
     * 物理批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:54
     */
    int physicalDeleteAll(Long[] ids);
}
