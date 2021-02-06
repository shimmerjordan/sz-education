package com.github.shimmerjordan.exam.service;

import com.github.pagehelper.PageInfo;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import com.github.shimmerjordan.exam.api.constants.AnswerConstant;
import com.github.shimmerjordan.exam.api.dto.SubjectDto;
import com.github.shimmerjordan.exam.api.module.ExaminationSubject;
import com.github.shimmerjordan.exam.api.module.SubjectChoices;
import com.github.shimmerjordan.exam.api.module.SubjectOption;
import com.github.shimmerjordan.exam.mapper.SubjectChoicesMapper;
import com.github.shimmerjordan.exam.utils.AnswerHandlerUtil;
import com.github.shimmerjordan.exam.utils.SubjectUtil;
import lombok.AllArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 选择题service
 *
 * @author shimmerjordan
 * @date 2021/05/8 21:23
 */
@AllArgsConstructor
@Service
public class SubjectChoicesService extends CrudService<SubjectChoicesMapper, SubjectChoices>
        implements ISubjectService {

    private final SubjectOptionService subjectOptionService;

    private final ExaminationSubjectService examinationSubjectService;

    /**
     * 查找题目
     *
     * @param subjectChoices subjectChoices
     * @return SubjectChoices
     * @author shimmerjordan
     * @date 2021/1/3 14:24
     */
    @Override
    @Cacheable(value = "subjectChoices#" + CommonConstant.CACHE_EXPIRE, key = "#subjectChoices.id")
    public SubjectChoices get(SubjectChoices subjectChoices) {
        SubjectChoices subject = super.get(subjectChoices);
        // 查找选项信息
        if (subject != null) {
            SubjectOption subjectOption = new SubjectOption();
            subjectOption.setSubjectChoicesId(subject.getId());
            List<SubjectOption> options = subjectOptionService.getBySubjectChoicesId(subjectOption);
            subject.setOptions(options);
        }
        return subject;
    }

    /**
     * 根据考试ID查询题目数
     *
     * @param subjectChoices subjectChoices
     * @return int
     * @author shimmerjordan
     * @date 2021/01/23 20:19
     */
    int getExaminationTotalSubject(SubjectChoices subjectChoices) {
        return 0;
    }

    /**
     * 新增
     *
     * @param subjectChoices subjectChoices
     * @return int
     * @author shimmerjordan
     * @date 2021/01/23 20:03
     */
    @Override
    @Transactional
    public int insert(SubjectChoices subjectChoices) {
        return super.insert(subjectChoices);
    }

    /**
     * 更新题目
     *
     * @param subjectChoices subjectChoices
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:24
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectChoices", key = "#subjectChoices.id")
    public int update(SubjectChoices subjectChoices) {
        // 更新选项
        this.insertOptions(subjectChoices);
        return super.update(subjectChoices);
    }

    /**
     * 根据ID查询
     *
     * @param examinationId  examinationId
     * @param subjectChoices subjectChoices
     * @return SubjectChoices
     * @author shimmerjordan
     * @date 2021/09-14 16:47
     */
    public SubjectChoices getByCurrentId(Long examinationId, SubjectChoices subjectChoices) {
        ExaminationSubject examinationSubject = new ExaminationSubject();
        examinationSubject.setExaminationId(examinationId);
        examinationSubject.setSubjectId(subjectChoices.getId());
        examinationSubject = examinationSubjectService.findByExaminationIdAndSubjectId(examinationSubject);
        if (examinationSubject == null)
            return null;
        return this.getSubjectChoicesById(examinationSubject.getSubjectId());
    }

    /**
     * 根据上一题ID查询下一题
     *
     * @param examinationId  examinationId
     * @param subjectChoices subjectChoices
     * @return SubjectChoices
     * @author shimmerjordan
     * @date 2021/09-14 16:47
     */
    public SubjectChoices getByPreviousId(Long examinationId, SubjectChoices subjectChoices) {
        ExaminationSubject examinationSubject = new ExaminationSubject();
        examinationSubject.setExaminationId(examinationId);
        examinationSubject.setSubjectId(subjectChoices.getId());
        examinationSubject = examinationSubjectService.getByPreviousId(examinationSubject);
        if (examinationSubject == null)
            return null;
        return this.getSubjectChoicesById(examinationSubject.getSubjectId());
    }

    /**
     * 根据当前题目ID查询上一题
     *
     * @param examinationId  examinationId
     * @param subjectChoices subjectChoices
     * @return SubjectChoices
     * @author shimmerjordan
     * @date 2021/10/07 20:40:16
     */
    public SubjectChoices getPreviousByCurrentId(Long examinationId, SubjectChoices subjectChoices) {
        ExaminationSubject examinationSubject = new ExaminationSubject();
        examinationSubject.setExaminationId(examinationId);
        examinationSubject.setSubjectId(subjectChoices.getId());
        examinationSubject = examinationSubjectService.getPreviousByCurrentId(examinationSubject);
        if (examinationSubject == null)
            return null;
        return this.getSubjectChoicesById(examinationSubject.getSubjectId());
    }

    /**
     * 删除题目
     *
     * @param subjectChoices subjectChoices
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:24
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectChoices", key = "#subjectChoices.id")
    public int delete(SubjectChoices subjectChoices) {
        int update;
        if ((update = super.delete(subjectChoices)) > 0)
            this.deleteOptionAndRelation(subjectChoices.getId());
        return update;
    }

    /**
     * 物理删除
     *
     * @param subjectChoices subjectChoices
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:44
     */
    @Transactional
    @CacheEvict(value = "subjectChoices", key = "#subjectChoices.id")
    public int physicalDelete(SubjectChoices subjectChoices) {
        int update;
        if ((update = this.dao.physicalDelete(subjectChoices)) > 0)
            this.deleteOptionAndRelation(subjectChoices.getId());
        return update;
    }

    /**
     * 批量删除题目
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:24
     */
    @Override
    @Transactional
    @CacheEvict(value = "subjectChoices", allEntries = true)
    public int deleteAll(Long[] ids) {
        int update;
        if ((update = super.deleteAll(ids)) > 0) {
            for (Long id : ids)
                this.deleteOptionAndRelation(id);
        }
        return update;
    }

    /**
     * 物理批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:44
     */
    @Transactional
    @CacheEvict(value = "subjectChoices", allEntries = true)
    public int physicalDeleteAll(Long[] ids) {
        int update;
        if ((update = this.dao.physicalDeleteAll(ids)) > 0) {
            for (Long id : ids)
                this.deleteOptionAndRelation(id);
        }
        return update;
    }

    /**
     * 删除题目的选项和与考试的关联
     *
     * @param subjectId subjectId
     * @author shimmerjordan
     * @date 2021/06/16 22:09
     */
    @Transactional
    public void deleteOptionAndRelation(Long subjectId) {
        // 删除选项
        SubjectOption option = new SubjectOption();
        option.setSubjectChoicesId(subjectId);
        subjectOptionService.deleteBySubjectChoicesId(option);
        // 删除关联关系
        ExaminationSubject examinationSubject = new ExaminationSubject();
        examinationSubject.setSubjectId(subjectId);
        examinationSubjectService.deleteBySubjectId(examinationSubject);
    }

    /**
     * 根据ID查询
     *
     * @param id id
     * @return SubjectDto
     * @author shimmerjordan
     * @date 2021/06/16 17:36
     */
    @Override
    public SubjectDto getSubject(Long id) {
        SubjectChoices subject = this.get(id);
        // 查找选项信息
        if (subject != null) {
            SubjectOption subjectOption = new SubjectOption();
            subjectOption.setSubjectChoicesId(subject.getId());
            List<SubjectOption> options = subjectOptionService.getBySubjectChoicesId(subjectOption);
            subject.setOptions(options);
        }
        return SubjectUtil.subjectChoicesToDto(subject, true);
    }

    /**
     * 根据上一题ID查询下一题
     *
     * @param examinationId examinationId
     * @param previousId    previousId
     * @param nextType      0：下一题，1：上一题
     * @return SubjectDto
     * @author shimmerjordan
     * @date 2021/09/14 16:35
     */
    @Override
    @Transactional
    public SubjectDto getNextByCurrentIdAndType(Long examinationId, Long previousId, Integer nextType) {
        SubjectChoices subjectChoices = new SubjectChoices();
        subjectChoices.setId(previousId);
        if (AnswerConstant.CURRENT.equals(nextType)) {
            subjectChoices = this.getByCurrentId(examinationId, subjectChoices);
        } else if (AnswerConstant.NEXT.equals(nextType)) {
            subjectChoices = this.getByPreviousId(examinationId, subjectChoices);
        } else {
            subjectChoices = this.getPreviousByCurrentId(examinationId, subjectChoices);
        }
        return SubjectUtil.subjectChoicesToDto(subjectChoices, true);
    }

    /**
     * 保存
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 17:50
     */
    @Override
    @Transactional
	@CacheEvict(value = "subjectChoices", key = "#subjectDto.id")
	public int insertSubject(SubjectDto subjectDto) {
        SubjectChoices subjectChoices = new SubjectChoices();
        BeanUtils.copyProperties(subjectDto, subjectChoices);
        subjectChoices.setAnswer(subjectDto.getAnswer().getAnswer());
        subjectChoices.setChoicesType(subjectDto.getType());
        insertOptions(subjectChoices);
        return this.insert(subjectChoices);
    }

    /**
     * 保存选项
     * @param subjectChoices subjectChoices
     * @author shimmerjordan
     * @date 2020/01/17 22:30:48
     */
    @Transactional
    public void insertOptions(SubjectChoices subjectChoices) {
        if (CollectionUtils.isNotEmpty(subjectChoices.getOptions())) {
            SubjectOption subjectOption = new SubjectOption();
            subjectOption.setSubjectChoicesId(subjectChoices.getId());
            subjectOptionService.deleteBySubjectChoicesId(subjectOption);
            // 初始化
            subjectChoices.getOptions().forEach(option -> {
                option.setCommonValue(subjectChoices.getCreator(), subjectChoices.getApplicationCode(),
                        subjectChoices.getTenantCode());
                option.setSubjectChoicesId(subjectChoices.getId());
            });
            // 批量插入
            subjectOptionService.insertBatch(subjectChoices.getOptions());
        }
    }

    /**
     * 更新，包括更新选项
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 17:50
     */
    @Override
    @Transactional
	@CacheEvict(value = "subjectChoices", key = "#subjectDto.id")
	public int updateSubject(SubjectDto subjectDto) {
        SubjectChoices subjectChoices = new SubjectChoices();
        BeanUtils.copyProperties(subjectDto, subjectChoices);
        subjectChoices.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        // 参考答案
        subjectChoices.setAnswer(AnswerHandlerUtil.replaceComma(subjectDto.getAnswer().getAnswer()));
        return this.update(subjectChoices);
    }

    /**
     * 删除
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 17:50
     */
    @Override
    @Transactional
	@CacheEvict(value = "subjectChoices", key = "#subjectDto.id")
	public int deleteSubject(SubjectDto subjectDto) {
        SubjectChoices subjectChoices = new SubjectChoices();
        BeanUtils.copyProperties(subjectDto, subjectChoices);
        return this.delete(subjectChoices);
    }

    /**
     * 物理删除
     *
     * @param subjectDto subjectDto
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:50
     */
    @Override
    @Transactional
	@CacheEvict(value = "subjectChoices", key = "#subjectDto.id")
	public int physicalDeleteSubject(SubjectDto subjectDto) {
        SubjectChoices subjectChoices = new SubjectChoices();
        BeanUtils.copyProperties(subjectDto, subjectChoices);
        return this.physicalDelete(subjectChoices);
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 17:50
     */
    @Override
    @Transactional
	@CacheEvict(value = "subjectChoices", allEntries = true)
	public int deleteAllSubject(Long[] ids) {
        return this.deleteAll(ids);
    }

    /**
     * 物理删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/06/16 22:51
     */
    @Override
    @Transactional
	@CacheEvict(value = "subjectChoices", allEntries = true)
	public int physicalDeleteAllSubject(Long[] ids) {
        return this.physicalDeleteAll(ids);
    }

    /**
     * 查询列表
     *
     * @param subjectDto subjectDto
     * @return List
     * @author shimmerjordan
     * @date 2021/06/16 18:16
     */
    @Override
    public List<SubjectDto> findSubjectList(SubjectDto subjectDto) {
        SubjectChoices subjectChoices = new SubjectChoices();
        BeanUtils.copyProperties(subjectDto, subjectChoices);
        return SubjectUtil.subjectChoicesToDto(this.findList(subjectChoices), true);
    }

    /**
     * 查询分页列表
     *
     * @param pageInfo   pageInfo
     * @param subjectDto subjectDto
     * @return PageInfo
     * @author shimmerjordan
     * @date 2021/06/16 18:16
     */
    @Override
    public PageInfo<SubjectDto> findSubjectPage(PageInfo pageInfo, SubjectDto subjectDto) {
        SubjectChoices subjectChoices = new SubjectChoices();
        BeanUtils.copyProperties(subjectDto, subjectChoices);
        // 选择题类型：单选或多选
        if (subjectDto.getType() != null)
            subjectChoices.setChoicesType(subjectDto.getType());
        PageInfo<SubjectChoices> subjectChoicesPageInfo = this.findPage(pageInfo, subjectChoices);
        List<SubjectDto> subjectDtos = SubjectUtil.subjectChoicesToDto(subjectChoicesPageInfo.getList(), true);
        PageInfo<SubjectDto> subjectDtoPageInfo = new PageInfo<>();
        subjectDtoPageInfo.setList(subjectDtos);
        subjectDtoPageInfo.setTotal(subjectChoicesPageInfo.getTotal());
        subjectDtoPageInfo.setPageSize(subjectChoicesPageInfo.getPageSize());
        subjectDtoPageInfo.setPageNum(subjectChoicesPageInfo.getPageNum());
        return subjectDtoPageInfo;
    }

    /**
     * 根据ID批量查询
     *
     * @param ids ids
     * @return List
     * @author shimmerjordan
     * @date 2021/06/16 18:16
     */
    @Override
    public List<SubjectDto> findSubjectListById(Long[] ids) {
        return SubjectUtil.subjectChoicesToDto(this.findListById(ids), true);
    }

    /**
     * 根据题目ID查询题目信息和选项
     *
     * @param subjectId subjectId
     * @return SubjectChoices
     * @author shimmerjordan
     * @date 2021/10/07 21:03:43
     */
    private SubjectChoices getSubjectChoicesById(Long subjectId) {
        SubjectChoices subjectChoices = new SubjectChoices();
        subjectChoices.setId(subjectId);
        subjectChoices = this.get(subjectChoices);
        SubjectOption subjectOption = new SubjectOption();
        subjectOption.setSubjectChoicesId(subjectChoices.getId());
        List<SubjectOption> options = subjectOptionService.getBySubjectChoicesId(subjectOption);
        subjectChoices.setOptions(options);
        return subjectChoices;
    }
}
