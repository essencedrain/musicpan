package com.musicpan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.PageDTO;
import com.musicpan.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/")
@AllArgsConstructor
public class BoardController {
		
	private BoardService service;
	
	//==============================================================================================
	/*
	 	NO			Task		Method	URL						Parameter		From		URL이동
	 	--------------------------------------------------------------------------------------------
	 	g000		리스트		GET		/board/{boardName}/list	
	 	g001		내용		GET		/board/{boardName}/content	
	 */
	//==============================================================================================
	
	
	
	
	//=========================================================================================
	// g000
	// 기능		:	리스트 보여줌
	// 메서드	:	GET
	// URI		:	/board/{boardName}/list
	//=========================================================================================
	@GetMapping("/{boardName}/list")
	public String list(Criteria cri, Model model, @PathVariable("boardName") String boardName) {
	
		
		if(cri.getB_name()==null) {
			cri.setB_name(boardName);
		}
		
		cri.setB_name2(makeKorean(cri.getB_name())); //b_name2 생성
		cri.setLimitNum( (cri.getPageNum()-1)*cri.getAmount() ); //limitNum 생성
		
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "board/list";
	}
	//=========================================================================================	
		
	
	
	
	
	//=========================================================================================
	// g001
	// 기능		:	내용 보여줌
	// 메서드	:	GET
	// URI		:	/board/{boardName}/content
	//=========================================================================================
	@GetMapping("/{boardName}/content")
	public String content(@ModelAttribute("cri") Criteria cri, Model model) {
		
		//log.info("////////////////////test : " + cri.toString());
		cri.setB_name2(makeKorean(cri.getB_name())); //b_name2 생성
		model.addAttribute("board", service.content(cri));
		return "board/content";
	}
	//=========================================================================================	
		
		
		
		
		
		
	//=========================================================================================
	// g000
	// 기능 :
	// 메서드 :  
	// URI : 
	//=========================================================================================
	
	//=========================================================================================	
		
	
	
	
	//=========================================================================================
	// 메서드1
	// 게시판 한글 이름 리턴 해주는 함수
	//=========================================================================================
	private String makeKorean(String b_name) {
		
		switch(b_name) {
			case "sample": return "샘플";
		}
		
		return null;
	}//b_name2
	//=========================================================================================
	
}//class
