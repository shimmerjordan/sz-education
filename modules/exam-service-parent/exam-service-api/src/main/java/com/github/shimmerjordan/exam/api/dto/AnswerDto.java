package com.github.shimmerjordan.exam.api.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author shimmerjordan
 * @date 2021/03/18 15:02
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class AnswerDto implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long id;

    /**
     * 考试记录id
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long examRecordId;

    /**
     * 题目ID
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long subjectId;

    /**
     * 题目类型
     */
    private Integer type;

    /**
     * 答案
     */
    private String answer;

    /**
     * 答题类型，0：正确，1：错误
     */
    private Integer answerType;

    /**
     * 得分
     */
    private Double score;

    /**
     * 用户ID
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 题目详情
     */
    private SubjectDto subject;

    /**
     * 批改状态
     */
    private Integer markStatus;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 结束时间
     */
    private Date endTime;

	/**
	 * 耗时
	 */
	private String duration;
}
