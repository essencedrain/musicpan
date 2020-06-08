package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MusicBasicVO {
	
	private int idx;
	private String song;
	private String singer;
	private Date releasedate;
	private String composer;
	private String lyricist;
	private String arranger;
	private int copyright;
	private int secright;
	private int stockcnt;
	private int recentprice;
	private Date recentpricetime;
	private int buyunit;
	private int buyprice;
	private int sellunit;
	private int sellprice;
	private Date updatedate;
	
}
