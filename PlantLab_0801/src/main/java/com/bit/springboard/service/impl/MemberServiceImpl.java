package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberDao memberDao;

    @Autowired
    public MemberServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

    @Override
    public void join(MemberDto memberDto) {
        memberDao.join(memberDto);
    }

    @Override
    public void saveAddress(MemberDto memberDto) {
        memberDao.saveAddress(memberDto);
    }

    public void modify(MemberDto memberDto) {
        memberDao.modify(memberDto);
    }

    @Override
    public MemberDto login(MemberDto memberDto) {
        int loginIdCheck = memberDao.loginIdCheck(memberDto.getLogin_id());

        if(loginIdCheck == 0)
            throw new RuntimeException("idNotExist");

        MemberDto loginMember = memberDao.login(memberDto);

        if(loginMember == null)
            throw new RuntimeException("wrongPassword");
        return loginMember;
    }
}
