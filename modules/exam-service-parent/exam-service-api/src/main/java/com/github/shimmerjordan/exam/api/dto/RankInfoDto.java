package com.github.shimmerjordan.exam.api.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;

/**
 * 排名详情
 * @author shimmerjordan
 * @date 2021/05/08 23:33
 */
@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class RankInfoDto {

	private Long userId;

	/**
	 * 姓名
	 */
	private String name;

	/**
	 * 头像地址
	 */
	private String avatarUrl;

	/**
	 * 分数
	 */
	private Double score;

	/**
	 * 排名
	 */
	private Integer rankNum;

}
