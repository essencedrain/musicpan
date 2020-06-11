package com.musicpan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pwd;
	private String name;
	private String email;
	private Date regDate;
	private Date updatedate;
	private boolean user_del;
	private long grade;
	private List<AuthVO> authList;
	
	//전송용
	private long level;
	private String regDateString;
	private String updatedateString;
	private long nextExp;
	private String nextExpString;
	private String gradeString;
	private long expPercent;
}
