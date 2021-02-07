package com.github.shimmerjordan.exam.api.module;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 选择题的选项
 *
 * @author shimmerjordan
 * @date 2021/03/8 20:53
 */
@Data
public class SubjectOption extends BaseEntity<SubjectOption> {

    /**
     * 选择题ID
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long subjectChoicesId;

    /**
     * 选项名称
     */
    private String optionName;

    /**
     * 选项内容
     */
    private String optionContent;

    /**
     * 是否正确
     */
    private String right;
}
