package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
@Controller
public class MainController {

    private final BoardService boardService;

    @Autowired
    public MainController(BoardService boardService) {
        this.boardService = boardService;
    }


    @GetMapping("/")
    public String mainPage(Model model) {
        // 인기 정보글과 Q&A 게시글가져오기
        List<BoardDto> infoPosts = boardService.view_popular(1); // tab:1 정보글
        List<BoardDto> qaPosts = boardService.view_popular(2);   // tab:2 Q&A
        System.out.println(infoPosts);
        System.out.println(qaPosts);
        model.addAttribute("infoPosts", infoPosts);
        model.addAttribute("qaPosts", qaPosts);

        return "index";
    }
}
