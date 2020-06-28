package com.musicpan.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.musicpan.domain.SongTxVolVO;


public interface CommonService {

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
	
	
}//interface
