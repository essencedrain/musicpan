package com.musicpan.domain;

import lombok.Data;

@Data
public class SongTxVolVO {

	private int idx;
	private String song;
	private String singer;
	private long vol;
	
}
