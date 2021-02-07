package com.github.shimmerjordan.common.basic.utils.excel.annotation;

import java.lang.annotation.*;

/**
 * @author shimmerjordan
 * @date 2021/05/10 16:04
 */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface ExcelModel {

	/**
	 * 模块名，用于导出时的文件名
	 * @return String
	 */
	String value() default "";

	/**
	 * 页名
	 * @return String
	 */
	String[] sheets() default {"sheet1"};

}
