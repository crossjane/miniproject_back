package com.bit.springboard.service.impl;

import com.bit.springboard.common.FileUtils;
import com.bit.springboard.dao.GreentalkDao;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkFileDto;
import com.bit.springboard.service.GreentalkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.*;

@Service
public class GreentalkServiceImpl implements GreentalkService {
    private GreentalkDao greentalkDao;

    @Autowired
    public GreentalkServiceImpl(GreentalkDao greentalkDao) {
        this.greentalkDao = greentalkDao;
    }

    @Override
    public void green_post(GreentalkDto greentalkDto, MultipartFile[] uploadFiles) {
        List<GreentalkFileDto> greentalkFileDtoList = new ArrayList<>();

        if(uploadFiles != null && uploadFiles.length > 0) {
            String attachPath ="../../../uploaded";

            File directory = new File(attachPath);

            if(!directory.exists()) {
                directory.mkdirs();
            }

            Arrays.stream(uploadFiles).forEach(file -> {
                if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
                    GreentalkFileDto greentalkFileDto = FileUtils.parserFileInfo(file, attachPath);

                    greentalkFileDtoList.add(greentalkFileDto);
                }
            });
        }

        greentalkDao.green_post(greentalkDto, greentalkFileDtoList);
    }

    @Override
    public void green_modify(GreentalkDto greentalkDto) {
        greentalkDao.green_modify(greentalkDto);
    }

    @Override
    public void green_delete(int id) {
        greentalkDao.delete(id);
    }

    @Override
    public void updateCnt(int id) {
        greentalkDao.updateCnt(id);
    }

    @Override
    public List<GreentalkDto> getGreenList(Map<String, String> searchMap, Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());

        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("search", searchMap);
        paramMap.put("cri", cri);

        return greentalkDao.getGreenList(paramMap);
    }

    @Override
    public List<GreentalkDto> getPopGreenList() {
        return greentalkDao.getPopGreenList();
    }

    @Override
    public List<GreentalkDto> getGreenFileList(int id) {
        return List.of();
    }

    @Override
    public GreentalkDto getGreen(int id) {
        return null;
    }

    @Override
    public int getTotalCnt(Map<String, String> searchMap) {
        return greentalkDao.getTotalCnt(searchMap);
    }

    @Override
    public List<GreentalkDto> getNorGreenList() {
        return greentalkDao.getNorGreenList();
    }

    @Override
    public GreentalkDto getGreenOne(int id) {
        System.out.println(id);
        System.out.println(greentalkDao.getGreenOne(id));
        return greentalkDao.getGreenOne(id);
    }
}
