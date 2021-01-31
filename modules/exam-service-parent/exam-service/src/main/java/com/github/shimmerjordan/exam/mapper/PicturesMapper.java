package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.Pictures;
import org.apache.ibatis.annotations.Mapper;

/**
 * 图片mapper
 *
 * @author shimmerjordan
 * @date 2021/6/16 14:50
 */
@Mapper
public interface PicturesMapper extends CrudMapper<Pictures> {
}
