package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SongTotalVO {

	private int idx; //1
	private String song; //2
	private String singer; //3
	private Date releasedate;//4
	private String composer;//5
	private String lyricist;//6
	private String arranger;//7
	private int copyRight;//8
	private int secRight;//9
	private int stockCnt;//10
	private int recentprice;//11
	private Date recntpricetime;//12
	private int buyunit;//13
	private int buyprice;//14
	private int sellunit;//15
	private int sellprice;//16
	private Date updatedate;//17
	private int auctionunits;//18
	private int auctionstart;//19
	private int auctionmin;//20
	private int auctionavg;//21
	private int avg3;//22
	private int avg6;//23
	private int avg12;//24
	private int avgall;//25
	private float cv12;//26
	private float cvall;//27
	private int alltime;//28
	private Date feeinfomonth;//29
	private int broadcast;//30
	private int transfer;//31
	private int duplication;//32
	private int performance;//33
	private int oversea;//34
	private int etc;//35
	
	
}//class
