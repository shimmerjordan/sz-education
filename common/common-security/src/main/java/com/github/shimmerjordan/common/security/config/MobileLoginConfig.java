package com.github.shimmerjordan.common.security.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.shimmerjordan.common.security.core.CustomUserDetailsService;
import com.github.shimmerjordan.common.security.mobile.MobileLoginSuccessHandler;
import com.github.shimmerjordan.common.security.mobile.MobileSecurityConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.ClientDetailsService;
import org.springframework.security.oauth2.provider.token.AuthorizationServerTokenServices;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

/**
 * 手机号登录配置
 *
 * @author shimmerjordan
 * @date 2021/03/23 15:18
 */
@Configuration
public class MobileLoginConfig {

    /**
     * 配置手机号登录
     * 采用懒加载是因为只有认证授权服务需要手机登录的相关配置
     *
     * @return MobileSecurityConfigurer
     */
    @Bean
    public MobileSecurityConfigurer mobileSecurityConfigurer(@Lazy PasswordEncoder encoder, @Lazy ClientDetailsService clientDetailsService,
                                                             @Lazy CustomUserDetailsService userDetailsService, @Lazy ObjectMapper objectMapper,
                                                             @Lazy AuthorizationServerTokenServices defaultAuthorizationServerTokenServices) {
        MobileSecurityConfigurer mobileSecurityConfigurer = new MobileSecurityConfigurer();
        mobileSecurityConfigurer.setMobileLoginSuccessHandler(mobileLoginSuccessHandler(encoder, clientDetailsService, objectMapper, defaultAuthorizationServerTokenServices));
        mobileSecurityConfigurer.setUserDetailsService(userDetailsService);
        return mobileSecurityConfigurer;
    }

    /**
     * 手机登录成功后的处理
     *
     * @return AuthenticationSuccessHandler
     */
    @Bean
    public AuthenticationSuccessHandler mobileLoginSuccessHandler(PasswordEncoder encoder, ClientDetailsService clientDetailsService, ObjectMapper objectMapper,
                                                                  AuthorizationServerTokenServices defaultAuthorizationServerTokenServices) {
        return MobileLoginSuccessHandler.builder()
                .objectMapper(objectMapper)
                .clientDetailsService(clientDetailsService)
                .passwordEncoder(encoder)
                .defaultAuthorizationServerTokenServices(defaultAuthorizationServerTokenServices).build();
    }
}
