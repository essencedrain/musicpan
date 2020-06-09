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
  		try {
			jsonString = mapperJSON.writeValueAsString(mapper.getSongTotalInfo());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
  		
    	model.addAttribute("dataList", jsonString);
    	
  		return "dtable/temp";
  	}
  	//=========================================================================================
	
	
	
	
	
}//class
