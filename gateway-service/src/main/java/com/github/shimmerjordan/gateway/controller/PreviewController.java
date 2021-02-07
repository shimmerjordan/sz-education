package com.github.shimmerjordan.gateway.controller;

import com.github.shimmerjordan.common.basic.properties.SysProperties;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.core.utils.SpringContextHolder;
import com.github.shimmerjordan.gateway.cache.loader.PreviewConfigLoader;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 演示环境开关配置
 * @author shimmerjordan
 * @date 2021/05/15 18:56
 */
@Slf4j
@AllArgsConstructor
@RestController
@RequestMapping(value = "/api/preview")
public class PreviewController {

    private final SysProperties sysProperties;

    /**
     * 演示模式
     *
     * @param enable enable
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/05/15 19:45
     */
    @GetMapping("/enable")
    public ResponseBean<Boolean> preview(@RequestParam(required = false) String enable, @RequestParam String secret) {

        if (StringUtils.isNotBlank(enable) && sysProperties.getGatewaySecret().equals(secret)) {
            log.info("Preview enable: {}", enable);
            RedisTemplate<String, String> redisTemplate = (RedisTemplate) SpringContextHolder.getApplicationContext().getBean("redisTemplate");
            redisTemplate.opsForValue().set(PreviewConfigLoader.PREVIEW_ENABLE, enable);
        }
        return new ResponseBean<>(Boolean.TRUE);
    }

    /**
     * 获取演示模式开关
     *
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/05/15 19:45
     */
    @GetMapping("/getPreview")
    public ResponseBean<String> getPreview() {
        RedisTemplate<String, String> redisTemplate = (RedisTemplate) SpringContextHolder.getApplicationContext().getBean("redisTemplate");
        return new ResponseBean<>(redisTemplate.opsForValue().get(PreviewConfigLoader.PREVIEW_ENABLE));
    }
}
