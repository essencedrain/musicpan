package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SongHistoryVO {

	private Date histime;
	private int hisprice;
	private int hisunit;
	private String date;
}//class
