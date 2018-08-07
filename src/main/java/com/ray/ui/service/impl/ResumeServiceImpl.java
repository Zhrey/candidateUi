package com.ray.ui.service.impl;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.cloud.framework.base.dto.ResultError;
import com.ray.core.sdk.dto.UserBaseDTO;
import com.ray.core.sdk.service.CandidateManagementSdkService;
import com.ray.ui.service.HomeService;
import com.ray.ui.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 15:09 2018/7/31
 * @Modified By:
 */
@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private CandidateManagementSdkService candidateManagementSdkService;

    @Override
    public ResultDTO searchResume() {
        return null;
    }

    @Override
    public ResultDTO uploadResume(MultipartFile multipartFile) {

        if (multipartFile != null) {
            return candidateManagementSdkService.uploadFile(multipartFile);
        } else {
            return ResultDTO.failure(ResultError.error("没有识别简历！"));
        }
    }
}
