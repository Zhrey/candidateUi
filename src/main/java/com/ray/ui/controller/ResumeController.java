package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.ResultDTO;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 17:18 2018/7/31
 * @Modified By:
 */
@RestController
@RequestMapping(value = "resume")
public class ResumeController {

    @RequestMapping(value = "searchResume", method = RequestMethod.POST)
    public ResultDTO searchResume() {

        return null;
    }
}
