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
	private int buyunit;//12
	private int buyprice;//13
	private int sellunit;//14
	private int sellprice;//15
	private Date updatedate;//16
	private int auctionunits;//17
	private int auctionstart;//18
	private int auctionmin;//19
	private int auctionavg;//20
	private int avg3;//21
	private int avg6;//22
	private int avg12;//23
	private int avgall;//24
	private float cv12;//25
	private float cvall;//26
	private int alltime;//27
	private Date feeinfomonth;//28
	private float broadcast;//29
	private float transfer;//30
	private float duplication;//31
	private float performance;//32
	private float oversea;//33
	private float etc;//34
	
	//music_basic 컬럼에서 recentprice 제외
	//아래는 DB에 없는 커스텀
	
	private float auctiongap_low;
	private float auctiongap_avg;
	private float mucastock;
	private float avg3f;
	private float avg6f;
	private float avg12f;
	private float avgallf;
	private int pricefor8;
}//class
