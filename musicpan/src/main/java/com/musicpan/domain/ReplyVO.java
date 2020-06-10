package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	
	private long rno;
	private long bno;
	private long ref;
	
	private String reply;
	private String id;
	private String b_name;
	private String name;
	
	private int reply_step;
	private long grade;
	private int del_flag;
	private int likeCnt;
	private int dislikeCnt;
	
	private Date regdate;
	private Date updatedate;
	
	
	
	
}//class
