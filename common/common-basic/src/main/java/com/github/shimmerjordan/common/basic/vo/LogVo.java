package com.github.shimmerjordan.common.basic.vo;

import com.github.shimmerjordan.common.basic.model.Log;
import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * logVo
 *
 * @author shimmerjordan
 * @date 2021-01-05 17:07
 */
@Data
public class LogVo extends BaseEntity<LogVo> {

    private Log log;

    private String username;
}
