package com.github.shimmerjordan.exam.api.module;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Date;

/**
 * 考试
 *
 * @author shimmerjordan
 * @date 2021/05/8 20:47
 */
@Data
public class Examination extends BaseEntity<Examination> {

    /**
     * 考试名称
     */
    @NotBlank(message = "考试名称不能为空")
    private String examinationName;

    /**
     * 考试类型
     */
    @NotNull(message = "考试类型不能为空")
    private Integer type;

    /**
     * 考试注意事项
     */
    private String attention;

    /**
     * 考试开始时间
     */
    private Date startTime;

    /**
     * 考试结束时间
     */
    private Date endTime;

    /**
     * 总分
     */
    @NotNull(message = "总分不能为空")
    private Integer totalScore;

    /**
     * 考试状态
     */
    private Integer status;

    /**
     * 封面对应的图片id
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long avatarId;

    /**
     * 课程
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long courseId;

    /**
     * 备注
     */
    private String remark;
}
