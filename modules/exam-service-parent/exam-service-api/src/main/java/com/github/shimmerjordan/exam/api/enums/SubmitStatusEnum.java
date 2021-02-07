package com.github.shimmerjordan.exam.api.enums;

/**
 * @author shimmerjordan
 * @date 2021/04/22 21:44
 */
public enum SubmitStatusEnum {

    NOT_SUBMITTED("未提交", 0),
    SUBMITTED("已提交", 1),
    CALCULATE("正在统计", 2),
    CALCULATED("统计完成", 3);

    private String name;

    private Integer value;

    SubmitStatusEnum(String name, Integer value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
        this.value = value;
    }

    public static SubmitStatusEnum match(Integer value, SubmitStatusEnum defaultValue) {
        if (value != null) {
            for (SubmitStatusEnum item : SubmitStatusEnum.values()) {
                if (item.value.equals(value)) {
                    return item;
                }
            }
        }
        return defaultValue;
    }
}
