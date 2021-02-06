package com.github.shimmerjordan.common.core.utils;

import java.util.UUID;

/**
 * id生成工具类
 *
 * @author shimmerjordan
 * @date 2020/12/23 12:03
 */
public class IdGen {

    /**
     * 封装JDK自带的UUID, 中间无-分割.
     */
    public static String uuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 基于snowflake算法生成IDs
     *
     * @return String
     * @author shimmerjordan
     * @date 2021/04/26 11:24
     */
    public static long snowflakeId() {
        return SpringContextHolder.getApplicationContext().getBean(SnowflakeIdWorker.class).nextId();
    }
}