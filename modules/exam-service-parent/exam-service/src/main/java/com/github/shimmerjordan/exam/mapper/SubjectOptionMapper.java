package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.SubjectOption;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 选择题Mapper
 *
 * @author shimmerjordan
 * @date 2021/6/16 14:55
 */
@Mapper
public interface SubjectOptionMapper extends CrudMapper<SubjectOption> {

    /**
     * 根据题目ID查找
     *
     * @param subjectOption subjectOption
     * @return List
     * @author shimmerjordan
     * @date 2021/6/16 14:55
     */
    List<SubjectOption> getBySubjectChoicesId(SubjectOption subjectOption);

    /**
     * 批量保存
     *
     * @param subjectOptionList subjectOptionList
     * @return int
     * @author shimmerjordan
     * @date 2021/6/16 14:55
     */
    int insertBatch(List<SubjectOption> subjectOptionList);

    /**
     * 根据选择题ID删除
     *
     * @param subjectOption subjectOption
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 21:54
     */
    int deleteBySubjectChoicesId(SubjectOption subjectOption);

    /**
     * 物理批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:40
     */
    int physicalDeleteAll(Long[] ids);
}
