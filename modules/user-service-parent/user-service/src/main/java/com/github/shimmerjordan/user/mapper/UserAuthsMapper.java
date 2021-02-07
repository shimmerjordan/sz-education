package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.user.api.module.UserAuths;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * UserAuthsMapper
 *
 * @author shimmerjordan
 * @date 2021/03/03 11:44
 */
@Mapper
public interface UserAuthsMapper extends CrudMapper<UserAuths> {

    /**
     * 根据唯一标识查询
     *
     * @param userAuths userAuths
     * @return UserAuths
     * @author shimmerjordan
     * @date 2021/03/03 11:52:27
     */
    UserAuths getByIdentifier(UserAuths userAuths);

    /**
     * 根据用户id批量查询
     *
     * @param userIds userIds
     * @return List
     * @author shimmerjordan
     * @date 2021/03/03 22:02:13
     */
    List<UserAuths> getListByUserIds(@Param("userIds") Long[] userIds);

    /**
     * 根据唯一标识删除
     *
     * @param userAuths userAuths
     * @return int
     * @author shimmerjordan
     * @date 2021/03/04 11:39:50
     */
    int deleteByIdentifier(UserAuths userAuths);


    /**
     * 根据用户ID删除
     *
     * @param userAuths userAuths
     * @return int
     * @author shimmerjordan
     * @date 2021/03/04 11:43:50
     */
    int deleteByUserId(UserAuths userAuths);

    /**
     * 批量插入
     *
     * @param userAuths userAuths
     * @return int
     * @author shimmerjordan
     * @date 2021/04-03 13:07
     */
    int insertBatch(List<UserAuths> userAuths);
}
