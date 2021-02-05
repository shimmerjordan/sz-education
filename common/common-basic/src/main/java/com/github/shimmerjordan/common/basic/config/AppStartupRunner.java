package com.github.shimmerjordan.common.basic.config;

import com.github.shimmerjordan.common.basic.properties.SysProperties;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * 系统启动时的一些处理
 *
 * @author shimmerjordan
 * @date 2021/02/14 16:09
 */
@Slf4j
@AllArgsConstructor
@Component
public class AppStartupRunner implements CommandLineRunner {

    private final SysProperties sysProperties;

    @Override
    public void run(String... args) throws Exception {
        // 设置系统属性
        if (StringUtils.isNotBlank(sysProperties.getCacheExpire()))
            System.setProperty(CommonConstant.CACHE_EXPIRE, sysProperties.getCacheExpire());
    }
}
