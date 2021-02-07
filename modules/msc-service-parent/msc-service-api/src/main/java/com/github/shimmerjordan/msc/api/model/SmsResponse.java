package com.github.shimmerjordan.msc.api.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;

/**
 * 封装短信服务返回的结果
 *
 * @author shimmerjordan
 * @date 2021/04/04 13:51
 */
@Data
public class SmsResponse {

    @JsonProperty("Message")
    private String message;

    @JsonProperty("RequestId")
    private String requestId;

    @JsonProperty("Code")
    private String code;
}
