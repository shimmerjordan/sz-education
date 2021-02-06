package com.github.shimmerjordan.common.core.exceptions;

/**
 * 公共异常
 *
 * @author shimmerjordan
 * @date 2021/03/16 20:28
 */
public class CommonException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public CommonException() {

    }

    public CommonException(String msg) {
        super(msg);
    }

    public CommonException(Throwable throwable) {
        super(throwable);
    }

    public CommonException(Throwable throwable, String msg) {
        super(throwable);
    }
}
