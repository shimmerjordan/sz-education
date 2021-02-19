package com.github.shimmerjordan.exam.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

/**
 * @author shimmerjordan
 * @date 2021/03/16 15:30
 */
@RestController
public class ExamController {

    @GetMapping("sayHello")
    public String sayHello(Principal principal, String name) {
        return "hello, " + name + ", principal: " + principal.toString();
    }
}
