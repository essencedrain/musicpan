package com.musicpan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private Date regdate;
	private Date updateDate;
	private int hit;
	private String b_name;
	
	//회원정보
	private String id;
	private String name;
	private long grade;
	
	
	private String modiDate;
	private int replyCnt;
	private int likeCnt;
	private int dislikeCnt;
	private List<BoardAttachVO> attachList;
	private int notice_flag;
}