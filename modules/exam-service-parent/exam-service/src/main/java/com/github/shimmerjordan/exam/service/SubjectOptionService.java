package com.github.shimmerjordan.exam.service;

import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.exam.api.module.SubjectOption;
import com.github.shimmerjordan.exam.mapper.SubjectOptionMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 选择题选项service
 *
 * @author shimmerjordan
 * @date 2021/03/16 15:01
 */
@Service
public class SubjectOptionService extends CrudService<SubjectOptionMapper, SubjectOption> {

    /**
     * 查找题目
     *
     * @param subjectOption subjectOption
     * @return SubjectOption
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    @Override
    public SubjectOption get(SubjectOption subjectOption) {
        return super.get(subjectOption);
    }

    /**
     * 根据题目ID查找
     *
     * @param subjectOption subjectOption
     * @return List
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    public List<SubjectOption> getBySubjectChoicesId(SubjectOption subjectOption) {
        return this.dao.getBySubjectChoicesId(subjectOption);
    }

    /**
     * 新增
     *
     * @param subjectOption subjectOption
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    @Override
    @Transactional
    public int insert(SubjectOption subjectOption) {
        return super.insert(subjectOption);
    }

    /**
     * 批量保存
     *
     * @param subjectOptionList subjectOptionList
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    @Transactional
    public int insertBatch(List<SubjectOption> subjectOptionList) {
        return this.dao.insertBatch(subjectOptionList);
    }

    /**
     * 更新题目
     *
     * @param subjectOption subjectOption
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    @Override
    @Transactional
    public int update(SubjectOption subjectOption) {
        return super.update(subjectOption);
    }

    /**
     * 删除题目
     *
     * @param subjectOption subjectOption
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    @Override
    @Transactional
    public int delete(SubjectOption subjectOption) {
        return super.delete(subjectOption);
    }

    /**
     * 根据选择题ID删除
     *
     * @param subjectOption subjectOption
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 21:56
     */
    @Transactional
    public int deleteBySubjectChoicesId(SubjectOption subjectOption) {
        return this.dao.deleteBySubjectChoicesId(subjectOption);
    }

    /**
     * 批量删除题目
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 15:01
     */
    @Override
    @Transactional
    public int deleteAll(Long[] ids) {
        return super.deleteAll(ids);
    }

    /**
     * 物理批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/03/16 22:40
     */
    @Transactional
    public int physicalDeleteAll(Long[] ids) {
        return this.dao.physicalDeleteAll(ids);
    }
}
