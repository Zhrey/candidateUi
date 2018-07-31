package com.ray.ui.service.impl;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.core.sdk.dto.UserBaseDTO;
import com.ray.core.sdk.service.CandidateManagementService;
import com.ray.ui.service.HomeService;
import com.ray.ui.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 15:09 2018/7/31
 * @Modified By:
 */
@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private CandidateManagementService candidateManagementService;

    @Override
    public ResultDTO searchResume() {
        return null;
    }
}
