package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.SubjectJudgement;
import org.apache.ibatis.annotations.Mapper;

/**
 * 判断题Mapper
 *
 * @author shimmerjordan
 * @date 2021/03-16 13:00
 */
@Mapper
public interface SubjectJudgementMapper extends CrudMapper<SubjectJudgement> {

    /**
     * 物理删除
     *
     * @param subjectJudgement subjectJudgement
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:54
     */
    int physicalDelete(SubjectJudgement subjectJudgement);

    /**
     * 物理批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:54
     */
    int physicalDeleteAll(Long[] ids);
}
