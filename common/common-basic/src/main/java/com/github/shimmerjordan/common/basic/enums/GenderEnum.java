package com.github.shimmerjordan.common.basic.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 性别枚举
 * @author shimmerjordan
 * @date 2021/02/10 14:23
 */
@Getter
@AllArgsConstructor
public enum GenderEnum {

	MEN("男", 0), WOMEN("女", 1);

	private String name;

	private Integer value;

	public static GenderEnum matchByValue(Integer value) {
		for (GenderEnum item : GenderEnum.values()) {
			if (item.value.equals(value)) {
				return item;
			}
		}
		return MEN;
	}

	public static GenderEnum matchByName(String name) {
		for (GenderEnum item : GenderEnum.values()) {
			if (item.name.equals(name)) {
				return item;
			}
		}
		return MEN;
	}
}
