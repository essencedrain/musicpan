package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SongBasicVO {
	private int idx;
	private String song;
	private String singer;
	private Date releasedate;
	private String composer;
	private String lyricist;
	private String arranger;
	private int copyRight;
	private int secRight;
	private int stockCnt;
	private int recentprice;
	private Date recntpricetime;
	private int buyunit;
	private int buyprice;
	private int sellunit;
	private int sellprice;
	private Date updatedate;
	
}//class
