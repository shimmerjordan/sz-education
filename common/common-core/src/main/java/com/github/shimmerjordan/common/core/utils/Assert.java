package com.github.shimmerjordan.common.core.utils;

/**
 * @author shimmerjordan
 * @date 2021/01/23 19:59
 */
public class Assert {

    /**
     * 非空校验
     *
     * @param object  object
     * @param message message
     * @author shimmerjordan
     * @date 2021/01/23 20:00
     */
    public static void notNull(Object object, String message) {
        if (object == null) {
            throw new IllegalArgumentException(message);
        }
    }
}
