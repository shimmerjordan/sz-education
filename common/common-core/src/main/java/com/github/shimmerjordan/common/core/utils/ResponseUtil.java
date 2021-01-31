package com.github.shimmerjordan.common.core.utils;

import com.github.shimmerjordan.common.core.constant.ApiMsg;
import com.github.shimmerjordan.common.core.model.ResponseBean;

/**
 * @author shimmerjordan
 * @date 2021-10-08 12:03
 */
public class ResponseUtil {

	private ResponseUtil() {
	}

	/**
	 * 是否成功
	 * @param responseBean responseBean
	 * @return boolean
	 */
	public static boolean isSuccess(ResponseBean<?> responseBean) {
		return responseBean != null && responseBean.getCode() == ApiMsg.KEY_SUCCESS;
	}
}
