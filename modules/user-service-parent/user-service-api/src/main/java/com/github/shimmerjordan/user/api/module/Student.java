package com.github.shimmerjordan.user.api.module;

import com.github.shimmerjordan.common.core.persistence.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 学生
 *
 * @author shimmerjordan
 * @date 2021/03/09 15:08
 */
@Data
public class Student extends BaseEntity<Student> {

    /**
     * 学生姓名
     */
    private String studentName;

    /**
     * 出生日期
     */
    private Date born;

    /**
     * 电话号码
     */
    private String phone;

    /**
     * 微信
     */
    private String wechat;

    /**
     * 性别
     */
    private Integer sex;

    /**
     * 家庭住址
     */
    private String address;

    /**
     * 就读年级
     */
    private String grade;

    /**
     * 就读班级名称
      */
    private String gradeName;

    /**
     * 就读学校
     */
    private String school;

    /**
     * 城市id
     */
    private String cityId;

    /**
     * 县id
     */
    private String countyId;
}
