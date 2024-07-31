package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.MemberService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;


@Controller
@RequestMapping("/member")
public class MemberController {
    private MemberService memberService;
    private BoardService boardService;

    @Autowired
    public MemberController(MemberService memberService, BoardService boardService) {
        this.memberService = memberService;
        this.boardService = boardService;
    }

    @GetMapping("/login.do")
    public String loginView(){
        return "member/login_01";
    }

    @PostMapping("/login.do")
    public String login(MemberDto memberDto, Model model, HttpSession session) {
        try {
            System.out.println("로그인 시도: " + memberDto.getLogin_id());

            MemberDto loggedInMember = memberService.login(memberDto);

            System.out.println("로그인 성공: " + loggedInMember.getLogin_id());
            loggedInMember.setPassword("");

            session.setAttribute("loggedInMember", loggedInMember);

            return "redirect:/";

        }catch (Exception e) {
            System.out.println("로그인 실패: " + e.getMessage());
            model.addAttribute("loginFailMsg", e.getMessage());
            return "member/login_01";
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    @GetMapping("/join.do")
    public String joinView(){
        return "member/join_01";
    }

    @PostMapping("/join.do")
    public String join(MemberDto memberDto) {
        memberService.join(memberDto);
        return "member/login_01";
    }


    @Controller
    public class AddressController {
        private final MemberService memberService;

        @Autowired
        public AddressController(MemberService memberService) {
            this.memberService = memberService;
        }


        @PostMapping("/address/save")
        @ResponseBody
        public String saveAddress(MemberDto memberDto) {
            memberService.saveAddress(memberDto);
            return "주소가 성공적으로 저장되었습니다.";
        }
    }

    @PostMapping("/modify.do")
    public String modify(MemberDto memberDto, MultipartFile imgFile, RedirectAttributes redirectAttributes) {

        if(imgFile != null) {
            String attachPath = "C:/Project/PlantLab/src/main/webapp/static/images/storage/";

            File directory = new File(attachPath);

            if(!directory.exists()) {
                directory.mkdirs();
            }

            File uploadFile = new File(attachPath + imgFile.getOriginalFilename());

            memberDto.setMem_pic(imgFile.getOriginalFilename());

            try{
                imgFile.transferTo(uploadFile);
            } catch (IOException ie) {
                System.out.println(ie.getMessage());
            }
        }
        memberService.modify(memberDto);
        return "member/login_01";
    }

    @GetMapping("/mypage.do")
    public String boardView(Model model, @RequestParam("mem_id") int mem_id) {
        model.addAttribute("myWrite", boardService.getBoard(mem_id));
        return "/member/mypage";
    }

}
