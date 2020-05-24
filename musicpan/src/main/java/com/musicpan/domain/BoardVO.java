package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno;
	private String title;
	private String content;
	private Date regdate;
	private Date updateDate;
	private int hit;
	private String id;
	private String name;

	//private int replyCnt;
	//private List<BoardAttachVO> attachList;
}