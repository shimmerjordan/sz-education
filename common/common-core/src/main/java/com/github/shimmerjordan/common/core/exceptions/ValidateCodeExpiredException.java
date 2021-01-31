package com.github.shimmerjordan.common.core.exceptions;

/**
 * 验证码过期异常
 *
 * @author shimmerjordan
 * @date 2021/3/29 12:07
 */
public class ValidateCodeExpiredException extends CommonException {

    private static final long serialVersionUID = -7285211528095468156L;

    public ValidateCodeExpiredException() {
    }

    public ValidateCodeExpiredException(String msg) {
        super(msg);
    }
}
