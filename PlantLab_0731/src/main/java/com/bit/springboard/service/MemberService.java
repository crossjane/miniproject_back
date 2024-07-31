package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;

public interface MemberService {
    void join(MemberDto memberDto);


    void saveAddress(MemberDto memberDto);


    void modify(MemberDto memberDto);

    MemberDto login(MemberDto memberDto);

}
