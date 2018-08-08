package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.ui.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 17:18 2018/7/31
 * @Modified By:
 */
@RestController
@RequestMapping(value = "resume")
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    @RequestMapping(value = "searchResume", method = RequestMethod.POST)
    public ResultDTO searchResume() {

        return null;
    }

    @RequestMapping(value = "uploadResume")
    @ResponseBody
    public ResultDTO uploadResume(@RequestParam("fileModel") MultipartFile multipartFile) {

        return resumeService.uploadResume(multipartFile);
    }
}
