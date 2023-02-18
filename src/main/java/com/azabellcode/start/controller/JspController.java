package com.azabellcode.start.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Value;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class JspController {
    @Value("${project.name}")
	String projectName;

    @RequestMapping("/test")
    public String welcome() {
        return "welcome";
    }
}
