package com.github.shimmerjordan.exam.api.module;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * 课程
 *
 * @author shimmerjordan
 * @date 2021/05/8 20:43
 */
@Data
public class Course extends BaseEntity<Course> {

    /**
     * 课程名称
     */
    @NotBlank(message = "课程名称不能为空")
    private String courseName;

    /**
     * 学院
     */
    private String college;

    /**
     * 专业
     */
    private String major;

    /**
     * 老师
     */
    private String teacher;

    /**
     * 课程描述
     */
    private String courseDescription;

    /**
     * logoId
     */
    private Long logoId;

    /**
     * logo URL
     */
    private String logoUrl;
}
