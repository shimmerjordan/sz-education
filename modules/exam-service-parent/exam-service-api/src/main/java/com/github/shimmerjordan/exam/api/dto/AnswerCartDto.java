package com.github.shimmerjordan.exam.api.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 答题卡
 *
 * @author shimmerjordan
 * @date 2021/04/10 21:23
 */
@Data
public class AnswerCartDto implements Serializable {

    private static final long serialVersionUID = 1L;

    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private List<Long> subjectIds;

}
