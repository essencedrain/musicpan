package com.musicpan.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class NowAuctionWeb {

	private int idx;
	private String song;
	private String singer;
	private int totalunits;
	private int startprice;
	private List<String[]> bidInfo;
	private String txt_time_left;
	private String song_img3;
	private Date updatedate;
	
}
