package com.github.shimmerjordan.common.log.event;

import com.github.shimmerjordan.common.basic.model.Log;
import com.github.shimmerjordan.user.api.feign.UserServiceClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.core.annotation.Order;
import org.springframework.scheduling.annotation.Async;

/**
 * 异步监听日志事件
 *
 * @author shimmerjordan
 * @date 2021/3/12 23:59
 */
public class LogListener {

    @Autowired
    private UserServiceClient userServiceClient;

    public LogListener(UserServiceClient userServiceClient) {
        this.userServiceClient = userServiceClient;
    }

    /**
     * 异步记录日志
     *
     * @param event event
     */
    @Async
    @Order
    @EventListener(LogEvent.class)
    public void saveSysLog(LogEvent event) {
        Log log = (Log) event.getSource();
        userServiceClient.saveLog(log);
    }
}
