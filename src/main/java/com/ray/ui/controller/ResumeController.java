package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.PageResultDTO;
import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.cloud.framework.base.dto.ResultError;
import com.ray.core.sdk.dto.SearchResumeDTO;
import com.ray.core.sdk.dto.SearchResumeResultDTO;
import com.ray.core.sdk.service.CandidateManagementSdkService;
import com.ray.ui.utils.CountFileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 17:18 2018/7/31
 * @Modified By:
 */
@Slf4j
@RestController
@RequestMapping(value = "resume")
public class ResumeController {

    @Autowired
    private CandidateManagementSdkService candidateManagementSdkService;

    /**
     * @Author: ZhangRui
     * @param: multipartFile
     * @Description: 上传简历
     * @date: Created in 11:33 2018/8/16
     */
    @RequestMapping(value = "uploadResume")
    @ResponseBody
    public ResultDTO uploadResume(@RequestParam("fileModel") MultipartFile multipartFile) {

        if (multipartFile != null) {
            File file = CountFileUtil.gettempfile(multipartFile);
            return candidateManagementSdkService.uploadFile(file);
        } else {
            return ResultDTO.failure(ResultError.error("没有识别简历！"));
        }
    }

    /**
     * @Author: ZhangRui
     * @param: searchCandidateDTO
     * @Description: 查询简历基本信息
     * @date: Created in 11:33 2018/8/16
     */
    @RequestMapping(value = "searchResume", method = RequestMethod.POST)
    public PageResultDTO<SearchResumeResultDTO> searchResume(@RequestBody SearchResumeDTO searchResumeDTO) {
        ResultDTO<PageResultDTO<SearchResumeResultDTO>> resultDTO = null;
        try {
            resultDTO = candidateManagementSdkService.searchResume(searchResumeDTO);
            return resultDTO.getData();
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return null;
    }
}
