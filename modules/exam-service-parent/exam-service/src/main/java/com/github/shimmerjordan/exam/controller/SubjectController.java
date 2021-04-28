package com.github.shimmerjordan.exam.controller;

import com.github.pagehelper.PageInfo;
import com.github.shimmerjordan.common.basic.utils.excel.ExcelToolUtil;
import com.github.shimmerjordan.common.core.constant.CommonConstant;
import com.github.shimmerjordan.common.core.exceptions.CommonException;
import com.github.shimmerjordan.common.core.model.ResponseBean;
import com.github.shimmerjordan.common.core.utils.PageUtil;
import com.github.shimmerjordan.common.core.web.BaseController;
import com.github.shimmerjordan.common.log.annotation.Log;
import com.github.shimmerjordan.common.security.annotations.AdminTenantTeacherAuthorization;
import com.github.shimmerjordan.common.security.utils.SysUtil;
import com.github.shimmerjordan.exam.api.dto.SubjectDto;
import com.github.shimmerjordan.exam.excel.listener.SubjectImportListener;
import com.github.shimmerjordan.exam.excel.model.SubjectExcelModel;
import com.github.shimmerjordan.exam.service.AnswerService;
import com.github.shimmerjordan.exam.service.SubjectService;
import com.github.shimmerjordan.exam.utils.SubjectUtil;
import io.swagger.annotations.*;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * 题目controller
 *
 * @author shimmerjordan
 * @date 2021/03/08 21:29
 */
@Slf4j
@AllArgsConstructor
@Api("题目信息管理")
@RestController
@RequestMapping("/v1/subject")
public class SubjectController extends BaseController {

    private final SubjectService subjectService;

    private final AnswerService answerService;

