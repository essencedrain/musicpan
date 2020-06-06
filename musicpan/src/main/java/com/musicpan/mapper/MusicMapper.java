package com.musicpan.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.SongBasicVO;

public interface MusicMapper {

	public int insert(SongBasicVO vo);
	
	public int insertFee(@Param("idx") int idx, @Param("feeMonth") Date feeMonth, @Param("fee") int fee);
	
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
	
	public List<Integer> getIdx();
}//interface
