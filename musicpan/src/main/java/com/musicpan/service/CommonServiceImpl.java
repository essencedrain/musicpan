package com.musicpan.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.musicpan.domain.MetaInfoJSON;
import com.musicpan.domain.NowAuctionVO;
import com.musicpan.domain.NowAuctionWeb;
import com.musicpan.domain.SongTotalVO;
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
		
		List<NowAuctionWeb> list = getAllNowAuction();
		return list.get(0);
		/*
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
		*/
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
			
			//정렬순서매기기
			if( web.getTxt_time_left().indexOf("시간")>0 ) {
				web.setSortNo( -1*(24-Integer.parseInt(web.getTxt_time_left().substring(0, web.getTxt_time_left().indexOf("시간")))) );
			}else {
				web.setSortNo( Integer.parseInt( web.getTxt_time_left().substring(0, web.getTxt_time_left().indexOf("일")) ) );
			}
			
			String[] dummyArray = {"","","",""};
			String[] bidprice = vo.getBidprice().length() > 0 ? vo.getBidprice().split(","):dummyArray;
			String[] bidunit = vo.getBidunit().length() > 0 ? vo.getBidunit().split(","):dummyArray;
			String[] bidsum = vo.getBidsum().length() > 0 ? vo.getBidsum().split(","):dummyArray;
			String[] bidgap = vo.getBidgap().length() > 0 ? vo.getBidgap().split(","):dummyArray;
			
			List<String[]> bidInfo = new ArrayList<>();
			
			if(bidprice.length<5) {
			
				for(int i=0; i<bidprice.length; i++) {
					String[] temp = new String[5];
					temp[0] = bidprice[i];
					temp[1] = bidunit[i];
					temp[2] = bidsum[i];
					temp[3] = bidgap[i];
					float profitTemp = ( (float)vo.getSong_amt_royalty_avg()/(float)Integer.parseInt(temp[0]) )*100.00f;
					temp[4] = profitTemp+"";
					
					bidInfo.add(temp);
				}
				
			}else {
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
			}
			
			web.setBidInfo(bidInfo);
			
			result.add(web);
			
		}//for
		
		//정렬
		result.sort(new Comparator<NowAuctionWeb>() {
			@Override
			public int compare(NowAuctionWeb o1, NowAuctionWeb o2) {
				// TODO Auto-generated method stub
				int a1 = o1.getSortNo();
				int a2 = o2.getSortNo();
				
				if(a1==a2) {return 0;}
				else if(a1>a2) {return 1;}
				else {return -1;}
			}
		});
		
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
		
		List<Integer> result = null;
		String temp = mapper.getTableConfing(id);
		
		if(temp!=null) {
			if(temp.length()>0) {
				result = new ArrayList<>();
				String[] temp2 = temp.split(",");
				for(String temp3 : temp2) {
					result.add(Integer.parseInt(temp3));
				}
			}
		}
		return result;
	}

	
	
	@Override
	public String metaInfo() {


		ObjectMapper mapperJSON = new ObjectMapper();
  		String jsonString = null;
  		
  		List<SongTotalVO> resultTemp = mapper.getSongTotalInfo();
  		
  		//후처리결과
  		List<MetaInfoJSON> result = new ArrayList<>();
  		
  		//후처리
  		for(SongTotalVO temp : resultTemp) {
  			
  			MetaInfoJSON tempData = new MetaInfoJSON();
  			/*
  			//avg 시리즈 매도가 기준 백분율전환 (최근x개월기준 수익률)
  			if(temp.getSellprice()!=0) {
				tempData.setAvg3f( (float)(Math.round( (float)temp.getAvg3()/(float)temp.getSellprice()*10000) / 100.00) );
				tempData.setAvg6f( (float)(Math.round( (float)temp.getAvg6()/(float)temp.getSellprice()*10000) / 100.00) );
				tempData.setAvg12f( (float)(Math.round( (float)temp.getAvg12()/(float)temp.getSellprice()*10000) / 100.00) );
				tempData.setAvgallf( (float)(Math.round( (float)temp.getAvgall()/(float)temp.getSellprice()*10000) / 100.00) );
  			}else {
  				tempData.setAvg3f(0);
  				tempData.setAvg6f(0);
  				tempData.setAvg12f(0);
  				tempData.setAvgallf(0);
  			}//if
  			
  			
  			//매도가-옥션최저낙찰가 가격차 -> 백분율
  			if(temp.getSellprice()<1 || temp.getAuctionmin()<1) {
  				tempData.setAuctiongap_low(0);
  			}else {
  				tempData.setAuctiongap_low( (float)(Math.round((float)(temp.getSellprice()-temp.getAuctionmin())/(float)temp.getAuctionmin()*1000)/10.0) );
  			}//if
  			
  			
  			//매도가-옥션평균낙찰가 가격차 -> 백분율
  			if(temp.getSellprice()<1 || temp.getAuctionavg()<1) {
  				tempData.setAuctiongap_avg(0);
  			}else {
  				tempData.setAuctiongap_avg( (float)(Math.round((float)(temp.getSellprice()-temp.getAuctionavg())/(float)temp.getAuctionavg()*1000)/10.0) );
  			}//if

  			
  			//최근12기준 8%적정가 = avg12/0.08
  			tempData.setPricefor8( (int)Math.round(temp.getAvg12()/0.08) );
  			*/
  			
  			//저작권기준월
  			Date tempTime = temp.getFeeinfomonth();
  			SimpleDateFormat transFormat = new SimpleDateFormat("MM");
  			String to = transFormat.format(tempTime);
  			tempData.setFeemonth(to);
  			
  			//최종업데이트시간
  			tempTime = temp.getUpdatedate();
  			transFormat = new SimpleDateFormat("HH:mm");
  			to = transFormat.format(tempTime);
  			tempData.setFinalupdate(to);
  			
  			//공표년
  			tempTime = temp.getReleasedate();
  			transFormat = new SimpleDateFormat("yyyy");
  			to = transFormat.format(tempTime);
  			tempData.setFinalrelease(to);
  			
  			//1:저작권, 0:인접권
  			tempData.setCopyRight( temp.getCopyRight()==1?"저작권":"인접권" );
  			
  			//2차저작물작성권 1:O 2:X
  			tempData.setSecRight( temp.getSecRight()==1?"O":"X" );
  			
  			//나머지데이터 정리
  			tempData.setSong(temp.getSong());
  			tempData.setSinger(temp.getSinger());
  			tempData.setAuctionunits(temp.getAuctionunits());
  			tempData.setStockCnt(temp.getStockCnt());
  			tempData.setBroadcast(temp.getBroadcast());
  			tempData.setTransfer(temp.getTransfer());
  			tempData.setDuplication(temp.getDuplication());
  			tempData.setPerformance(temp.getPerformance());
  			tempData.setOversea(temp.getOversea());
  			tempData.setEtc(temp.getEtc());
  			tempData.setIdx(temp.getIdx());
  			tempData.setComposer(temp.getComposer());
  			tempData.setLyricist(temp.getLyricist());
  			tempData.setArranger(temp.getArranger());
  			
  			result.add(tempData);
  		}//for
  		
  		try {
			jsonString = mapperJSON.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return jsonString;
	}
	

}//class
