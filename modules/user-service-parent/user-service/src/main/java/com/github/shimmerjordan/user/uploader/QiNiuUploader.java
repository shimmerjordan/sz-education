package com.github.shimmerjordan.user.uploader;

import com.github.shimmerjordan.oss.service.QiNiuUtil;
import com.github.shimmerjordan.user.api.module.Attachment;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.InputStream;

/**
 * 上传到七牛云
 *
 * @author shimmerjordan
 * @date 2021/04/05 13:36
 */
@Slf4j
@Service
public class QiNiuUploader extends AbstractUploader {

    @Override
    public Attachment upload(Attachment attachment, byte[] bytes) {
        String result = QiNiuUtil.getInstance().upload(bytes, attachment.getAttachName());
        attachment.setUploadResult(result);
        attachment.setPreviewUrl(attachment.getUploadResult());
        return attachment;
    }

    @Override
    public InputStream download(Attachment attachment) {
        return null;
    }

    @Override
    public boolean delete(Attachment attachment) {
        return QiNiuUtil.getInstance().delete(attachment.getAttachName());
    }

    @Override
    public boolean deleteAll(Attachment attachment) {
        return false;
    }
}
