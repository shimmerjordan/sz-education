package com.github.shimmerjordan.oss.exceptions;

import com.github.shimmerjordan.common.core.exceptions.CommonException;

/**
 * oss exception
 * @author shimmerjordan
 * @date 2021/02/28 8:41
 */
public class OssException extends CommonException {

	public OssException(String msg) {
		super(msg);
	}

	public OssException(Throwable throwable, String msg) {
		super(throwable, msg);
	}
}
