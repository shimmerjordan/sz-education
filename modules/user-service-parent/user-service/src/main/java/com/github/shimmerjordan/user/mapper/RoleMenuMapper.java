package com.github.shimmerjordan.user.mapper;

import com.github.shimmerjordan.common.core.persistence.CrudMapper;
import com.github.shimmerjordan.user.api.module.RoleMenu;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 角色菜单mapper
 *
 * @author shimmerjordan
 * @date 2020/12/26 22:34
 */
@Mapper
public interface RoleMenuMapper extends CrudMapper<RoleMenu> {

	/**
	 * 根据角色ID删除
	 *
	 * @param roleId 角色ID
	 * @return int
	 */
	int deleteByRoleId(Long roleId);

	/**
	 * 根据菜单ID删除
	 *
	 * @param menuId 菜单ID
	 * @return int
	 */
	int deleteByMenuId(Long menuId);

	/**
	 * 批量保存
	 *
	 * @param roleMenus roleMenus
	 * @return int
	 */
	int insertBatch(List<RoleMenu> roleMenus);

	/**
	 * 根据roleId查询
	 *
	 * @param roleMenu roleMenu
	 * @return List
	 * @author shimmerjordan
	 * @date 2021/04/02 22:22:51
	 */
	List<RoleMenu> getByRoleId(RoleMenu roleMenu);

	/**
	 * 根据menuId查询
	 *
	 * @param roleMenu roleMenu
	 * @return List
	 * @author shimmerjordan
	 * @date 2021/04-14 15:50
	 */
	List<RoleMenu> getByMenuId(RoleMenu roleMenu);

	/**
	 * 根据menuId列表查询
	 *
	 * @param roleMenus roleMenus
	 * @return List
	 * @author shimmerjordan
	 * @date 2021/04-14 16:00
	 */
	List<RoleMenu> getByMenuIds(List<RoleMenu> roleMenus);
}
