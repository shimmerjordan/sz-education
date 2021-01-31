package com.github.shimmerjordan.exam.api.feign.factory;

import com.github.shimmerjordan.exam.api.feign.ExaminationServiceClient;
import com.github.shimmerjordan.exam.api.feign.fallback.ExaminationServiceClientFallbackImpl;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 * @author shimmerjordan
 * @date 2021/3/26 09:49
 */
@Component
public class ExaminationServiceClientFallbackFactory implements FallbackFactory<ExaminationServiceClient> {

    @Override
    public ExaminationServiceClient create(Throwable throwable) {
        ExaminationServiceClientFallbackImpl examinationServiceClientFallback = new ExaminationServiceClientFallbackImpl();
        examinationServiceClientFallback.setThrowable(throwable);
        return examinationServiceClientFallback;
    }
}
