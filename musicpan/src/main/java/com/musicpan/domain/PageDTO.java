package com.musicpan.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {

  private int startPage;
  private int endPage;
  private int startRow;
  private boolean prev, next;

  private int total;
  private Criteria cri;
  
  //total = 전체 데이터 수
  public PageDTO(Criteria cri, int total) {

    this.cri = cri;
    this.total = total;

    this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5;

    this.startPage = this.endPage - 4;
    
    this.startRow = this.total - ( this.cri.getAmount()*(this.cri.getPageNum()-1) );

    int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));

    if (realEnd < this.endPage) {
      this.endPage = realEnd;
    }

    this.prev = this.startPage > 1;

    this.next = this.endPage < realEnd;
  }//cons
  
}//class

