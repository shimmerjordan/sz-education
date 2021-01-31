package com.github.shimmerjordan.gateway.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.gateway.module.Route;
import org.apache.ibatis.annotations.Mapper;

/**
 * Route mapper
 *
 * @author shimmerjordan
 * @date 2021/4/2 15:00
 */
@Mapper
public interface RouteMapper extends CrudMapper<Route> {
}
