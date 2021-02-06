package com.github.shimmerjordan.exam.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.exam.api.module.Examination;
import org.apache.ibatis.annotations.Mapper;

/**
 * 考试Mapper
 *
 * @author shimmerjordan
 * @date 2021/05/8 21:11
 */
@Mapper
public interface ExaminationMapper extends CrudMapper<Examination> {

    /**
     * 查询考试数量
     *
     * @param examination examination
     * @return int
     * @author shimmerjordan
     * @date 2021/3/1 15:32
     */
    int findExaminationCount(Examination examination);

    /**
     * 查询参与考试人数
     *
     * @param examination examination
     * @return int
     * @author shimmerjordan
     * @date 2021/10/27 20:08:58
     */
    int findExamUserCount(Examination examination);
}
