package com.musicpan.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.musicpan.domain.MetaInfoJSON;
import com.musicpan.domain.PriceInfoVO;
import com.musicpan.domain.SongTotalVO;
import com.musicpan.mapper.MusicMapper;
import com.musicpan.security.domain.CustomUser;
import com.musicpan.service.CommonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/tables/")
@Controller
@Log4j
@AllArgsConstructor
public class TableController {

	@Autowired
	private MusicMapper mapper;
	
	@Autowired
	private CommonService commonService;
	
	//=========================================================================================
  	// g000
  	// 기능		:	곡 정보
  	// 메서드	:	GET 
  	// URI		:	/tables/metaInfo
  	//=========================================================================================
	//@PreAuthorize("isAuthenticated()")
  	@GetMapping("/metaInfo")
  	public String tableTest(Model model) {
  		
    	model.addAttribute("dataList", commonService.metaInfo());
    	
  		return "dtable/metaInfo";
  	}
  	//=========================================================================================
	
	
	
	
	
  	//=========================================================================================
  	// g001
  	// 기능		:	가격정보
  	// 메서드	:	GET 
  	// URI		:	/tables/priceInfo
  	//=========================================================================================
  	//@PreAuthorize("isAuthenticated()")
  	@GetMapping("/priceInfo")
  	public String tableTest2(Model model, Authentication authentication) {
  		
  		
  		//로그인시 테이블 설정 전달
		if(authentication != null) {
			CustomUser user = (CustomUser) authentication.getPrincipal();
			if(user.getUsername().length()>0){
				List<Integer> result = commonService.getTableConfing( user.getUsername() );
				if(result!=null) {
					model.addAttribute("config", result);
				}
			}
		}
  		
  		
  		List<SongTotalVO> resultTemp = mapper.getSongTotalInfo();
  		
  		//후처리결과
  		List<PriceInfoVO> result = procPriceInfo(resultTemp);
  		
  		
  		Date tempTime = resultTemp.get(0).getUpdatedate();
		SimpleDateFormat transFormat = new SimpleDateFormat("MM-dd hh:mm:ss");
		String updatedate = transFormat.format(tempTime);
		
  		
		model.addAttribute("updatedate", updatedate);
  		model.addAttribute("dataList", result);
  		model.addAttribute("tableTitle", "가격 정보");
  		model.addAttribute("tableLink", "priceInfo");
  		
  		return "dtable/priceInfo";
  	}
  	//=========================================================================================
  	
  	
  	
  	
  	//=========================================================================================
  	// g002
   	// 기능		:	타우픽
   	// 메서드	:	GET
   	// URI		:	/tables/tauPickV1
  	//=========================================================================================
  	@PreAuthorize("isAuthenticated()")
  	@GetMapping("/tauPickV1")
  	public String tauPick(Model model) {
  		
  		List<SongTotalVO> resultTemp = mapper.getTauPick();
  		
  		//후처리결과
  		List<PriceInfoVO> result = procPriceInfo(resultTemp);
  		
  		
  		Date tempTime = resultTemp.get(0).getUpdatedate();
		SimpleDateFormat transFormat = new SimpleDateFormat("MM-dd hh:mm:ss");
		String updatedate = transFormat.format(tempTime);
		
  		
  		
		model.addAttribute("updatedate", updatedate);
  		model.addAttribute("dataList", result);
  		model.addAttribute("tableTitle", "타우픽 V1");
  		model.addAttribute("tableLink", "tauPickV1");
  		model.addAttribute("tableDescription", "tauPickV1");
  		
  		return "dtable/tauPick";
  	}
  	//=========================================================================================
  	
  	
  	
  	
  	//=========================================================================================
  	// g003
  	// 기능		:	거래대금
  	// 메서드	:	GET
  	// URI		:	/tables/tauVolume
  	//=========================================================================================
  	@GetMapping("/tauVolume")
  	public String tauVolume(Model model) {
  		
  		String[][] timeArray = {
  				{"20m","10분"}
  				,{"1h","1시간"}
  				,{"4h","4시간"}
  				,{"24h","24시간"}
  				,{"Week","1주일"}
  				,{"Month","1달"}
  				};
  		model.addAttribute("txVol", commonService.getTxVol());
  		model.addAttribute("txUnit", commonService.getTxUnit());
  		model.addAttribute("timeArray", timeArray);
  		model.addAttribute("updatedate", commonService.getRecentUpdatedateBasic());
  	
  		return "dtable/tauVolume";
  	}
  	//=========================================================================================
  	
  	
  	
  	
  	//=========================================================================================
  	// g004
  	// 기능		:	옥션 정보
  	// 메서드	:	GET
  	// URI		:	/tables/auctionInfo
  	//=========================================================================================
  	@GetMapping("/auctionInfo")
  	public String auctionInfo(Model model) {
  		
  		model.addAttribute("auctionList", commonService.getAllNowAuction());
  		
  		return "dtable/auctionInfo";
  	}
  	//=========================================================================================
  	
  	
  	
  	
  	//=========================================================================================
  	// p000
  	// 기능		:	컬럼체크 정보 저장
  	// 메서드	:	post
  	// URI		:	/tables/saveTableConfig
  	//=========================================================================================
  	@PostMapping("/saveTableConfig")
  	public String saveTableConfig(
  			Model model
  			, @RequestParam(value="priceCheckBox",required=true) List<Integer> priceCheckBox
  			, @RequestParam(value="id",required=true) String id
  	) {
  		
  		//log.info("test : " + id+"//"+priceCheckBox.toString());
  		
  		commonService.saveTableConfig(id, priceCheckBox);
  		
  		return "redirect:/tables/priceInfo";
  	}
  	//=========================================================================================
  	
  	
  	
  	
  	//-----------------------------------------------------------------------------------------
  	// 가격정보 후처리 펑션
  	//-----------------------------------------------------------------------------------------
  	private List<PriceInfoVO> procPriceInfo(List<SongTotalVO> inputData){
  		
  		//후처리결과
  		List<PriceInfoVO> result = new ArrayList<>();
  		
  		//시가총액 순위저장용
  		int rank = 0;
  		
  		//후처리
  		for(SongTotalVO temp : inputData) {
  			
  			PriceInfoVO tempData = new PriceInfoVO();
  			
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
  			
  			
  			//최근12기준 8%적정가 = avg12/0.08
  			tempData.setPricefor8( (int)Math.round(temp.getAvg12()/0.08) );
  			
  			
  			//공표년
  			Date tempTime = temp.getReleasedate();
  			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy");
  			String to = transFormat.format(tempTime);
  			tempData.setFinalrelease(to);
  			
  			
  			//시가총액 순위
  			rank +=1;
  			tempData.setMarketrank(rank);
  			
  			//시가총액
  			if(temp.getMarketcap()!=0) {
	  			String tempMarketcap = temp.getMarketcap()+"";
	  			tempMarketcap = tempMarketcap.substring(0, tempMarketcap.length()-3);
	  			tempData.setMarketcap( Long.parseLong(tempMarketcap) );
  			}else {
  				tempData.setMarketcap( 0 );
  			}
  			
  			//나머지데이터 정리
  			tempData.setSong(temp.getSong());
  			tempData.setSinger(temp.getSinger());
  			tempData.setBuyunit(temp.getBuyunit());
  			tempData.setBuyprice(temp.getBuyprice());
  			tempData.setSellunit(temp.getSellunit());
  			tempData.setSellprice(temp.getSellprice());
  			tempData.setRecentprice(temp.getRecentprice());
  			tempData.setCvall(temp.getCvall());
  			tempData.setIdx(temp.getIdx());
  			tempData.setAlltime(temp.getAlltime());
  			tempData.setAuctionmin(temp.getAuctionmin());
  			
  			result.add(tempData);
  		}//for
  		
  		return result;
  	}
  	//-----------------------------------------------------------------------------------------
  	
}//class
