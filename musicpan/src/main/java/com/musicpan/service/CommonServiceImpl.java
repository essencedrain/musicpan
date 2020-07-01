package com.musicpan.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.NowAuctionVO;
import com.musicpan.domain.NowAuctionWeb;
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

	
	@Override
	public NowAuctionWeb getOneNowAuction() {
		NowAuctionVO vo = mapper.getOneNowAuction();
		NowAuctionWeb web = new NowAuctionWeb();
		
		web.setIdx(vo.getIdx());
		web.setSong(vo.getSong());
		web.setSinger(vo.getSinger());
		web.setTotalunits(vo.getTotalunits());
		web.setStartprice(vo.getStartprice());
		web.setUpdatedate(vo.getUpdatedate());
		web.setTxt_time_left(vo.getTxt_time_left());
		web.setSong_img3(vo.getSong_img3());
		
		String[] dummyArray = {"","","",""};
		String[] bidprice = vo.getBidprice().length() > 0 ? vo.getBidprice().split(","):dummyArray;
		String[] bidunit = vo.getBidunit().length() > 0 ? vo.getBidunit().split(","):dummyArray;
		String[] bidsum = vo.getBidsum().length() > 0 ? vo.getBidsum().split(","):dummyArray;
		String[] bidgap = vo.getBidgap().length() > 0 ? vo.getBidgap().split(","):dummyArray;
		
		List<String[]> bidInfo = new ArrayList<>();
		
		for(int i=0; i<5; i++) {
			String[] temp = new String[5];
			temp[0] = bidprice[i];
			temp[1] = bidunit[i];
			temp[2] = bidsum[i];
			temp[3] = bidgap[i];
			float profitTemp = ( (float)vo.getSong_amt_royalty_avg()/(float)Integer.parseInt(temp[0]) )*100.00f;
			temp[4] = profitTemp+"";
			
			bidInfo.add(temp);
		}
		
		web.setBidInfo(bidInfo);
		
		return web;
	}

	@Override
	public List<NowAuctionWeb> getAllNowAuction() {
		List<NowAuctionVO> voList = mapper.getAllNowAuction();
		List<NowAuctionWeb> result = new ArrayList<>();
		
		for(NowAuctionVO vo : voList) {
			
			NowAuctionWeb web = new NowAuctionWeb();
			
			web.setIdx(vo.getIdx());
			web.setSong(vo.getSong());
			web.setSinger(vo.getSinger());
			web.setTotalunits(vo.getTotalunits());
			web.setStartprice(vo.getStartprice());
			web.setUpdatedate(vo.getUpdatedate());
			web.setTxt_time_left(vo.getTxt_time_left());
			web.setSong_img3(vo.getSong_img3());
			
			
			String[] dummyArray = {"","","",""};
			String[] bidprice = vo.getBidprice().length() > 0 ? vo.getBidprice().split(","):dummyArray;
			String[] bidunit = vo.getBidunit().length() > 0 ? vo.getBidunit().split(","):dummyArray;
			String[] bidsum = vo.getBidsum().length() > 0 ? vo.getBidsum().split(","):dummyArray;
			String[] bidgap = vo.getBidgap().length() > 0 ? vo.getBidgap().split(","):dummyArray;
			
			List<String[]> bidInfo = new ArrayList<>();
			
			for(int i=0; i<5; i++) {
				String[] temp = new String[5];
				temp[0] = bidprice[i];
				temp[1] = bidunit[i];
				temp[2] = bidsum[i];
				temp[3] = bidgap[i];
				float profitTemp = ( (float)vo.getSong_amt_royalty_avg()/(float)Integer.parseInt(temp[0]) )*100.00f;
				temp[4] = profitTemp+"";
				
				bidInfo.add(temp);
			}
			
			web.setBidInfo(bidInfo);
			
			result.add(web);
			
		}//for
		
		return result;
	}

	
	
	@Override
	public int saveTableConfig(String id, List<Integer> list) {
		
		String checkedbox ="";
		
		for(int temp : list) {
			if(checkedbox.length()==0) {
				checkedbox += temp;
			}else {
				checkedbox += ","+temp;
			}
		}
		
		return mapper.saveTableConfig(id, checkedbox);
	}

	@Override
	public List<Integer> getTableConfing(String id) {
		
		List<Integer> result = new ArrayList<>();
		String temp = mapper.getTableConfing(id);
		
		if(temp!=null) {
			if(temp.length()>0) {
				String[] temp2 = temp.split(",");
				for(String temp3 : temp2) {
					result.add(Integer.parseInt(temp3));
				}
			}else {
				result = null;
			}
		}
		return result;
	}

}//class
