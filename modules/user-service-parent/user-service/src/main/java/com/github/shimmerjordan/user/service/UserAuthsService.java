package com.github.shimmerjordan.user.service;

import com.github.shimmerjordan.common.core.service.CrudService;
import com.github.shimmerjordan.user.api.module.User;
import com.github.shimmerjordan.user.api.module.UserAuths;
import com.github.shimmerjordan.user.mapper.UserAuthsMapper;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户授权Service
 *
 * @author shimmerjordan
 * @date 2021/07/03 11:45
 */
@AllArgsConstructor
@Slf4j
@Service
public class UserAuthsService extends CrudService<UserAuthsMapper, UserAuths> {

    /**
     * 根据唯一标识查询
     *
     * @param userAuths userAuths
     * @return UserAuths
     * @author shimmerjordan
     * @date 2021/07/03 11:52:27
     */
    public UserAuths getByIdentifier(UserAuths userAuths) {
        return this.dao.getByIdentifier(userAuths);
    }

    /**
     * 根据用户批量查询用户权限
     *
     * @param userList userList
     * @return List
     * @author shimmerjordan
     * @date 2021/07/03 21:58:31
     */
    public List<UserAuths> getListByUsers(List<User> userList) {
        return this.dao.getListByUserIds(userList.stream().map(User::getId).distinct().toArray(Long[]::new));
    }

    /**
     * 根据唯一标识删除
     *
     * @param userAuths userAuths
     * @return int
     * @author shimmerjordan
     * @date 2021/07/04 11:39:50
     */
    @Transactional
    public int deleteByIdentifier(UserAuths userAuths) {
        return this.dao.deleteByIdentifier(userAuths);
    }

    /**
     * 根据用户ID删除
     *
     * @param userAuths userAuths
     * @return int
     * @author shimmerjordan
     * @date 2021/07/04 11:42:50
     */
    @Transactional
    public int deleteByUserId(UserAuths userAuths) {
        return this.dao.deleteByUserId(userAuths);
    }

    /**
     * 批量插入
     *
     * @param userAuths userAuths
     * @return int
     * @author shimmerjordan
     * @date 2021/09-03 13:07
     */
    @Transactional
    public int insertBatch(List<UserAuths> userAuths) {
        return dao.insertBatch(userAuths);
    }
}
