package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.PageResultDTO;
import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.core.sdk.dto.*;
import com.ray.core.sdk.service.CandidateManagementSdkService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by ZhangRui on 2018/8/5.
 */
@RestController
@RequestMapping(value = "task")
@Slf4j
public class TaskController {

    @Autowired
    private CandidateManagementSdkService candidateManagementSdkService;

    /**
     * @Author: ZhangRui
     * @param: searchTaskDTO
     * @Description: 查询候选人沟通情况
     * @date: Created in 11:33 2018/8/16
     */
    @RequestMapping(value = "searchTask", method = RequestMethod.POST)
    public PageResultDTO<SearchTaskResultDTO> searchTask(@RequestBody SearchTaskDTO searchTaskDTO) {
        ResultDTO<PageResultDTO<SearchTaskResultDTO>> resultDTO = null;
        try {
            resultDTO = candidateManagementSdkService.searchTask(searchTaskDTO);
            return resultDTO.getData();
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return null;
    }
    /**
     * @Author: ZhangRui
     * @param: searchCandidateDTO
     * @Description: 查询候选人沟通信息列表
     * @date: Created in 11:33 2018/8/16
     */
    @RequestMapping(value = "searchSituation", method = RequestMethod.POST)
    public PageResultDTO<SearchSituationResultDTO> searchSituation(@RequestBody SearchSituationDTO searchSituationDTO) {
        ResultDTO<PageResultDTO<SearchSituationResultDTO>> resultDTO = null;
        try {
            resultDTO = candidateManagementSdkService.searchSituation(searchSituationDTO);
            return resultDTO.getData();
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return null;
    }
}
