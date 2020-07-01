package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SongTotalVO {

	private int idx; //1: 인덱스
	private String song; //2: 곡명
	private String singer; //3: 가수명
	private Date releasedate;//4: 공표일
	private String composer;//5: 작곡가
	private String lyricist;//6: 작사가
	private String arranger;//7: 편곡자
	private int copyRight;//8: 저작권 or 인접권
	private int secRight;//9: 2차저작물작성권
	private int stockCnt;//10: 총지분수
	private int recentprice;//11: 최근거래가
	private int buyunit;//12: 매수호가
	private int buyprice;//13: 매수잔량
	private int sellunit;//14: 매도호가
	private int sellprice;//15: 매도잔량
	private Date updatedate;//16: 수정일
	private int auctionunits;//17: 옥션총수량
	private int auctionstart;//18: 옥션시작가
	private int auctionmin;//19: 옥션최저낙찰가
	private int auctionavg;//20: 옥션총평균낙찰가
	private int avg3;//21: 최근3개월 저작권료 기준 12개월치 환산수치
	private int avg6;//22: 최근6개월 저작권료 기준 12개월치 환산수치
	private int avg12;//23: 최근12개월 저작권료 기준 12개월치 환산수치
	private int avgall;//24: 최근all 저작권료 기준 12개월치 환산수치
	private float cv12;//25L 최근12개월 변동계수
	private float cvall;//26: 올타임 변동계수
	private int alltime;//27: 저작권정보제공월
	private Date feeinfomonth;//28: 최근12개월 저작권구성 갱신일
	private float broadcast;//29: 최근12개월 저작권구성비율 - 방송
	private float transfer;//30: 최근12개월 저작권구성비율- 전송
	private float duplication;//31: 최근12개월 저작권구성비율 - 복제
	private float performance;//32: 최근12개월 저작권구성비율 - 공연
	private float oversea;//33: 최근12개월 저작권구성비율 - 해외
	private float etc;//34: 최근12개월 저작권구성비율 - 기타
	private long marketcap;//35: 시가총액
	
}//class
