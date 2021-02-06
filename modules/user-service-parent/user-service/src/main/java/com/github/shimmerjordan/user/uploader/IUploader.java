package com.github.shimmerjordan.user.uploader;

import com.github.shimmerjordan.user.api.module.Attachment;

import java.io.InputStream;

/**
 * @author shimmerjordan
 * @date 2021/04/05 13:36
 */
public interface IUploader {

    /**
     * 上传附件
     * @param attachment attachment
     * @param bytes bytes
     * @return Attachment
     */
    Attachment upload(Attachment attachment, byte[] bytes);

    /**
     * 保存附件信息
     * @param attachment attachment
     * @return int
     */
    int save(Attachment attachment);

    /**
     * 下载附件
     * @param attachment attachment
     * @return InputStream
     */
    InputStream download(Attachment attachment);

    /**
     * 删除附件
     * @param attachment attachment
     * @return boolean
     */
    boolean delete(Attachment attachment);

    /**
     * 批量删除
     * @param attachment attachment
     * @return boolean
     */
    boolean deleteAll(Attachment attachment);
}
