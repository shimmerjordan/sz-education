package com.github.shimmerjordan.exam.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 提交状态
 * @author shimmerjordan
 * @date 2021/05/10 17:53
 */
@Getter
@AllArgsConstructor
public enum SubmitStatusEnum {

	SUBMITTED("已提交", 0), UNSUBMITTED("未提交", 1);

	private String name;

	private Integer value;

	public static SubmitStatusEnum matchByValue(Integer value) {
		for (SubmitStatusEnum item : SubmitStatusEnum.values()) {
			if (item.value.equals(value)) {
				return item;
			}
		}
		return UNSUBMITTED;
	}

	public static SubmitStatusEnum matchByName(String name) {
		for (SubmitStatusEnum item : SubmitStatusEnum.values()) {
			if (item.name.equals(name)) {
				return item;
			}
		}
		return UNSUBMITTED;
	}
}
