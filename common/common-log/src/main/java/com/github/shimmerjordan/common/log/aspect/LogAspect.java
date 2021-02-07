package com.github.shimmerjordan.common.log.aspect;

import com.github.shimmerjordan.common.core.utils.SpringContextHolder;
import com.github.shimmerjordan.common.log.annotation.Log;
import com.github.shimmerjordan.common.log.event.LogEvent;
import com.github.shimmerjordan.common.log.utils.LogUtil;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 日志切面，异步记录日志
 *
 * @author shimmerjordan
 * @date 2021/03/12 23:52
 */
@Aspect
public class LogAspect {

    private static final Logger logger = LoggerFactory.getLogger(LogAspect.class);

    @Around("@annotation(log)")
    public Object around(ProceedingJoinPoint point, Log log) throws Throwable {
        String strClassName = point.getTarget().getClass().getName();
        String strMethodName = point.getSignature().getName();
        logger.debug("[类名]:{},[方法]:{}", strClassName, strMethodName);
        com.github.shimmerjordan.common.basic.model.Log logVo = LogUtil.getLog();
        logVo.setTitle(log.value());
        // 发送异步日志事件
        Long startTime = System.currentTimeMillis();
        Object obj = point.proceed();
        Long endTime = System.currentTimeMillis();
        logVo.setTime(String.valueOf(endTime - startTime));
        logVo.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        SpringContextHolder.publishEvent(new LogEvent(logVo));
        return obj;
    }
}
