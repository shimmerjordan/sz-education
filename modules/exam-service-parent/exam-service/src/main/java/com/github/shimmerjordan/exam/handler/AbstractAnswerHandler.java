package com.github.shimmerjordan.exam.handler;

import com.github.shimmerjordan.common.core.utils.SpringContextHolder;
import com.github.shimmerjordan.exam.api.dto.SubjectDto;
import com.github.shimmerjordan.exam.api.module.Answer;
import com.github.shimmerjordan.exam.service.SubjectService;
import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 统计成绩
 * @author shimmerjordan
 * @date 2021/01/19 10:07 上午
 */
public abstract class AbstractAnswerHandler implements IAnswerHandler {

	@Override
	public AnswerHandleResult handle(List<Answer> answers) {
		if (CollectionUtils.isNotEmpty(answers)) {
			// 保存答题正确的题目分数
			List<Double> rightScore = new ArrayList<>();
			// 获取题目信息
			List<SubjectDto> subjects = getSubjects(answers);
			answers.forEach(tempAnswer -> {
				subjects.stream()
						// 题目ID匹配
						.filter(tempSubject -> tempSubject.getId().equals(tempAnswer.getSubjectId())).findFirst()
						.ifPresent(subject -> judge(tempAnswer, subject, rightScore));
			});
			AnswerHandleResult result = new AnswerHandleResult();
			// 记录总分、正确题目数、错误题目数
			result.setScore(rightScore.stream().mapToDouble(Double::valueOf).sum());
			result.setCorrectNum(rightScore.size());
			result.setInCorrectNum(answers.size() - rightScore.size());
			return result;
		}
		return null;
	}

	@Override
	public List<SubjectDto> getSubjects(List<Answer> answers) {
		return SpringContextHolder.getApplicationContext().getBean(SubjectService.class)
				.findListById(getSubjectType().getValue(),
						answers.stream().map(Answer::getSubjectId).distinct().toArray(Long[]::new));
	}
}
