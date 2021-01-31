package com.github.shimmerjordan.auth.mapper;

import com.github.shimmerjordan.auth.api.module.OauthClientDetails;
import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * Oauth2客户端mapper
 *
 * @author shimmerjordan
 * @date 2021/3/30 16:39
 */
@Mapper
public interface OauthClientDetailsMapper extends CrudMapper<OauthClientDetails> {
}
