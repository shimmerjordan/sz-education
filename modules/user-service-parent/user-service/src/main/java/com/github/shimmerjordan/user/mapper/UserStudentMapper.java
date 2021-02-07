package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.user.api.module.UserStudent;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 用户学生Mapper
 *
 * @author shimmerjordan
 * @date 2021/03/09 15:57
 */
@Mapper
public interface UserStudentMapper extends CrudMapper<UserStudent> {

    /**
     * 根据userId查询
     *
     * @param userId userId
     * @return List
     */
    List<UserStudent> getByUserId(String userId);

    /**
     * 根据studentId查询
     *
     * @param studentId studentId
     * @return UserStudent
     */
    UserStudent getByStudentId(String studentId);

    /**
     * 根据用户id删除
     *
     * @param userId userId
     * @return int
     */
    int deleteByUserId(String userId);

    /**
     * 根据学生id删除
     *
     * @param studentId studentId
     * @return int
     */
    int deleteByStudentId(String studentId);
}
