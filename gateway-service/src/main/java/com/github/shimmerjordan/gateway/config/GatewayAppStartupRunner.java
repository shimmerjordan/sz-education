package com.github.shimmerjordan.gateway.config;

import com.github.shimmerjordan.common.basic.cache.loadingcache.LoadingCacheHelper;
import com.github.shimmerjordan.gateway.cache.loader.PreviewConfigLoader;
import com.github.shimmerjordan.gateway.service.RouteService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.CommandLineRunner;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

/**
 * 系统启动时的一些处理
 *
 * @author shimmerjordan
 * @date 2021/07/14 16:09
 */
@Slf4j
@AllArgsConstructor
@Component
public class GatewayAppStartupRunner implements CommandLineRunner {

	private final RouteService routeService;

	private final RedisTemplate<String, String> redisTemplate;

	@Override
	public void run(String... args) throws Exception {
		log.info("Init LoadingCache");
		// 初始化loadingCache
		LoadingCacheHelper.getInstance()
				.initLoadingCache(PreviewConfigLoader.class, PreviewConfigLoader.REFRESH_CACHE_DURATION);
		log.info("Init LoadingCache finished");

		// 刷新路由
		routeService.refresh();
	}
}
