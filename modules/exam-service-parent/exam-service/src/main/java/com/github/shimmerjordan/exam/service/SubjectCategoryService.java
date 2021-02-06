package com.github.shimmerjordan.exam.service;

import cn.hutool.core.collection.CollUtil;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.common.core.utils.TreeUtil;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import com.github.shimmerjordan.exam.api.dto.SubjectCategoryDto;
import com.github.shimmerjordan.exam.api.module.SubjectCategory;
import com.github.shimmerjordan.exam.mapper.SubjectCategoryMapper;
import org.apache.commons.collections4.CollectionUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 题目分类service
 *
 * @author shimmerjordan
 * @date 2020/12/4 21:56
 */
@Service
public class SubjectCategoryService extends CrudService<SubjectCategoryMapper, SubjectCategory> {

    /**
     * 查找题目分类
     *
     * @param subjectCategory subjectCategory
     * @return SubjectCategory
     * @author shimmerjordan
     * @date 2021/1/3 14:21
     */
    @Override
    @Cacheable(value = "category#" + CommonConstant.CACHE_EXPIRE, key = "#subjectCategory.id")
    public SubjectCategory get(SubjectCategory subjectCategory) {
        return super.get(subjectCategory);
    }

    /**
     * 更新题目分类
     *
     * @param subjectCategory subjectCategory
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:21
     */
    @Override
    @Transactional
    @CacheEvict(value = "category", key = "#subjectCategory.id")
    public int update(SubjectCategory subjectCategory) {
        return super.update(subjectCategory);
    }

    /**
     * 删除题目分类
     *
     * @param subjectCategory subjectCategory
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:21
     */
    @Override
    @Transactional
    @CacheEvict(value = "category", key = "#subjectCategory.id")
    public int delete(SubjectCategory subjectCategory) {
        return super.delete(subjectCategory);
    }

    /**
     * 批量删除题目分类
     *
     * @param ids ids
     * @return int
     * @author shimmerjordan
     * @date 2021/1/3 14:23
     */
    @Override
    @Transactional
    @CacheEvict(value = "category", allEntries = true)
    public int deleteAll(Long[] ids) {
        return super.deleteAll(ids);
    }

	/**
	 * 返回树形分类集合
	 *
	 * @return List
	 * @author shimmerjordan
	 * @date 2020/12/04 22:03
	 */
    public List<SubjectCategoryDto> menus() {
		SubjectCategory subjectCategory = new SubjectCategory();
		subjectCategory.setTenantCode(SysUtil.getTenantCode());
		// 查询所有分类
		List<SubjectCategory> subjectCategoryList = findList(subjectCategory);
		if (CollectionUtils.isNotEmpty(subjectCategoryList)) {
			// 转成dto
			List<SubjectCategoryDto> subjectCategorySetTreeList = subjectCategoryList.stream().map(SubjectCategoryDto::new).distinct().collect(
					Collectors.toList());
			// 排序、组装树形结构
			return TreeUtil.buildTree(CollUtil.sort(subjectCategorySetTreeList, Comparator.comparingInt(SubjectCategoryDto::getSort)), CommonConstant.ROOT);
		}
		return new ArrayList<>();
	}
}
