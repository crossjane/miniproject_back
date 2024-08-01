package com.bit.springboard.dao;

import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkFileDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class GreentalkDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public GreentalkDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public void green_post(GreentalkDto greentalkDto, List<GreentalkFileDto> greentalkFileDtoList) {
        mybatis.insert("GreentalkDao.post", greentalkDto);
    }

    public void green_modify(GreentalkDto greentalkDto) {
        mybatis.update("GreendtalkDao.modify", greentalkDto);
    }

    public void delete(int id) {
        mybatis.delete("GreentalkDao.delete", id);
    }


    public void updateCnt(int id) {
        mybatis.update("GreentalkDao.updateCnt", id);
    }

    public List<GreentalkDto> getGreenList(Map<String, Object> paramMap) {
        System.out.println("getGreentalkList실행됨");
        return mybatis.selectList("GreentalkDao.getGreenList", paramMap);
    }

    public List<GreentalkDto> getPopGreenList() {
        List<GreentalkDto> test = mybatis.selectList("GreentalkDao.getPopGreenList");
        for(GreentalkDto g:test) {
            System.out.println(g);
        }
        return mybatis.selectList("GreentalkDao.getPopGreenList");
    }

    public int getTotalCnt(Map<String, String> searchMap) {
        return mybatis.selectOne("GreentalkDao.getTotalCnt", searchMap);
    }

    public List<GreentalkDto> getNorGreenList() {
        List<GreentalkDto> test = mybatis.selectList("GreentalkDao.getNorGreenList");
        return mybatis.selectList("GreentalkDao.getNorGreenList");
    }

    public GreentalkDto getGreenOne(int id) {
        return mybatis.selectOne("GreentalkDao.getGreenOne", id);
    }
}
