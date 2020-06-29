package com.musicpan.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.FeeYearMonthVO;
import com.musicpan.domain.NowAuctionVO;
import com.musicpan.domain.SongBasicVO;
import com.musicpan.domain.SongHistoryVO;
import com.musicpan.domain.SongTotalVO;
import com.musicpan.domain.SongTxVolVO;

public interface MusicMapper {

	public int insert(SongBasicVO vo);
	
	public int insertFee(@Param("idx") int idx, @Param("feeMonth") Date feeMonth, @Param("fee") int fee);
	
	public int insertHistory(@Param("idx") int idx, @Param("hisTime") Date hisTime, @Param("hisPrice") int hisPrice, @Param("hisUnit") int hisUnit);
	
	public int insertAuction(
			//auctionInfo[i] = auctionCnt[i]+","+auctionUnits[i]+","+auctionStart[i]+","+auctionLowPrice[i]+","+auctionAvgPrice[i];
			// 옥션정보[옥션횟수] = 차수,수량,시작가,낙찰가,평균가
			@Param("idx") int idx
			,@Param("auctionCnt") int auctionCnt
			,@Param("auctionUnits") int auctionUnits
			,@Param("auctionStart") int auctionStart
			,@Param("auctionLowPrice") int auctionLowPrice
			,@Param("auctionAvgPrice") int auctionAvgPrice
			);
	
	public int insertFeeInfo(
			//2020-05-01,370,345,2,523,0,0 연월일,방송,전송,복제, 공연,해외,기타
			@Param("idx") int idx
			,@Param("feeMonth") Date feeMonth
			,@Param("broadcast") int broadcast
			,@Param("transfer") int transfer
			,@Param("duplication") int duplication
			,@Param("performance") int performance
			,@Param("oversea") int oversea
			,@Param("etc") int etc
			);
	
	public int updateSpreadInfo(
			@Param("idx") int idx
			,@Param("recentPrice") int recentPrice
			,@Param("recentPriceTime") Date recentPriceTime
			,@Param("buyUnit") int buyUnit
			,@Param("buyPrice") int buyPrice
			,@Param("sellUnit") int sellUnit
			,@Param("sellPrice") int sellPrice
			);
	
	public SongBasicVO getOneSong(@Param("idx") int idx);
	
	public List<Integer> getIdx();
	
	public Date getRecentPriceTime(@Param("idx") int idx);
	
	public List<Date> getHisTime(@Param("idx") int idx);
	
	public int getAuctionIdx(@Param("auctionIdx") int auctionIdx);
	
	public List<Integer> getAuctionAllCnt();
	
	public FeeYearMonthVO getFeeYearMonth();
	
	public int getIdxFromSongAndSinger(@Param("song") String song, @Param("singer") String singer);
	
	public List<SongTotalVO> getSongTotalInfo();
	
	public List<SongTotalVO> getTauPick();
	
	public List<SongTxVolVO> getTxVol20m();
	public List<SongTxVolVO> getTxVol1h();
	public List<SongTxVolVO> getTxVol4h();
	public List<SongTxVolVO> getTxVol24h();
	public List<SongTxVolVO> getTxVolWeek();
	public List<SongTxVolVO> getTxVolMonth();
	
	public List<SongTxVolVO> getTxUnit20m();
	public List<SongTxVolVO> getTxUnit1h();
	public List<SongTxVolVO> getTxUnit4h();
	public List<SongTxVolVO> getTxUnit24h();
	public List<SongTxVolVO> getTxUnitWeek();
	public List<SongTxVolVO> getTxUnitMonth();
	
	public List<SongHistoryVO> getHistoryIdx(@Param("idx") int idx);
	
	//진행중 옥션 누적합
	public List<Integer> getIdxNowAuction();
	public int insertNowAuction(NowAuctionVO vo);
	public int deleteByIdxNowAuction(@Param("idx") int idx);
	public Date getRecentUpdatedateBasic();
	public NowAuctionVO getOneNowAuction();
	public List<NowAuctionVO> getAllNowAuction();
	
	
	//테이블설정저장
	public int saveTableConfig(@Param("id") String id, @Param("checkedbox") String checkedbox);
	public String getTableConfing(@Param("id") String id);
}//interface
