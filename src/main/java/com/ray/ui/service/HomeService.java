package com.ray.ui.service;

import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.core.sdk.dto.UserBaseDTO;
import org.springframework.stereotype.Service;

/**
 * @Author: ZhangRui
 * @Description:
 * @date: Created in 15:09 2018/7/31
 * @Modified By:
 */
public interface HomeService {

    /**
     * @Author: ZhangRui
     * @param: username password
     * @Description: 登录
     * @date: Created in 15:10 2018/7/31
     */
    ResultDTO login(UserBaseDTO userBaseDTO);
}
