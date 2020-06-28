package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NowAuctionVO {
	
	private int idx;
	private String song;
	private String singer;
	private int totalunits;
	private int startprice;
	private String bidprice;
	private String bidunit;
	private String bidsum;
	private String bidgap;
	private Date updatedate;
}
