package com.github.shimmerjordan.common.security.event;

import lombok.Data;
import org.springframework.context.ApplicationEvent;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;

/**
 *
 * 登录失败事件
 *
 * @author shimmerjordan
 * @date 2021/04/11 23:46
 */
@Data
public class CustomAuthenticationFailureEvent extends ApplicationEvent {

	private UserDetails userDetails;

	public CustomAuthenticationFailureEvent(Authentication authentication, UserDetails userDetails) {
		super(authentication);
		this.userDetails = userDetails;
	}

}
