package com.github.shimmerjordan.user.service;

import com.github.shimmerjordan.common.basic.model.Log;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.user.mapper.LogMapper;
import org.springframework.stereotype.Service;

/**
 * 日志service
 *
 * @author shimmerjordan
 * @date 2018/10/31 20:43
 */
@Service
public class LogService extends CrudService<LogMapper, Log> {
}
