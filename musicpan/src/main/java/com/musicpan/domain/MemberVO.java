package com.musicpan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pwd;
	private String name;
	private Date regDate;
	private boolean user_del;
	private int grade;
	private List<AuthVO> authList;

}
