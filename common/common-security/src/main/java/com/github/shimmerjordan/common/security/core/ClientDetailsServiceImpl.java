package com.github.shimmerjordan.common.security.core;

import org.springframework.security.oauth2.common.exceptions.InvalidClientException;
import org.springframework.security.oauth2.provider.ClientDetails;
import org.springframework.security.oauth2.provider.client.JdbcClientDetailsService;

import javax.sql.DataSource;

/**
 * jdbc客户端service
 *
 * @author shimmerjordan
 * @date 2021/03/30 23:30
 */
public class ClientDetailsServiceImpl extends JdbcClientDetailsService {

    public ClientDetailsServiceImpl(DataSource dataSource) {
        super(dataSource);
    }

    /**
     * 重写方法
     *
     * @param clientId clientId
     * @return ClientDetails
     * @author shimmerjordan
     * @date 2021/03/30 23:31
     */
    @Override
    public ClientDetails loadClientByClientId(String clientId) throws InvalidClientException {
        return super.loadClientByClientId(clientId);
    }
}
