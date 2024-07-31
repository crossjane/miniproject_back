package com.bit.springboard.dto;

public class BoardPageDto {
    private int startPage;
    private int endPage;
    private int total;
    private boolean prev, next;
    private Criteria cri;

    public BoardPageDto(Criteria cri, int total){
        this.cri = cri;
        this.total = total;

        this.endPage = (int)(Math.ceil(cri.getPageNum() / 5.0)) * 5;

        this.startPage = this.endPage - 4;

        int realEndPage = (int)Math.ceil((total / 1.0) / cri.getAmount());

        if(realEndPage < endPage){
            this.endPage = realEndPage;
        }

        // 이전, 다음 버튼 표출 여부
        this.prev = this.cri.getPageNum() > 1;
        this.next = this.cri.getPageNum() < realEndPage;

    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Criteria getCri() {
        return cri;
    }

    public void setCri(Criteria cri) {
        this.cri = cri;
    }

    @Override
    public String toString() {
        return "BoardPageDto{" +
                "startPage=" + startPage +
                ", endPage=" + endPage +
                ", total=" + total +
                ", cri=" + cri +
                '}';
    }
}
