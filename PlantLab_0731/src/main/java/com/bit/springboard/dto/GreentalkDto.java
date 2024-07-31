package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class GreentalkDto {
    private int green_id;
    private int mem_id;
    private String green_content;
    private LocalDateTime green_reg;
    private LocalDateTime green_mod;
    private String green_tag;
    private int green_like_cnt;
    private int green_bookmark_cnt;
    private String green_pic;
    private String mem_nickname;
    private String mem_pic;

    public int getGreen_id() {
        return green_id;
    }

    public void setGreen_id(int green_id) {
        this.green_id = green_id;
    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public String getGreen_content() {
        return green_content;
    }

    public void setGreen_content(String green_content) {
        this.green_content = green_content;
    }

    public LocalDateTime getGreen_reg() {
        return green_reg;
    }

    public void setGreen_reg(LocalDateTime green_reg) {
        this.green_reg = green_reg;
    }

    public LocalDateTime getGreen_mod() {
        return green_mod;
    }

    public void setGreen_mod(LocalDateTime green_mod) {
        this.green_mod = green_mod;
    }

    public String getGreen_tag() {
        return green_tag;
    }

    public void setGreen_tag(String green_tag) {
        this.green_tag = green_tag;
    }

    public int getGreen_like_cnt() {
        return green_like_cnt;
    }

    public void setGreen_like_cnt(int green_like_cnt) {
        this.green_like_cnt = green_like_cnt;
    }

    public int getGreen_bookmark_cnt() {
        return green_bookmark_cnt;
    }

    public void setGreen_bookmark_cnt(int green_bookmark_cnt) {
        this.green_bookmark_cnt = green_bookmark_cnt;
    }

    public String getGreen_pic() {
        return green_pic;
    }

    public void setGreen_pic(String green_pic) {
        this.green_pic = green_pic;
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
        return "GreentalkDto{" +
                "green_id=" + green_id +
                ", mem_id=" + mem_id +
                ", green_content='" + green_content + '\'' +
                ", green_reg=" + green_reg +
                ", green_mod=" + green_mod +
                ", green_tag='" + green_tag + '\'' +
                ", green_like_cnt=" + green_like_cnt +
                ", green_bookmark_cnt=" + green_bookmark_cnt +
                ", green_pic='" + green_pic + '\'' +
                ", mem_nickname='" + mem_nickname + '\'' +
                ", mem_pic='" + mem_pic + '\'' +
                '}';
    }
}
