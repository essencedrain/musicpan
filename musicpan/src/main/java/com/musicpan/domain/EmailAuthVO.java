package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class EmailAuthVO {

	private String authemailkey;
	private String email;
	private Date createdate;
}
