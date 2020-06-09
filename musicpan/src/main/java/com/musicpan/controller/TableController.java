package com.musicpan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
  	// URI		:	/tables/tableTest
  	//=========================================================================================
  	@GetMapping("/tableTest")
  	public String tableTest(Model model) {
  		
  		ObjectMapper mapperJSON = new ObjectMapper();
  		String jsonString = null;
  		List<SongTotalVO> result = mapper.getSongTotalInfo();
  		
  		//후처리
  		for(SongTotalVO temp : result) {
  			
  			//avg 시리즈 매도가 기준 백분율전환 (최근x개월기준 수익률)
  			if(temp.getSellprice()!=0) {
				temp.setAvg3f( (float)(Math.round( (float)temp.getAvg3()/(float)temp.getSellprice()*10000) / 100.00) );
				temp.setAvg6f( (float)(Math.round( (float)temp.getAvg6()/(float)temp.getSellprice()*10000) / 100.00) );
				temp.setAvg12f( (float)(Math.round( (float)temp.getAvg12()/(float)temp.getSellprice()*10000) / 100.00) );
				temp.setAvgallf( (float)(Math.round( (float)temp.getAvgall()/(float)temp.getSellprice()*10000) / 100.00) );
  			}else {
  				temp.setAvg3f(0);
  				temp.setAvg6f(0);
  				temp.setAvg12f(0);
  				temp.setAvgallf(0);
  			}//if
  			
  			
  			//매도가-옥션최저낙찰가 가격차 -> 백분율
  			if(temp.getSellprice()<1 || temp.getAuctionmin()<1) {
  				temp.setAuctiongap_low(0);
  			}else {
  				temp.setAuctiongap_low( (float)(Math.round((float)(temp.getSellprice()-temp.getAuctionmin())/(float)temp.getAuctionmin()*1000)/10.0) );
  			}//if
  			
  			
  			//매도가-옥션평균낙찰가 가격차 -> 백분율
  			if(temp.getSellprice()<1 || temp.getAuctionavg()<1) {
  				temp.setAuctiongap_avg(0);
  			}else {
  				temp.setAuctiongap_avg( (float)(Math.round((float)(temp.getSellprice()-temp.getAuctionavg())/(float)temp.getAuctionavg()*1000)/10.0) );
  			}//if

  			
  			//전체지분대비 뮤카보유율
  			if(temp.getAuctionunits()==0 || temp.getStockCnt()==0) {
  				temp.setMucastock(0);
  			}else {
  				temp.setMucastock( (float)(Math.round( (float)temp.getAuctionunits()/(float)temp.getStockCnt()*1000) / 10.00) );
  			}//if
  			
  			
  			//최근12기준 8%적정가 = avg12/0.08
  			temp.setPricefor8( (int)Math.round(temp.getAvg12()/0.08) );
  			
  		}//for
  		
  		try {
			jsonString = mapperJSON.writeValueAsString(result);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
  		
    	model.addAttribute("dataList", jsonString);
    	
  		return "dtable/temp";
  	}
  	//=========================================================================================
	
	
	
	
	
}//class
