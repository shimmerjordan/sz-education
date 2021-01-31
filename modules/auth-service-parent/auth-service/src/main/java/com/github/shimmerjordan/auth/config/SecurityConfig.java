package com.github.shimmerjordan.auth.config;

import com.github.shimmerjordan.auth.error.CustomOAuth2AccessDeniedHandler;
import com.github.shimmerjordan.auth.security.CustomUserDetailsAuthenticationProvider;
import com.github.shimmerjordan.common.security.core.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerEndpointsConfiguration;
import org.springframework.security.web.access.AccessDeniedHandler;

/**
 * Spring Security配置
 *
 * @author shimmerjordan
 * @date 2021-03-14 14:35
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService userDetailsService;

    @Autowired
    private AuthorizationServerEndpointsConfiguration endpoints;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                // 前后端分离，关闭csrf
                .csrf().disable()
                .authorizeRequests()
                .anyRequest().authenticated();
        // accessDeniedHandler
        http.exceptionHandling()
				.accessDeniedHandler(accessDeniedHandler());
    }

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    @Bean
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authProvider());
    }

    /**
     * 认证Provider，提供获取用户信息、认证、授权等功能
     *
     * @return AuthenticationProvider
     */
    @Bean
    public AuthenticationProvider authProvider() {
        return new CustomUserDetailsAuthenticationProvider(encoder(), userDetailsService);
    }

    @Bean
	public AccessDeniedHandler accessDeniedHandler() {
    	return new CustomOAuth2AccessDeniedHandler();
	}
}

