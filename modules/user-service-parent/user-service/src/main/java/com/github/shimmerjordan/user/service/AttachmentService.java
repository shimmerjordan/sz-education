package com.github.shimmerjordan.user.service;

import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.user.api.constant.AttachmentConstant;
import com.github.shimmerjordan.user.api.module.Attachment;
import com.github.shimmerjordan.user.mapper.AttachmentMapper;
import com.github.shimmerjordan.user.uploader.UploadInvoker;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.InputStream;

/**
 * @author shimmerjordan
 * @date 2020/10/30 20:55
 */
@Slf4j
@AllArgsConstructor
@Service
public class AttachmentService extends CrudService<AttachmentMapper, Attachment> {

	/**
	 * 根据id查询
	 *
	 * @param attachment attachment
	 * @return Attachment
	 */
	@Cacheable(value = "attachment#" + CommonConstant.CACHE_EXPIRE, key = "#attachment.id")
	@Override
	public Attachment get(Attachment attachment) {
		return super.get(attachment);
	}

	/**
	 * 根据id更新
	 *
	 * @param attachment attachment
	 * @return int
	 */
	@Override
	@Transactional
	@CacheEvict(value = {"attachment", "attachment_preview"}, key = "#attachment.id")
	public int update(Attachment attachment) {
		return super.update(attachment);
	}

	/**
	 * 下载
	 *
	 * @param attachment attachment
	 * @return InputStream
	 */
	public InputStream download(Attachment attachment) throws Exception {
		// 下载附件
		return UploadInvoker.getInstance().download(attachment);
	}

	/**
	 * 删除
	 *
	 * @param attachment attachment
	 * @return int
	 */
	@Override
	@Transactional
	@CacheEvict(value = {"attachment", "attachment_preview"}, key = "#attachment.id")
	public int delete(Attachment attachment) {
		return super.delete(attachment);
	}

	/**
	 * 批量删除
	 *
	 * @param ids ids
	 * @return int
	 */
	@Override
	@Transactional
	@CacheEvict(value = {"attachment", "attachment_preview"}, allEntries = true)
	public int deleteAll(Long[] ids) {
		return super.deleteAll(ids);
	}

	/**
	 * 获取附件的预览地址
	 *
	 * @param attachment attachment
	 * @return String
	 * @author shimmerjordan
	 * @date 2021/06/21 17:45
	 */
	@Cacheable(value = "attachment_preview#" + CommonConstant.CACHE_EXPIRE, key = "#attachment.id")
	public String getPreviewUrl(Attachment attachment) {
		attachment = this.get(attachment);
		if (attachment != null) {
			String preview = attachment.getPreviewUrl();
			if (StringUtils.isNotBlank(preview) && !preview.startsWith("http")) {
				preview = "http://" + preview;
			} else {
				preview = AttachmentConstant.ATTACHMENT_PREVIEW_URL + attachment.getId();
			}
			log.debug("GetPreviewUrl id: {}, preview url: {}", attachment.getId(), preview);
			return preview;
		}
		return "";
	}
}
