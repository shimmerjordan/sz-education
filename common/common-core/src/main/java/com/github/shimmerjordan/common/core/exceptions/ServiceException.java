package com.github.shimmerjordan.common.core.exceptions;

/**
 *
 * 服务异常
 *
 * @author shimmerjordan
 * @date 2021/03/08 12:56
 */
public class ServiceException extends CommonException {

	private static final long serialVersionUID = -7285211528095468156L;

	public ServiceException() {
	}

	public ServiceException(String msg) {
		super(msg);
	}
}
