package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkFileDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.GreentalkService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
//import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/board")
public class BoardController {
    private BoardService boardService;
    private GreentalkService greentalkService;
    private ApplicationContext applicationContext;

    @Autowired
    public BoardController(BoardService boardService, ApplicationContext applicationContext, GreentalkService greentalkService) {
        this.boardService = boardService;
        this.applicationContext = applicationContext;
        this.greentalkService = greentalkService;
    }

    @GetMapping("/board-main.do")
    public String boardList(Model model, @RequestParam("tab") int tab) {
        model.addAttribute("tab", tab);
        return "/board/board-main";
    }

    @GetMapping("/post.do")
    public String post() {
        return "/board/post";
    }

    @GetMapping("/greentalk.do")
    public String greentalk(Model model) {
        model.addAttribute("greentalkList" , greentalkService.getPopGreenList());
        return "/board/greentalk";
    }

    @GetMapping("/board-detail.do")
    public String board(Model model, @RequestParam("id") int id) {
        model.addAttribute("board", boardService.view_one(id));
        return "/board/board-detail";
    }

    @GetMapping("/greentalk_post")
    public String greentalk_post(){return"/board/greentalk_post";}

    @PostMapping("/greentalk-list-ajax.do")
    @ResponseBody
    public Map<String, Object> greentalkListAjax(@RequestParam Map<String, String> searchMap, Criteria cri) {
        try {
            greentalkService = applicationContext.getBean("greentalkServiceImpl", GreentalkService.class);

            cri.setAmount(3);

            List<Map<String, Object>> greentalkList = new ArrayList<>();

            greentalkService.getGreenList(searchMap, cri).forEach(greentalkDto -> {
                List<GreentalkDto> greentalkFileDtoList = greentalkService.getGreenFileList(greentalkDto.getGreen_id());

                Map<String, Object> map = new HashMap<>();

                map.put("greentalkDto", greentalkDto);

                if (greentalkFileDtoList.size() > 0)
                    map.put("file", greentalkFileDtoList.get(0));

                greentalkList.add(map);
            });

            Map<String, Object> returnMap = new HashMap<>();

            returnMap.put("greentalkList", greentalkList);

            return returnMap;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @PostMapping("/board-list.do")
    public String search_board(){
        return "/board/board-main";
    }

    @GetMapping("/update-cnt.do")
    public String board_view_cnt(@RequestParam("id") int id){
        boardService.update_view_cnt(id);
        return "redirect:/board/board-detail.do?id=" + id;
    }
}
