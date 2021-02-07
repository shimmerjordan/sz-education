package com.github.shimmerjordan.exam.service;

import com.github.pagehelper.PageInfo;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.exam.api.dto.SubjectDto;
import com.github.shimmerjordan.exam.api.module.SubjectJudgement;
import com.github.shimmerjordan.exam.mapper.SubjectJudgementMapper;
import com.github.shimmerjordan.exam.utils.SubjectUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 判断题Service
 *
 * @author shimmerjordan
 * @date 2021/03-16 13:02
 */
@AllArgsConstructor
@Slf4j
@Service
public class SubjectJudgementService extends CrudService<SubjectJudgementMapper, SubjectJudgement>
        implements ISubjectService {

    /**
     * 根据ID查询
     *
     * @param id id
     * @return SubjectDto
     * @author shimmerjordan
     * @date 2021/03-16 13:06
     */
    @Override
    public SubjectDto getSubject(Long id) {
        return SubjectUtil.subjectJudgementToDto(this.get(id));
    }

    /**
     * 根据上一题ID查询下一题
     *
     * @param examinationId examinationId
     * @param previousId    previousId
     * @param nextType      0：下一题，1：上一题
     * @return SubjectDto
     * @author shimmerjordan
     * @date 2021/04-14 17:03
     */
    @Override
    public SubjectDto getNextByCurrentIdAndType(Long examinationId, Long previousId, Integer nextType) {
        return null;
    }

    /**
     * 查询列表
     *
     * @param subjectDto subjectDto
     * @return List<SubjectDto>
     * @author shimmerjordan
     * @date 2021/03-16 13:08
     */
    @Override
    public List<SubjectDto> findSubjectList(SubjectDto subjectDto) {
        return null;
    }

    /**
     * 查询分页
     *
     * @param pageInfo   pageInfo
     * @param subjectDto subjectDto
     * @return PageInfo<SubjectDto>
     * @author shimmerjordan
     * @date 2021/03-16 13:08
     */
    @Override
    public PageInfo<SubjectDto> findSubjectPage(PageInfo pageInfo, SubjectDto subjectDto) {
        return null;
    }

    /**
     * 根据ID批量查询
     *
     * @param ids ids
     * @return List<SubjectDto>
     * @author shimmerjordan
     * @date 2021/03-16 13:09
     */
    @Override
    public List<SubjectDto> findSubjectListById(Long[] ids) {
        return SubjectUtil.subjectJudgementsToDto(this.findListById(ids));
    }

    /**
     * 保存
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/03-16 13:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectJudgement", key = "#subjectDto.id")
    public int insertSubject(SubjectDto subjectDto) {
        SubjectJudgement subjectJudgement = new SubjectJudgement();
        BeanUtils.copyProperties(subjectDto, subjectJudgement);
        subjectJudgement.setAnswer(subjectDto.getAnswer().getAnswer());
        return this.insert(subjectJudgement);
    }

    /**
     * 更新
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/03-16 13:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectJudgement", key = "#subjectDto.id")
    public int updateSubject(SubjectDto subjectDto) {
        SubjectJudgement subjectJudgement = new SubjectJudgement();
        BeanUtils.copyProperties(subjectDto, subjectJudgement);
        subjectJudgement.setAnswer(subjectDto.getAnswer().getAnswer());
        return this.update(subjectJudgement);
    }

    /**
     * 删除
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/03-16 13:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectJudgement", key = "#subjectDto.id")
    public int deleteSubject(SubjectDto subjectDto) {
        SubjectJudgement subjectJudgement = new SubjectJudgement();
        BeanUtils.copyProperties(subjectDto, subjectJudgement);
        return this.delete(subjectJudgement);
    }

    /**
     * 物理删除题目
     *
     * @param subjectJudgement subjectJudgement
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:58
     */
    @Transactional
    @CacheEvict(value = "subjectJudgement", key = "#subjectJudgement.id")
    public int physicalDelete(SubjectJudgement subjectJudgement) {
        return this.dao.physicalDelete(subjectJudgement);
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03-16 13:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectJudgement", allEntries = true)
    public int deleteAllSubject(Long[] ids) {
        return this.deleteAll(ids);
    }

    /**
     * 批量删除题目
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:58
     */
    @Transactional
    @CacheEvict(value = "subjectJudgement", allEntries = true)
    public int physicalDeleteAll(Long[] ids) {
        return this.dao.physicalDeleteAll(ids);
    }

    /**
     * 物理删除
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/03-16 13:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectJudgement", key = "#subjectDto.id")
    public int physicalDeleteSubject(SubjectDto subjectDto) {
        SubjectJudgement subjectJudgement = new SubjectJudgement();
        BeanUtils.copyProperties(subjectDto, subjectJudgement);
        return this.physicalDelete(subjectJudgement);
    }

    /**
     * 批量物理删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03-16 13:11
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectJudgement", allEntries = true)
    public int physicalDeleteAllSubject(Long[] ids) {
        return this.physicalDeleteAll(ids);
    }
}
