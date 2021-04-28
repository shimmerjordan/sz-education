package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.ExaminationRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;

/**
 * 考试记录Mapper
 *
 * @author shimmerjordan
 * @date 2021/03/08 21:12
 */
@Mapper
public interface ExamRecordMapper extends CrudMapper<ExaminationRecord> {

    /**
     * 根据用户id、考试id查找
     *
     * @param examRecord examRecord
     * @return Score
     * @author shimmerjordan
     * @date 2021/01/26 13:56
     */
    ExaminationRecord getByUserIdAndExaminationId(ExaminationRecord examRecord);

	/**
	 * 查询考试记录数量
	 *
	 * @param examinationRecord examinationRecord
	 * @return int
	 * @author shimmerjordan
	 * @date 2021/01/31 5:17
	 */
	int findExaminationRecordCount(ExaminationRecord examinationRecord);

	/**
	 * 时间范围条件查询
	 * @param start start
	 * @return List
	 * @author shimmerjordan
	 * @date 2021/02/02 11:57 上午
	 */
	List<ExaminationRecord> findExaminationRecordCountByDate(Date start);
}
