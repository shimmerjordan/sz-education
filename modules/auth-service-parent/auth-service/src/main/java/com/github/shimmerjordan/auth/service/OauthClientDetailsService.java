package com.github.shimmerjordan.auth.service;

import com.github.shimmerjordan.auth.api.module.OauthClientDetails;
import com.github.shimmerjordan.auth.mapper.OauthClientDetailsMapper;
import com.github.shimmerjordan.common.core.service.CrudService;
import org.springframework.stereotype.Service;

/**
 * Oauth2客户端Service
 *
 * @author shimmerjordan
 * @date 2021/3/30 16:48
 */
@Service
public class OauthClientDetailsService extends CrudService<OauthClientDetailsMapper, OauthClientDetails> {
}
