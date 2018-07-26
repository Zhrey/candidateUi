package com.ray.ui.controller;

import com.ray.core.sdk.service.CandidateManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 15:20 2018/7/25
 * @Modified By:
 */
@Controller
@RequestMapping("")
public class LoginController {

    private static final String LOGIN_PAGE = "login";
    private static final String HOME_PAGE = "home";

    @Autowired
    private CandidateManagementService candidateManagementService;

    @RequestMapping("")
    public String toLoginPage() {
        return LOGIN_PAGE;
    }
    @RequestMapping("/login")
    @ResponseBody
    public String login() {
        candidateManagementService.toHomePage();
        return HOME_PAGE;
    }
}
