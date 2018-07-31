package com.ray.ui.service;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.core.sdk.dto.UserBaseDTO;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 15:09 2018/7/31
 * @Modified By:
 */
public interface ResumeService {

    /**
     * @Author: ZhangRui
     * @param:
     * @Description: 查询简历
     * @date: Created in 15:10 2018/7/31
     */
    ResultDTO searchResume();
}
