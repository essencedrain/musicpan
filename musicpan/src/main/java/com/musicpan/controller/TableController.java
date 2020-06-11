package com.musicpan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.musicpan.domain.SongJSON;
import com.musicpan.domain.SongTotalVO;
import com.musicpan.mapper.MusicMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/tables/")
@Controller
@Log4j
@AllArgsConstructor
public class TableController {

	@Autowired
	private MusicMapper mapper;
	
	
	
	//=========================================================================================
  	// g000
  	// 기능		:	
  	// 메서드	:	GET 
  	// URI		:	/tables/tauTable1
  	//=========================================================================================
	//@PreAuthorize("isAuthenticated()")
  	@GetMapping("/tauTable1")
  	public String tableTest(Model model) {
  		
  		ObjectMapper mapperJSON = new ObjectMapper();
  		String jsonString = null;
  		List<SongTotalVO> resultTemp = mapper.getSongTotalInfo();
  		
  		//후처리결과
  		List<SongJSON> result = new ArrayList<>();
  		
  		//후처리
  		for(SongTotalVO temp : resultTemp) {
  			
  			SongJSON tempData = new SongJSON();
  			
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
  			tempData.setBuyunit(temp.getBuyunit());
  			tempData.setBuyprice(temp.getBuyprice());
  			tempData.setSellunit(temp.getSellunit());
  			tempData.setSellprice(temp.getSellprice());
  			tempData.setRecentprice(temp.getRecentprice());
  			tempData.setAuctionunits(temp.getAuctionunits());
  			tempData.setAuctionmin(temp.getAuctionmin());
  			tempData.setAuctionavg(temp.getAuctionavg());
  			tempData.setCv12(temp.getCv12());
  			tempData.setCvall(temp.getCvall());
  			tempData.setStockCnt(temp.getStockCnt());
  			tempData.setBroadcast(temp.getBroadcast());
  			tempData.setTransfer(temp.getTransfer());
  			tempData.setDuplication(temp.getDuplication());
  			tempData.setPerformance(temp.getPerformance());
  			tempData.setOversea(temp.getOversea());
  			tempData.setEtc(temp.getEtc());
  			tempData.setAlltime(temp.getAlltime());
  			tempData.setIdx(temp.getIdx());
  			
  			result.add(tempData);
  		}//for
  		
  		try {
			jsonString = mapperJSON.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
  		
    	model.addAttribute("dataList", jsonString);
    	
  		return "dtable/tauTable1";
  	}
  	//=========================================================================================
	
	
	
	
	
}//class