    /**
     * 根据ID获取
     *
     * @param id id
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:43
     */
    @GetMapping("/{id}")
    @ApiOperation(value = "获取题目信息", notes = "根据题目id获取题目详细信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "题目ID", required = true, dataType = "Long", paramType = "path"),
            @ApiImplicitParam(name = "type", value = "题目类型", required = true, dataType = "Integer")})
    public ResponseBean<SubjectDto> subject(@PathVariable Long id, @RequestParam Integer type) {
        return new ResponseBean<>(subjectService.get(id, type));
    }



    /**
     * 获取分页数据
     *
     * @param pageNum  pageNum
     * @param pageSize pageSize
     * @param sort     sort
     * @param order    order
     * @param subject  subject
     * @return PageInfo
     * @author shimmerjordan
     * @date 2021/03/10 21:43
     */
    @GetMapping("subjectList")
    @ApiOperation(value = "获取题目列表")
    @ApiImplicitParams({
            @ApiImplicitParam(name = CommonConstant.PAGE_NUM, value = "分页页码", defaultValue = CommonConstant.PAGE_NUM_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = CommonConstant.PAGE_SIZE, value = "分页大小", defaultValue = CommonConstant.PAGE_SIZE_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = CommonConstant.SORT, value = "排序字段", defaultValue = CommonConstant.PAGE_SORT_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = CommonConstant.ORDER, value = "排序方向", defaultValue = CommonConstant.PAGE_ORDER_DEFAULT, dataType = "String"),
            @ApiImplicitParam(name = "subject", value = "题目信息", dataType = "Subject")})
    public PageInfo<SubjectDto> subjectList(
            @RequestParam(value = CommonConstant.PAGE_NUM, required = false, defaultValue = CommonConstant.PAGE_NUM_DEFAULT) String pageNum,
            @RequestParam(value = CommonConstant.PAGE_SIZE, required = false, defaultValue = CommonConstant.PAGE_SIZE_DEFAULT) String pageSize,
            @RequestParam(value = CommonConstant.SORT, required = false, defaultValue = CommonConstant.PAGE_SORT_DEFAULT) String sort,
            @RequestParam(value = CommonConstant.ORDER, required = false, defaultValue = CommonConstant.PAGE_ORDER_DEFAULT) String order,
            SubjectDto subject) {
        subject.setTenantCode(SysUtil.getTenantCode());
        return subjectService.findPage(PageUtil.pageInfo(pageNum, pageSize, sort, order), subject);
    }

    /**
     * 创建
     *
     * @param subject subject
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:43
     */
    @PostMapping
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "创建题目", notes = "创建题目")
    @ApiImplicitParam(name = "subject", value = "题目信息", required = true, dataType = "SubjectDto")
    @Log("新增题目")
    public ResponseBean<SubjectDto> addSubject(@RequestBody @Valid SubjectDto subject) {
        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        if (!(subjectService.insert(subject) > 0)) {
			subject = null;
		}
		return new ResponseBean<>(subject);
    }

    /**
     * 更新
     *
     * @param subject subject
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:43
     */
    @PutMapping
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "更新题目信息", notes = "根据题目id更新题目的基本信息")
    @ApiImplicitParam(name = "subject", value = "角色实体subject", required = true, dataType = "Subject")
    @Log("更新题目")
    public ResponseBean<SubjectDto> updateSubject(@RequestBody @Valid SubjectDto subject) {
        subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
        if (!(subjectService.update(subject) > 0)) {
			subject = null;
		}
        return new ResponseBean<>(subject);
    }

    /**
     * 删除
     *
     * @param id id
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/10 21:43
     */
    @DeleteMapping("{id}")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "删除题目", notes = "根据ID删除题目")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "题目ID", required = true, dataType = "Long", paramType = "path"),
            @ApiImplicitParam(name = "type", value = "题目类型", required = true, dataType = "Integer")})
    @Log("删除题目")
    public ResponseBean<Boolean> deleteSubject(@PathVariable Long id, @RequestParam Integer type) {
        boolean success = false;
        SubjectDto subject = subjectService.get(id, type);
        if (subject != null) {
            subject.setCommonValue(SysUtil.getUser(), SysUtil.getSysCode(), SysUtil.getTenantCode());
            success = subjectService.physicalDelete(subject) > 0;
        }
        return new ResponseBean<>(success);
    }

    /**
     * 导出题目
     *
     * @param ids ids
     * @author shimmerjordan
     * @date 2021/03/28 12:53
     */
    @PostMapping("export")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "导出题目", notes = "根据分类id导出题目")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ids", value = "题目ID", required = true, dataType = "Long"),
            @ApiImplicitParam(name = "examinationId", value = "考试ID", dataType = "Long"),
            @ApiImplicitParam(name = "categoryId", value = "分类ID", dataType = "Long")
    })
    @Log("导出题目")
    public void exportSubject(@RequestBody Long[] ids,
                              @RequestParam(required = false) Long examinationId,
                              @RequestParam(required = false) Long categoryId,
                              HttpServletRequest request,
                              HttpServletResponse response) {
        try {
            List<SubjectDto> subjects = subjectService.export(ids, examinationId, categoryId);
			ExcelToolUtil.writeExcel(request, response, SubjectUtil.convertToExcelModel(subjects), SubjectExcelModel.class);
        } catch (Exception e) {
            log.error("Export subject failed", e);
            throw new CommonException("Export subject failed, " + e.getMessage());
        }
    }

    /**
     * 导入数据
     *
     * @param examinationId examinationId
     * @param categoryId    categoryId
     * @param file          file
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/03/28 12:59
     */
    @RequestMapping("import")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "导入题目", notes = "导入题目")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "examinationId", value = "考试ID", dataType = "Long"),
            @ApiImplicitParam(name = "categoryId", value = "分类ID", dataType = "Long")})
    @Log("导入题目")
    public ResponseBean<Boolean> importSubject(Long examinationId, Long categoryId,
                                               @ApiParam(value = "要上传的文件", required = true) MultipartFile file) {
        try {
            log.debug("Start import subject data, examinationId: {}, categoryId: {}", examinationId, categoryId);
			return new ResponseBean<>(ExcelToolUtil.readExcel(file.getInputStream(), SubjectExcelModel.class, new SubjectImportListener(subjectService, examinationId, categoryId)));
        } catch (Exception e) {
            log.error("Import subject failed", e);
            throw new CommonException("Import subject failed");
        }
    }

    /**
     * 批量删除
     *
     * @param ids  ids
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/01/04 9:55
     */
    @PostMapping("deleteAll")
    @AdminTenantTeacherAuthorization
    @ApiOperation(value = "批量删除题目", notes = "根据题目id批量删除题目")
    @ApiImplicitParam(name = "ids", value = "题目ID", dataType = "Long")
    @Log("批量删除题目")
    public ResponseBean<Boolean> deleteSubjects(@RequestBody Long[] ids) {
        return new ResponseBean<>(subjectService.physicalDeleteAll(ids) > 0);
    }

    /**
     * 查询题目和答题
     *
     * @param subjectId    subjectId
     * @param examRecordId examRecordId
     * @param userId       userId
     * @param nextType     -1：当前题目，0：下一题，1：上一题
     * @param nextSubjectId nextSubjectId
     * @param nextSubjectType 下一题的类型，选择题、判断题
	 * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/01/16 22:25
     */
    @GetMapping("subjectAnswer")
    @ApiOperation(value = "查询题目和答题", notes = "根据题目id查询题目和答题")
    @ApiImplicitParams({@ApiImplicitParam(name = "subjectId", value = "题目ID", required = true, dataType = "Long"),
            @ApiImplicitParam(name = "examRecordId", value = "考试记录ID", required = true, dataType = "Long"),
            @ApiImplicitParam(name = "userId", value = "用户ID", dataType = "String"),
            @ApiImplicitParam(name = "nextType", value = "-1：当前题目，0：下一题，1：上一题", dataType = "Integer")})
    public ResponseBean<SubjectDto> subjectAnswer(@RequestParam("subjectId") @NotBlank Long subjectId,
                                                  @RequestParam("examRecordId") @NotBlank Long examRecordId,
                                                  @RequestParam(value = "userId", required = false) String userId,
                                                  @RequestParam Integer nextType,
                                                  @RequestParam(required = false) Long nextSubjectId,
			@RequestParam(required = false) Integer nextSubjectType) {
        return new ResponseBean<>(answerService
                .subjectAnswer(subjectId, examRecordId, nextType, nextSubjectId, nextSubjectType));
    }

    /**
     * 查询题目和答题
     *
     * @param subjectId    subjectId
     * @param examRecordId examRecordId
     * @param userId       userId
     * @param nextType     -1：当前题目，0：下一题，1：上一题
     * @param nextSubjectId nextSubjectId
     * @param nextSubjectType 下一题的类型，选择题、判断题
     * @return ResponseBean
     * @author shimmerjordan
     * @date 2021/01/16 22:25
     */
    @GetMapping("anonymousUser/subjectAnswer")
    @ApiOperation(value = "查询题目和答题", notes = "根据题目id查询题目和答题")
    @ApiImplicitParams({@ApiImplicitParam(name = "subjectId", value = "题目ID", required = true, dataType = "Long"),
            @ApiImplicitParam(name = "examRecordId", value = "考试记录ID", required = true, dataType = "Long"),
            @ApiImplicitParam(name = "userId", value = "用户ID", dataType = "String"),
            @ApiImplicitParam(name = "nextType", value = "-1：当前题目，0：下一题，1：上一题", dataType = "Integer")})
    public ResponseBean<SubjectDto> anonymousUserSubjectAnswer(@RequestParam("subjectId") @NotBlank Long subjectId,
                                                  @RequestParam("examRecordId") @NotBlank Long examRecordId,
                                                  @RequestParam(value = "userId", required = false) String userId,
                                                  @RequestParam Integer nextType,
                                                  @RequestParam(required = false) Long nextSubjectId,
                                                  @RequestParam(required = false) Integer nextSubjectType) {
        return new ResponseBean<>(answerService
                .subjectAnswer(subjectId, examRecordId, nextType, nextSubjectId, nextSubjectType));
    }
}
