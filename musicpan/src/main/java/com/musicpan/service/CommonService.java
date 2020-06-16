package com.musicpan.service;

import java.util.List;

import com.musicpan.domain.SongTxVolVO;


public interface CommonService {

	public List<SongTxVolVO> getTxVol24();
	public List<SongTxVolVO> getTxVolWeek();
	public List<SongTxVolVO> getTxUnit24();
	public List<SongTxVolVO> getTxUnitWeek();
	
	
}//interface
