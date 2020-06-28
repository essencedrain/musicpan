package com.musicpan.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<SongTxVolVO> getTxVol20m() {
		return mapper.getTxVol20m();
	}
	
	@Override
	public List<SongTxVolVO> getTxVol1h() {
		return mapper.getTxVol1h();
	}
	
	@Override
	public List<SongTxVolVO> getTxVol4h() {
		return mapper.getTxVol4h();
	}
	
	@Override
	public List<SongTxVolVO> getTxVol24h() {
		return mapper.getTxVol24h();
	}
	
	@Override
	public List<SongTxVolVO> getTxVolWeek() {
		return mapper.getTxVolWeek();
	}
	
	@Override
	public List<SongTxVolVO> getTxVolMonth() {
		return mapper.getTxVolMonth();
	}
	
	@Transactional
	@Override
	public Map<String, List<SongTxVolVO>> getTxVol() {
		Map<String, List<SongTxVolVO>> result = new HashMap<>();
		result.put("20m", mapper.getTxVol20m());
		result.put("1h", mapper.getTxVol1h());
		result.put("4h", mapper.getTxVol4h());
		result.put("24h", mapper.getTxVol24h());
		result.put("Week", mapper.getTxVolWeek());
		result.put("Month", mapper.getTxVolMonth());
		return result;
	}
	
	
	
	@Override
	public List<SongTxVolVO> getTxUnit20m() {
		return mapper.getTxUnit20m();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnit1h() {
		return mapper.getTxUnit1h();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnit4h() {
		return mapper.getTxUnit4h();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnit24h() {
		return mapper.getTxUnit24h();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnitWeek() {
		return mapper.getTxUnitWeek();
	}
	
	@Override
	public List<SongTxVolVO> getTxUnitMonth() {
		return mapper.getTxUnitMonth();
	}
	
	@Transactional
	@Override
	public Map<String, List<SongTxVolVO>> getTxUnit() {
		
		Map<String, List<SongTxVolVO>> result = new HashMap<>();
		result.put("20m", mapper.getTxUnit20m());
		result.put("1h", mapper.getTxUnit1h());
		result.put("4h", mapper.getTxUnit4h());
		result.put("24h", mapper.getTxUnit24h());
		result.put("Week", mapper.getTxUnitWeek());
		result.put("Month", mapper.getTxUnitMonth());
		return result;
	}

	@Override
	public Date getRecentUpdatedateBasic() {
		return mapper.getRecentUpdatedateBasic();
	}

}//class
