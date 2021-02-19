package com.github.shimmerjordan.exam.api.module;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

/**
 * 考试权限
 *
 * @author shimmerjordan
 * @date 2021/03/16 14:01
 */
@Data
public class ExaminationAuth extends BaseEntity<ExaminationAuth> {

    /**
     * 学生ID
     */
    private String userId;

    /**
     * 考试ID
     */
    private String examinationId;
}
