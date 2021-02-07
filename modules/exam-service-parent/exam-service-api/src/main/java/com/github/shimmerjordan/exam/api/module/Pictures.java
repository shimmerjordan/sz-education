package com.github.shimmerjordan.exam.api.module;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 图片表
 *
 * @author shimmerjordan
 * @date 2021/03/16 13:52
 */
@Data
public class Pictures extends BaseEntity<Pictures> {

    /**
     * 图片地址
     */
    private String pictureAddress;

    /**
     * 附件ID
     */
    private String attachmentId;
}
