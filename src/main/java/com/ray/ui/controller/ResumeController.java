package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.ui.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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

    @RequestMapping(value = "uploadResume", method = RequestMethod.POST)
    public ResultDTO uploadResume(@RequestParam("fileModel") MultipartFile multipartFile) {

        return resumeService.uploadResume(multipartFile);
    }
}
