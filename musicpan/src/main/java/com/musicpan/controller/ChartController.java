package com.musicpan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.musicpan.domain.SongHistoryVO;
import com.musicpan.mapper.MusicMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/chart/")
@Controller
@Log4j
@AllArgsConstructor
public class ChartController {

	
	@Autowired
	private MusicMapper mapper;
	
	
	//=========================================================================================
  	// g000
  	// 기능		:	곡 정보
  	// 메서드	:	GET 
  	// URI		:	/tables/metaInfo
  	//=========================================================================================
	//@PreAuthorize("isAuthenticated()")
  	@GetMapping("/idx/{idx}")
  	public String chartTest(Model model, @PathVariable("idx") int idx) {
  		
  		ObjectMapper mapperJSON = new ObjectMapper();
  		String jsonString = null;
  		
  		List<SongHistoryVO> resultTemp = mapper.getHistoryIdx(idx);
  		
  		for(SongHistoryVO temp : resultTemp) {
  			
  			//date->string
  			Date tempTime = temp.getHistime();
  			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  			String to = transFormat.format(tempTime);
  			temp.setDate(to);
  			
  		}//for
  		
  		try {
			jsonString = mapperJSON.writeValueAsString(resultTemp);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
  		
  		model.addAttribute("historyIdx", jsonString);
  		model.addAttribute("songBasic", mapper.getOneSong(idx));
  		
  		return "dchart/basicChart";
  	}
	//=========================================================================================
}//class
