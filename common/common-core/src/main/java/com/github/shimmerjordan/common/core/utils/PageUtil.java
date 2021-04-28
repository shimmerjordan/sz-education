package com.github.shimmerjordan.common.core.utils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 分页查询工具类
 *
 * @author shimmerjordan
 * @date 2021/01/24 20:16
 */
public class PageUtil {

    /**
     * 降序
     */
    private static final String DESC = "descending";

    /**
     * 升序
     */
    private static final String ASC = "ascending";

    /**
     * 排序SQL
     *
     * @param sort  排序字段
     * @param order 顺序
     * @return String
     * @author shimmerjordan
     * @date 2021/01/24 20:18
     */
    public static String orderBy(String sort, String order) {
        if (DESC.equals(order)) {
            order = " desc";
        } else if (ASC.equals(order)) {
            order = " asc";
        }
        return sort + order;
    }

    /**
     * 初始化pageInfo
     *
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @return PageInfo
     * @author shimmerjordan
     * @date 2021/03/28 15:36
     */
    public static <T> PageInfo<T> pageInfo(String pageNum, String pageSize, String sort, String order) {
        PageInfo<T> page = new PageInfo<>();
        page.setPageNum(Integer.parseInt(pageNum));
        page.setPageSize(Integer.parseInt(pageSize));
        PageHelper.orderBy(orderBy(sort, order));
        return page;
    }

    /**
     * 复制属性
     *
     * @param source source
     * @param target target
     * @author shimmerjordan
     * @date 2021/03/03 22:26:18
     */
    public static void copyProperties(PageInfo<?> source, PageInfo<?> target) {
        target.setPageNum(source.getPageNum());
        target.setPageSize(source.getPageSize());
        target.setSize(source.getSize());
        target.setStartRow(source.getStartRow());
        target.setEndRow(source.getEndRow());
        target.setPages(source.getPages());
        target.setPrePage(source.getPrePage());
        target.setNextPage(source.getNextPage());
        target.setIsFirstPage(source.isIsFirstPage());
        target.setIsLastPage(source.isIsLastPage());
        target.setHasPreviousPage(source.isHasPreviousPage());
        target.setHasNextPage(source.isHasNextPage());
        target.setNavigatePages(source.getNavigatePages());
        target.setNavigatepageNums(source.getNavigatepageNums());
        target.setNavigateFirstPage(source.getNavigateFirstPage());
        target.setNavigateLastPage(source.getNavigateLastPage());
        target.setTotal(source.getTotal());
    }
}
