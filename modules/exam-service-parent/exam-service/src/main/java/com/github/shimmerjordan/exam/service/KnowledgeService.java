package com.github.shimmerjordan.exam.service;

import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.exam.api.module.Knowledge;
import com.github.shimmerjordan.exam.mapper.KnowledgeMapper;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 知识库service
 *
 * @author shimmerjordan
 * @date 2021/1/1 15:09
 */
@Service
public class KnowledgeService extends CrudService<KnowledgeMapper, Knowledge> {

    /**
     * 获取知识库信息
     *
     * @param knowledge knowledge
     * @return Knowledge
     * @author shimmerjordan
     * @date 2021/1/1 15:09
     */
    @Override
    @Cacheable(value = "knowledge#" + CommonConstant.CACHE_EXPIRE, key = "#knowledge.id")
    public Knowledge get(Knowledge knowledge) {
        return super.get(knowledge);
    }

    /**
     * 更新知识库信息
     *
     * @param knowledge knowledge
     * @return int
     * @author shimmerjordan
     * @date 2021/1/1 15:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "knowledge", key = "#knowledge.id")
    public int update(Knowledge knowledge) {
        return super.update(knowledge);
    }

    /**
     * 删除知识库信息
     *
     * @param knowledge knowledge
     * @return int
     * @author shimmerjordan
     * @date 2021/1/1 15:10
     */
    @Override
    @Transactional
    @CacheEvict(value = "knowledge", key = "#knowledge.id")
    public int delete(Knowledge knowledge) {
        return super.delete(knowledge);
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:15
     */
    @Override
    @Transactional
    @CacheEvict(value = "knowledge", allEntries = true)
    public int deleteAll(Long[] ids) {
        return super.deleteAll(ids);
    }
}
