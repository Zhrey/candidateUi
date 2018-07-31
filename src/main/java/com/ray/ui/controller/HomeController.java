package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.core.sdk.dto.UserBaseDTO;
import com.ray.core.sdk.service.CandidateManagementService;
import com.ray.ui.service.HomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.NotNull;

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
    private static final String FILE_MANAGE_PAGE = "filemanage";

    @Autowired
    private HomeService homeService;

    @RequestMapping("")
    public String loginPage() {
        return LOGIN_PAGE;
    }

    @RequestMapping("/home")
    public String homePage() {
        return HOME_PAGE;
    }
    @RequestMapping("/filemanage")
    public ModelAndView fileManagePage() {
        ModelAndView modelAndView = new ModelAndView(FILE_MANAGE_PAGE);
        return modelAndView;
    }
    @RequestMapping("/login")
    @ResponseBody
    public ResultDTO login(@RequestBody UserBaseDTO userBaseDTO) {

        return homeService.login(userBaseDTO);
    }

    /**
     * 用户登出
     */
    @RequestMapping("/logout")
    public String logout(HttpServletResponse response) {
        // TODO 清空cookie中的token userId
        //CookieUtil.set(response, ConstUtil.COOKIE_PMSN, null, 0);
        //CookieUtil.set(response, ConstUtil.COOKIE_TOKEN, null, 0);
        return "redirect:/";
    }
}
