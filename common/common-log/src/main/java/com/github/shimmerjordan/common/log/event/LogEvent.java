package com.github.shimmerjordan.common.log.event;

import com.github.shimmerjordan.common.basic.model.Log;
import org.springframework.context.ApplicationEvent;

/**
 * 日志事件
 *
 * @author shimmerjordan
 * @date 2021/03/12 23:58
 */
public class LogEvent extends ApplicationEvent {
    public LogEvent(Log source) {
        super(source);
    }
}
