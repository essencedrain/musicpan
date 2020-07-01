package com.musicpan.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.musicpan.domain.MetaInfoJSON;
import com.musicpan.domain.NowAuctionWeb;
import com.musicpan.domain.PriceInfoVO;
import com.musicpan.domain.SongTxVolVO;


public interface CommonService {
	
	public String metaInfo();
	
	public List<SongTxVolVO> getTxVol20m();
	public List<SongTxVolVO> getTxVol1h();
	public List<SongTxVolVO> getTxVol4h();
	public List<SongTxVolVO> getTxVol24h();
	public List<SongTxVolVO> getTxVolWeek();
	public List<SongTxVolVO> getTxVolMonth();
	public Map<String, List<SongTxVolVO>> getTxVol();
	
	
	public List<SongTxVolVO> getTxUnit20m();
	public List<SongTxVolVO> getTxUnit1h();
	public List<SongTxVolVO> getTxUnit4h();
	public List<SongTxVolVO> getTxUnit24h();
	public List<SongTxVolVO> getTxUnitWeek();
	public List<SongTxVolVO> getTxUnitMonth();
	public Map<String, List<SongTxVolVO>> getTxUnit();
	
	public Date getRecentUpdatedateBasic();
	
	public NowAuctionWeb getOneNowAuction();
	public List<NowAuctionWeb> getAllNowAuction();
	
	public int saveTableConfig(String id, List<Integer> list);
	public List<Integer> getTableConfing(String id);
}//interface
