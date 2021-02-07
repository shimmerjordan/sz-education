package com.github.shimmerjordan.user.excel.model;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.format.DateTimeFormat;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.HeadRowHeight;
import com.alibaba.excel.converters.longconverter.LongStringConverter;
import com.github.shimmerjordan.common.basic.utils.excel.annotation.ExcelModel;
import com.github.shimmerjordan.common.basic.utils.excel.converter.GenderConverter;
import com.github.shimmerjordan.common.basic.utils.excel.converter.StatusConverter;
import com.github.shimmerjordan.user.excel.IdentityTypeConverter;
import lombok.Data;

import java.util.Date;

/**
 * 用户Excel Model
 * @author shimmerjordan
 * @date 2021/05/9 19:08
 */
@Data
@ExcelModel("用户信息")
@ContentRowHeight(18)
@HeadRowHeight(20)
@ColumnWidth(15)
public class UserExcelModel {

	@ExcelProperty(value = "用户id", converter = LongStringConverter.class)
	@ColumnWidth(20)
	private Long id;

	@ExcelProperty("账号")
	private String identifier;

	@ExcelProperty(value = "账号类型", converter = IdentityTypeConverter.class)
	private Integer identityType;

	@ExcelProperty("姓名")
	private String name;

	@ExcelProperty(value = "性别", converter = GenderConverter.class)
	private Integer sex;

	@ExcelProperty("联系电话")
	private String phone;

	@ExcelProperty("邮箱")
	@ColumnWidth(20)
	private String email;

	@ExcelProperty("生日")
	@DateTimeFormat("yyyy年MM月dd日")
	private Date born;

	@ExcelProperty("备注")
	private String remark;

	@ExcelProperty(value = "状态", converter = StatusConverter.class)
	private Integer status;

	@ExcelProperty(value = "部门ID", converter = LongStringConverter.class)
	@ColumnWidth(20)
	private Long deptId;

	@ExcelProperty("系统编码")
	private String applicationCode;

	@ExcelProperty("租户标识")
	private String tenantCode;
}
