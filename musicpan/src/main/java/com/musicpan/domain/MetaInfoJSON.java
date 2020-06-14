package com.musicpan.domain;

import lombok.Data;

@Data
public class MetaInfoJSON {
	private int idx; //인덱스
	private String song; //곡명
	private String singer; //가수명
	private String finalrelease;//공표일
	private String copyRight;//저작권 or 인접권
	private String secRight;//2차저작물작성권
	private int auctionunits;//옥션총수량
	private int stockCnt;//총지분수
	private float broadcast;//최근12개월 저작권구성비율 - 방송
	private float transfer;//최근12개월 저작권구성비율- 전송
	private float duplication;//최근12개월 저작권구성비율 - 복제
	private float performance;//최근12개월 저작권구성비율 - 공연
	private float oversea;//최근12개월 저작권구성비율 - 해외
	private float etc;//최근12개월 저작권구성비율 - 기타
	private String finalupdate;//최종업데이트시간
	private String feemonth;//저작기준월(마지막업데이트월)
	private String composer;//5: 작곡가
	private String lyricist;//6: 작사가
	private String arranger;//7: 편곡자
	
	/*
	private int buyunit;//매수호가
	private int buyprice;//매수잔량
	private int sellunit;//매도호가
	private int sellprice;//매도잔량
	private int recentprice;//최근거래가
	
	private int auctionmin;//옥션최저낙찰가
	private int auctionavg;//옥션총평균낙찰가
	private float cv12;//최근12개월 변동계수
	private float cvall;//올타임 변동계수
	private int alltime;//저작권정보제공월
	
	
	
	
	private float auctiongap_low;//옥션최저낙찰가와 현재 매도최저가 gap%
	private float auctiongap_avg;//옥션평균낙찰가와 현재 매도최저가 gap%
	private float avg3f;// 최근 3개월 기준 연수익률
	private float avg6f;// 최근 6개월 기준 연수익률
	private float avg12f;// 최근 12개월 기준 연수익률
	private float avgallf;// 최근 alltime 기준 연수익률
	private int pricefor8;// 8%적정가
	*/
	
	
	
}
