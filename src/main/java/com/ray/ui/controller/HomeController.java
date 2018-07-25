package com.ray.ui.controller;

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
public class HomeController {

    private static final String LOGIN_PAGE = "login";
    private static final String HOME_PAGE = "home";

    @RequestMapping("")
    public String login() {
        return LOGIN_PAGE;
    }
    @RequestMapping("/login")
    @ResponseBody
    public String toHomePage() {
        return HOME_PAGE;
    }
}
