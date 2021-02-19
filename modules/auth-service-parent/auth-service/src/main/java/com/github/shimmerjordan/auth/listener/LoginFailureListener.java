package com.github.shimmerjordan.auth.listener;

import com.github.shimmerjordan.common.security.event.CustomAuthenticationFailureEvent;
import com.github.shimmerjordan.user.api.feign.UserServiceClient;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

/**
 *
 * 处理登录失败事件
 *
 * @author shimmerjordan
 * @date 2021/04/11 23:52
 */
@Slf4j
@AllArgsConstructor
@Component
public class LoginFailureListener implements ApplicationListener<CustomAuthenticationFailureEvent> {

	private final UserServiceClient userServiceClient;

	@Override
	public void onApplicationEvent(CustomAuthenticationFailureEvent event) {
		// 登录失败后的处理

	}
}
