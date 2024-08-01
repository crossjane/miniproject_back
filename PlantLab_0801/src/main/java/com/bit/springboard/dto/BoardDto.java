package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class BoardDto {
    private int row_num;
    private int board_id;
    private int mem_id;
    private int board_type;
    private String board_title;
    private String board_content;
    private LocalDateTime board_reg;
    private LocalDateTime board_mod;
    private int board_view_cnt;
    private int board_like_cnt;
    private int board_bookmark_cnt;
    private String mem_nickname;
    private String mem_pic;

    public int getRow_num() {
        return row_num;
    }

    public void setRow_num(int row_num) {
        this.row_num = row_num;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public int getBoard_type() {
        return board_type;
    }

    public void setBoard_type(int board_type) {
        this.board_type = board_type;
    }

    public String getBoard_title() {
        return board_title;
    }

    public void setBoard_title(String board_title) {
        this.board_title = board_title;
    }

    public String getBoard_content() {
        return board_content;
    }

    public void setBoard_content(String board_content) {
        this.board_content = board_content;
    }

    public LocalDateTime getBoard_reg() {
        return board_reg;
    }

    public void setBoard_reg(LocalDateTime board_reg) {
        this.board_reg = board_reg;
    }

    public LocalDateTime getBoard_mod() {
        return board_mod;
    }

    public void setBoard_mod(LocalDateTime board_mod) {
        this.board_mod = board_mod;
    }

    public int getBoard_view_cnt() {
        return board_view_cnt;
    }

    public void setBoard_view_cnt(int board_view_cnt) {
        this.board_view_cnt = board_view_cnt;
    }

    public int getBoard_like_cnt() {
        return board_like_cnt;
    }

    public void setBoard_like_cnt(int board_like_cnt) {
        this.board_like_cnt = board_like_cnt;
    }

    public int getBoard_bookmark_cnt() {
        return board_bookmark_cnt;
    }

    public void setBoard_bookmark_cnt(int board_bookmark_cnt) {
        this.board_bookmark_cnt = board_bookmark_cnt;
    }

    public String getMem_nickname() {
        return mem_nickname;
    }

    public void setMem_nickname(String mem_nickname) {
        this.mem_nickname = mem_nickname;
    }

    public String getMem_pic() {
        return mem_pic;
    }

    public void setMem_pic(String mem_pic) {
        this.mem_pic = mem_pic;
    }

    @Override
    public String toString() {
        return "BoardDto{" +
                "row_num=" + row_num +
                ", board_id=" + board_id +
                ", mem_id=" + mem_id +
                ", board_type=" + board_type +
                ", board_title='" + board_title + '\'' +
                ", board_content='" + board_content + '\'' +
                ", board_reg=" + board_reg +
                ", board_mod=" + board_mod +
                ", board_view_cnt=" + board_view_cnt +
                ", board_like_cnt=" + board_like_cnt +
                ", board_bookmark_cnt=" + board_bookmark_cnt +
                ", mem_nickname='" + mem_nickname + '\'' +
                '}';
    }
}
