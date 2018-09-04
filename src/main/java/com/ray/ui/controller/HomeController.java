package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.core.sdk.dto.UserBaseDTO;
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
    private static final String CANDIDATE_PAGE = "candidate";
    private static final String CONTACT_PAGE = "contact";
    private static final String ENTRY_PAGE = "entry";
    private static final String GIVE_UP_PAGE = "giveUp";
    private static final String INTERVIEW_PAGE = "interview";

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

    @RequestMapping("/candidate")
    public String candidatePage() {
        return CANDIDATE_PAGE;
    }

    @RequestMapping("/contact")
    public String contactPage() {
        return CONTACT_PAGE;
    }
    @RequestMapping("/entry")
    public String entryPage() {
        return ENTRY_PAGE;
    }
    @RequestMapping("/giveUp")
    public String giveUpPage() {
        return GIVE_UP_PAGE;
    }
    @RequestMapping("/interview")
    public String interviewPage() {
        return INTERVIEW_PAGE;
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
