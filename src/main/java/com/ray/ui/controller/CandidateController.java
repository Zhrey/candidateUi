package com.ray.ui.controller;

import com.ray.cloud.framework.base.dto.PageResultDTO;
import com.ray.cloud.framework.base.dto.ResultDTO;
import com.ray.cloud.framework.base.dto.ResultError;
import com.ray.core.sdk.dto.SearchCandidateDTO;
import com.ray.core.sdk.dto.SearchCandidateResultDTO;
import com.ray.core.sdk.service.CandidateManagementSdkService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * Created by ZhangRui on 2018/8/5.
 */
@RestController
@RequestMapping(value = "candidate")
@Slf4j
public class CandidateController {

    @Autowired
    private CandidateManagementSdkService candidateManagementSdkService;

    /**
     * @Author: ZhangRui
     * @param: searchCandidateDTO
     * @Description: 查询候选人基本信息
     * @date: Created in 11:33 2018/8/16
     */
    @RequestMapping(value = "searchCandidate", method = RequestMethod.POST)
    public PageResultDTO<SearchCandidateResultDTO> searchCandidate(@RequestBody SearchCandidateDTO searchCandidateDTO) {
        ResultDTO<PageResultDTO<SearchCandidateResultDTO>> resultDTO = null;
        try {
            resultDTO = candidateManagementSdkService.searchCandidate(searchCandidateDTO);
            return resultDTO.getData();
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return null;
    }
}
