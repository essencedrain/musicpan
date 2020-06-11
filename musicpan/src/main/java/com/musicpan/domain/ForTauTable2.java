package com.musicpan.domain;

import lombok.Data;

@Data
public class ForTauTable2 {

	
	private int idx; //인덱스
	private String song; //곡명
	private String singer; //가수명
	private int buyunit;//매수호가
	private int buyprice;//매수잔량
	private int sellunit;//매도호가
	private int sellprice;//매도잔량
	private int recentprice;//최근거래가
	private int auctionmin;//옥션최저낙찰가
	private float auctiongap_low;//옥션최저낙찰가와 현재 매도최저가 gap%
	private float avg3f;// 최근 3개월 기준 연수익률
	private float avg6f;// 최근 6개월 기준 연수익률
	private float avg12f;// 최근 12개월 기준 연수익률
	private float avgallf;// 최근 alltime 기준 연수익률
	private int pricefor8;// 8%적정가
	private String finalrelease;//공표일
	private float cvall;//올타임 변동계수
	private int alltime;//저작권정보제공월
}//class
