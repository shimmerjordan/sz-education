package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.basic.model.Log;
import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 日志
 *
 * @author shimmerjordan
 * @date 2018/10/31 20:38
 */
@Mapper
public interface LogMapper extends CrudMapper<Log> {
}
