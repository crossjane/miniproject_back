package com.bit.springboard.service;

import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.GreentalkDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

public interface GreentalkService {
    void green_post(GreentalkDto greentalkDto, MultipartFile[] uploadFiles);
    void green_modify(GreentalkDto greentalkDto);
    void green_delete(int id);
    void updateCnt(int id);
    List<GreentalkDto> getGreenList(Map<String, String> searchMap, Criteria cri);
    List<GreentalkDto> getGreenFileList(int id);
    GreentalkDto getGreen(int id);
    List<GreentalkDto> getPopGreenList();
}
