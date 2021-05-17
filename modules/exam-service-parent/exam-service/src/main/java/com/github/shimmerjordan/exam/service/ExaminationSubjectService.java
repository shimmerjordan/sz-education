package com.github.shimmerjordan.exam.service;

import com.github.pagehelper.PageInfo;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.exam.api.dto.ExaminationDto;
import com.github.shimmerjordan.exam.api.dto.SubjectDto;
import com.github.shimmerjordan.exam.api.module.Course;
import com.github.shimmerjordan.exam.api.module.ExaminationSubject;
import com.github.shimmerjordan.exam.mapper.ExaminationSubjectMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 考试题目关联service
 *
 * @author shimmerjordan
 * @date 2021/03/16 15:38
 */
@AllArgsConstructor
@Service
public class ExaminationSubjectService extends CrudService<ExaminationSubjectMapper, ExaminationSubject> {

    @Override
    public PageInfo<ExaminationSubject> findPage(PageInfo<ExaminationSubject> page, ExaminationSubject entity) {
        return super.findPage(page, entity);
    }

    /**
     * 遗传算法组卷进化操作
     *
     * @param spe examinationDto
     * @return List
     * @author shimmerjordan
     * @date 2021/04/28 15:36
     */
    public List<Long> evolveSpecies(ExaminationDto spe) {
        ExaminationSubject newExaminationSubject = new ExaminationSubject();
        Long examinationId = 0L;
        int backboneratention = 0;
        boolean backbone = true;
        if(backbone){
            backboneratention = 1;  //保留上一代最优秀个体
            Course eligible = spe.getCourse();
            eligible.setId(0L);
            Long temp = eligible.getId();
            newExaminationSubject.setSubjectId(temp);
        }
        for(int i = backboneratention; i < newExaminationSubject.hashCode(); i++){
            //选择优秀的父代

        }


        return this.dao.findListByAuto1(examinationId);
    }

    /**
     * 根据题目ID删除
     *
     * @param examinationSubject examinationSubject
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 21:56
     */
    @Transactional
    public int deleteBySubjectId(ExaminationSubject examinationSubject) {
        return this.dao.deleteBySubjectId(examinationSubject);
    }

    /**
     * 根据题目ID查询
     *
     * @param examinationSubject examinationSubject
     * @return List
     * @author shimmerjordan
     * @date 2021/03/17 12:18
     */
    public List<ExaminationSubject> findListBySubjectId(ExaminationSubject examinationSubject) {
        return this.dao.findListBySubjectId(examinationSubject);
    }

    /**
     * 自动组卷Auto1
     *
     * @param examinationId examinationId
     * @return List
     * @author shimmerjordan
     * @date 2021/04/27 15:36
     */
    public List<Long> findListByAuto1(Long examinationId) {
        return this.dao.findListByAuto1(examinationId);
    }

    /**
     * 根据考试id查询题目id列表
     *
     * @param examinationId examinationId
     * @return int
     * @author shimmerjordan
     * @date 2021/03/18 14:35
     */
    public List<ExaminationSubject> findListByExaminationId(Long examinationId) {
        return this.dao.findListByExaminationId(examinationId);
    }

    /**
     * 根据考试ID和题目ID查询
     *
     * @param examinationSubject examinationSubject
     * @return ExaminationSubject
     * @author shimmerjordan
     * @date 2021/03/18 23:17
     */
    public ExaminationSubject findByExaminationIdAndSubjectId(ExaminationSubject examinationSubject) {
        return this.dao.findByExaminationIdAndSubjectId(examinationSubject);
    }

    /**
     * 根据上一题ID查询下一题
     *
     * @param examinationSubject examinationSubject
     * @return ExaminationSubject
     * @author shimmerjordan
     * @date 2021/04/07 20:59:43
     */
    public ExaminationSubject getByPreviousId(ExaminationSubject examinationSubject) {
        return this.dao.getByPreviousId(examinationSubject);
    }

    /**
     * 根据当前题目ID查询上一题
     *
     * @param examinationSubject examinationSubject
     * @return ExaminationSubject
     * @author shimmerjordan
     * @date 2021/04/07 20:59:43
     */
    public ExaminationSubject getPreviousByCurrentId(ExaminationSubject examinationSubject) {
        return this.dao.getPreviousByCurrentId(examinationSubject);
    }

    /**
     * 根据分类id查询
     *
     * @param examinationSubject examinationSubject
     * @return List
     * @author shimmerjordan
     * @date 2021/04/24 21:47:24
     */
    public List<ExaminationSubject> findListByCategoryId(ExaminationSubject examinationSubject) {
        return this.dao.findListByCategoryId(examinationSubject);
    }
}
