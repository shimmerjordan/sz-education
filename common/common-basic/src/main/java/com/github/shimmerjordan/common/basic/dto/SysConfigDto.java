package com.github.shimmerjordan.common.basic.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author shimmerjordan
 * @date 2021/02/05 15:05
 */
@Data
public class SysConfigDto implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 上传地址
     */
    private String uploadUrl;

    /**
     * 默认头像
     */
    private String defaultAvatar;

    /**
     * 管理员账号
     */
    private String adminUser;
}
