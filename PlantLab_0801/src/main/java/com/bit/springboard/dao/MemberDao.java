package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    private final SqlSessionTemplate mybatis;

    @Autowired
    public MemberDao(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    // Member 관련 메소드
    public void join(MemberDto memberDto) {
        System.out.println("MemberDao의 join메소드 실행");
        mybatis.insert("MemberDao.join", memberDto);
        System.out.println("MemberDao의 join메소드 종료");
    }


    // Address 관련 메소드
    public void saveAddress(MemberDto memberDto) {
        mybatis.insert("AddressMapper.saveAddress", memberDto);
    }

    public void modify(MemberDto memberDto) {
        mybatis.update("MemberDao.modify", memberDto);
    }

    public int loginIdCheck(String loginId) {
        return mybatis.selectOne("MemberDao.loginIdCheck", loginId);
    }


    public MemberDto login(MemberDto memberDto) {
        return mybatis.selectOne("MemberDao.login", memberDto);
    }
}
