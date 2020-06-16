package com.musicpan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicpan.domain.SongTxVolVO;
import com.musicpan.mapper.MusicMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class CommonServiceImpl implements CommonService {

	
	@Setter(onMethod_ = @Autowired)
	private MusicMapper mapper;
	
	@Override
	public List<SongTxVolVO> getTxVol24() {
		return mapper.getTxVol24();
	}
	
	@Override
	public List<SongTxVolVO> getTxVolWeek() {
		return mapper.getTxVolWeek();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnit24() {
		return mapper.getTxUnit24();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnitWeek() {
		return mapper.getTxUnitWeek();
	}

}//class
