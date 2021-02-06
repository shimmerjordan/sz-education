package com.github.shimmerjordan.exam.utils;

import com.github.shimmerjordan.common.core.utils.DateUtils;
import com.github.shimmerjordan.exam.api.dto.ExaminationRecordDto;
import com.github.shimmerjordan.exam.excel.model.ExamRecordExcelModel;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 考试记录工具类
 *
 * @author shimmerjordan
 * @date 2020/12/31 22:35
 */
public class ExamRecordUtil {

	private ExamRecordUtil() {
	}

	/**
	 * 转换对象
	 * @param examinationRecords examinationRecords
	 * @return List
	 */
	public static List<ExamRecordExcelModel> convertToExcelModel(List<ExaminationRecordDto> examinationRecords) {
		List<ExamRecordExcelModel> examRecordExcelModels = new ArrayList<>(examinationRecords.size());
		examinationRecords.forEach(examinationRecord -> {
			ExamRecordExcelModel examRecordExcelModel = new ExamRecordExcelModel();
			BeanUtils.copyProperties(examinationRecord, examRecordExcelModel);
			examRecordExcelModels.add(examRecordExcelModel);
		});
		return examRecordExcelModels;
	}

	/**
	 * 计算持续时间
	 * @param startTime startTime
	 * @param endTime endTime
	 * @return String
	 */
	public static String getExamDuration(Date startTime, Date endTime) {
		// 持续时间
		String suffix = "分钟";
		Integer duration = DateUtils.getBetweenMinutes(startTime, endTime);
		if (duration <= 0) {
			duration = DateUtils.getBetweenSecond(startTime, endTime);
			suffix = "秒";
		}
		return duration + suffix;
	}
}
