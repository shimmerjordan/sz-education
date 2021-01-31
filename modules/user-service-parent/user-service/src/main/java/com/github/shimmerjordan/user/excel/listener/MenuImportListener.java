package com.github.shimmerjordan.user.excel.listener;

import com.github.shimmerjordan.common.basic.utils.excel.AbstractExcelImportListener;
import com.github.shimmerjordan.user.api.module.Menu;
import com.github.shimmerjordan.user.excel.model.MenuExcelModel;
import com.github.shimmerjordan.user.service.MenuService;
import org.springframework.beans.BeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单导入
 * @author shimmerjordan
 * @date 2021/12/10 17:22
 */
public class MenuImportListener extends AbstractExcelImportListener<MenuExcelModel> {

	private MenuService menuService;

	public MenuImportListener(MenuService menuService) {
		this.menuService = menuService;
	}

	@Override
	public void saveData(List<MenuExcelModel> menuExcelModels) {
		logger.info("SaveData size: {}", menuExcelModels.size());
		List<Menu> menuList = new ArrayList<>(menuExcelModels.size());
		menuExcelModels.forEach(data -> {
			Menu menu = new Menu();
			BeanUtils.copyProperties(data, menu);
			menuList.add(menu);
		});
		menuList.forEach(menu -> {
			if (menuService.update(menu) < 1)
				menuService.insert(menu);
		});
	}
}
