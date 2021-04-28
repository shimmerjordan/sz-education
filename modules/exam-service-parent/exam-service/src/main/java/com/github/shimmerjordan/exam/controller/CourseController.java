package com.github.shimmerjordan.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.core.utils.PageUtil;
import com.github.shimmerjordan.common.core.web.BaseController;
import com.github.shimmerjordan.common.log.annotation.Log;
import com.github.shimmerjordan.common.security.annotations.AdminTenantTeacherAuthorization;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import com.github.shimmerjordan.exam.api.module.Course;
import com.github.shimmerjordan.exam.service.CourseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * 课程controller
 *
 * @author shimmerjordan
 * @date 2021/03/08 21:25
 */
@Slf4j
@AllArgsConstructor
@Api("课程信息管理")
@RestController
@RequestMapping("/v1/course")
public class CourseController extends BaseController {

    private final CourseService courseService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:28
     */
    @GetMapping("/{id}")
    @ApiOperation(value = "获取课程信息", notes = "根据课程id获取课程详细信息")
    @ApiImplicitParam(name = "id", value = "课程ID", required = true, dataType = "Long", paramType = "path")
    public ResponseBean<Course> course(@PathVariable Long id) {
        return new ResponseBean<>(courseService.get(id));
    }

    /**
     * 获取分页数据
     *
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param course   course
     * @return PageInfo
     * @author shimmerjordan
     * @date 2021/03/10 21:30
     */
    @GetMapping("courseList")
    @ApiOperation(value = "获取课程列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = CommonConstant.PAGE_NUM, value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = CommonConstant.PAGE_SIZE, value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = CommonConstant.SORT, value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = CommonConstant.ORDER, value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "course", value = "课程信息", dataType = "Course")
    })
    public PageInfo<Course> courseList(@RequestParam(value = CommonConstant.PAGE_NUM, required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
                                       @RequestParam(value = CommonConstant.PAGE_SIZE, required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
                                       @RequestParam(value = CommonConstant.SORT, required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
                                       @RequestParam(value = CommonConstant.ORDER, required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
                                       Course course) {
        course.setTenantCode(SysUtil.getTenantCode());
        return  courseService.findPage(PageUtil.pageInfo(pageNum, pageSize, sort, order), course);
    }

    /**
     * 创建
     *
     * @param course course
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:31
     */
    @PostMapping
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "创建课程", notes = "创建课程")
    @ApiImplicitParam(name = "course", value = "课程实体course", required = true, dataType = "Course")
    @Log("新增课程")
    public ResponseBean<Boolean> addCourse(@RequestBody @Valid Course course) {
        course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        return new ResponseBean<>(courseService.insert(course) > 0);
    }

    /**
     * 更新
     *
     * @param course course
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:31
     */
    @PutMapping
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "更新课程信息", notes = "根据课程id更新课程的基本信息")
    @ApiImplicitParam(name = "course", value = "课程实体course", required = true, dataType = "Course")
    @Log("更新课程")
    public ResponseBean<Boolean> updateCourse(@RequestBody @Valid Course course) {
        course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        return new ResponseBean<>(courseService.update(course) > 0);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:32
     */
    @DeleteMapping("{id}")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "删除课程", notes = "根据ID删除课程")
    @ApiImplicitParam(name = "id", value = "课程ID", required = true, paramType = "path")
    @Log("删除课程")
    public ResponseBean<Boolean> deleteCourse(@PathVariable Long id) {
        boolean success = false;
        try {
            Course course = courseService.get(id);
            if (course != null) {
                course.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
                success = courseService.delete(course) > 0;
            }
        } catch (Exception e) {
            log.error("Delete course failed", e);
        }
        return new ResponseBean<>(success);
    }

    /**
     * 批量删除
     *
     * @param ids ids
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/01/04 11:26
     */
    @PostMapping("deleteAll")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "批量删除课程", notes = "根据课程id批量删除课程")
    @ApiImplicitParam(name = "ids", value = "课程ID", dataType = "Long")
    @Log("批量删除课程")
    public ResponseBean<Boolean> deleteAllCourses(@RequestBody Long[] ids) {
        boolean success = false;
        try {
            if (ArrayUtils.isNotEmpty(ids))
                success = courseService.deleteAll(ids) > 0;
        } catch (Exception e) {
            log.error("Delete course failed", e);
        }
        return new ResponseBean<>(success);
    }
}
