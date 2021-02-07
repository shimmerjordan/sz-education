package com.github.shimmerjordan.auth.config;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.api.impl.WxMaServiceImpl;
import cn.binarywang.wx.miniapp.config.WxMaConfig;
import cn.binarywang.wx.miniapp.config.WxMaInMemoryConfig;
import com.github.shimmerjordan.auth.properties.WxProperties;
import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 微信相关配置
 *
 * @author shimmerjordan
 * @date 2021/03/05 20:29
 */
@Configuration
@AllArgsConstructor
public class WxConfig {

    /**
     * 微信的配置，如appId，appSecret，sessionHost
     */
    private final WxProperties wxProperties;

    @Bean
    public WxMaConfig wxMaConfig() {
        WxMaInMemoryConfig config = new WxMaInMemoryConfig();
        config.setAppid(wxProperties.getAppId());
        config.setSecret(wxProperties.getAppSecret());
        return config;
    }

    @Bean
    public WxMaService wxMaService(WxMaConfig maConfig) {
        WxMaService service = new WxMaServiceImpl();
        service.setWxMaConfig(maConfig);
        return service;
    }
}
