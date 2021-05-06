package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.dto.SubjectDto;
import com.github.shimmerjordan.exam.api.module.ExaminationSubject;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 考试题目关联mapper
 *
 * @author shimmerjordan
 * @date 2021/03/16 15:37
 */
@Mapper
public interface ExaminationSubjectMapper extends CrudMapper<ExaminationSubject> {

    /**
     * 根据题目ID删除
     *
     * @param examinationSubject examinationSubject
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 21:58
     */
    int deleteBySubjectId(ExaminationSubject examinationSubject);

    /**
     * 根据题目ID查询
     *
     * @param examinationSubject examinationSubject
     * @return List
     * @author shimmerjordan
     * @date 2021/03/17 12:18
     */
    List<ExaminationSubject> findListBySubjectId(ExaminationSubject examinationSubject);

    /**
     * 自动组卷Auto1
     *
     * @param examinationId examinationId
     * @return List
     * @author shimmerjordan
     * @date 2021/04/27 17:15
     */
    List<Long> findListByAuto1(Long examinationId);

    /**
     * 根据考试id查询题目id列表
     *
     * @param examinationId examinationId
     * @return List
     * @author shimmerjordan
     * @date 2021/03/18 14:37
     */
    List<ExaminationSubject> findListByExaminationId(Long examinationId);

    /**
     * 根据考试ID和题目序号查询
     *
     * @param examinationSubject examinationSubject
     * @return ExaminationSubject
     * @author shimmerjordan
     * @date 2021/03/18 23:17
     */
    ExaminationSubject findByExaminationIdAndSubjectId(ExaminationSubject examinationSubject);

    /**
     * 根据上一题ID查询下一题
     *
     * @param examinationSubject examinationSubject
     * @return ExaminationSubject
     * @author shimmerjordan
     * @date 2021/04/14 16:41
     */
    ExaminationSubject getByPreviousId(ExaminationSubject examinationSubject);

    /**
     * 根据当前题目ID查询上一题
     *
     * @param examinationSubject examinationSubject
     * @return ExaminationSubject
     * @author shimmerjordan
     * @date 2021/04/07 20:40:16
     */
    ExaminationSubject getPreviousByCurrentId(ExaminationSubject examinationSubject);

    /**
     * 根据分类id查询
     *
     * @param examinationSubject examinationSubject
     * @return List
     * @author shimmerjordan
     * @date 2021/04/24 21:47:24
     */
    List<ExaminationSubject> findListByCategoryId(ExaminationSubject examinationSubject);
}
