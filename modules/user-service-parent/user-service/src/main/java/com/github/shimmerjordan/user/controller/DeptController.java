package com.github.shimmerjordan.user.controller;


import com.github.shimmerjordan.common.basic.vo.DeptVo;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.core.web.BaseController;
import com.github.shimmerjordan.common.log.annotation.Log;
import com.github.shimmerjordan.common.security.annotations.AdminTenantTeacherAuthorization;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import com.github.shimmerjordan.user.api.dto.DeptDto;
import com.github.shimmerjordan.user.api.module.Dept;
import com.github.shimmerjordan.user.service.DeptService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * 部门controller
 *
 * @author shimmerjordan
 * @date 2020/8/26 0026 22:49
 */
@AllArgsConstructor
@Api("部门信息管理")
@RestController
@RequestMapping("/v1/dept")
public class DeptController extends BaseController {

    private final DeptService deptService;

    /**
     * 查询树形部门集合
     *
     * @return List
     * @author shimmerjordan
     * @date 2020/10/25 12:57
     */
    @GetMapping(value = "depts")
    @ApiOperation(value = "获取部门列表")
    public List<DeptDto> depts() {
        return  deptService.depts();
    }

    /**
     * 根据id获取部门
     *
     * @param id id
     * @return Dept
     * @author shimmerjordan
     * @date 2020/8/28 10:11
     */
    @GetMapping("/{id}")
    @ApiOperation(value = "获取部门信息", notes = "根据部门id获取部门详细信息")
    @ApiImplicitParam(name = "id", value = "部门ID", required = true, dataType = "Long", paramType = "path")
    public Dept get(@PathVariable Long id) {
        return deptService.get(id);
    }

    /**
     * 新增部门
     *
     * @param dept dept
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2020/8/28 10:15
     */
    @PostMapping
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "创建部门", notes = "创建部门")
    @ApiImplicitParam(name = "dept", value = "部门实体", required = true, dataType = "Dept")
    @Log("新增部门")
    public ResponseBean<Boolean> add(@RequestBody @Valid Dept dept) {
        dept.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        return new ResponseBean<>(deptService.insert(dept) > 0);
    }

    /**
     * 删除部门
     *
     * @param id id
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2020/8/28 10:16
     */
    @DeleteMapping("/{id}")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "删除部门", notes = "根据ID删除部门")
    @ApiImplicitParam(name = "id", value = "部门ID", required = true, paramType = "path")
    @Log("删除部门")
    public ResponseBean<Boolean> delete(@PathVariable Long id) {
        Dept dept = new Dept();
        dept.setId(id);
        dept.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        return new ResponseBean<>(deptService.delete(dept) > 0);
    }

    /**
     * 更新部门
     *
     * @param dept dept
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2020/8/28 10:22
     */
    @PutMapping
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "更新部门信息", notes = "根据部门id更新部门的基本信息")
    @ApiImplicitParam(name = "dept", value = "部门实体", required = true, dataType = "Dept")
    @Log("更新部门")
    public ResponseBean<Boolean> update(@RequestBody @Valid Dept dept) {
        dept.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        return new ResponseBean<>(deptService.update(dept) > 0);
    }

    /**
     * 根据ID查询
     *
     * @param ids ids
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2020/12/31 22:13
     */
    @RequestMapping(value = "findById", method = RequestMethod.POST)
    @ApiOperation(value = "批量查询部门信息", notes = "根据Ids批量查询信息")
    @ApiImplicitParam(name = "ids", value = "部门ID", required = true, dataType = "Long")
    public ResponseBean<List<DeptVo>> findById(@RequestBody Long[] ids) {
        ResponseBean<List<DeptVo>> returnT = null;
        Stream<Dept> deptStream = deptService.findListById(ids).stream();
        if (Optional.ofNullable(deptStream).isPresent()) {
            List<DeptVo> deptVoList = deptStream.map(tempDept -> {
                DeptVo tempDeptVo = new DeptVo();
                BeanUtils.copyProperties(tempDept, tempDeptVo);
                return tempDeptVo;
            }).collect(Collectors.toList());
            returnT = new ResponseBean<>(deptVoList);
        }
        return returnT;
    }
}
