package com.musicpan.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.musicpan.domain.BoardVO;
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
	 	NO			Task		Method	URL							Parameter		From		URL이동
	 	--------------------------------------------------------------------------------------------
	 	g000		리스트		GET		/board/{boardName}/list	
	 	g001		내용		GET		/board/content
	 	g002		내용2		GET		/board/{boardName}/content
	 	g003		글쓰기		GET		/board/register
	 					
	 	p000		글쓰기		POST	/board/register				
	 */
	//==============================================================================================
	
	
	
	
	//=========================================================================================
	// g000
	// 기능		:	리스트 보여줌
	// 메서드	:	GET
	// URI		:	/board/{boardName}/list
	//=========================================================================================
	@GetMapping("/{boardName}/list")
	public String list(Criteria cri, Model model, @PathVariable("boardName") String boardName) throws Exception {
	
		
		//sql injection 체크
		if(cri.getB_name()==null) {
			if(isSqlInjection(boardName)) {throw new Exception();}
			//cri에 b_name 비어 있으면 채워줌
			cri.setB_name(boardName);
		}else{
			if(isSqlInjection(cri.getB_name())) {throw new Exception();}
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
	// 기능		:	내용 보여줌1
	// 메서드	:	GET
	// URI		:	/board/content
	//=========================================================================================
	@GetMapping("/content")
	public String content(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		//log.info("////////////////////test : " + cri.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(cri.getB_name())) {throw new Exception();}
		
		cri.setB_name2(makeKorean(cri.getB_name())); // 한글 게시판명 생성
		cri.setLimitNum( (cri.getPageNum()-1)*cri.getAmount() ); //limitNum 생성
		
		int total = service.getTotal(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("board", service.content(cri));
		
		//log.info("////////////////////cri : " + cri.toString());
		//log.info("////////////////////pageMaker : " + new PageDTO(cri, total).toString());
		//log.info("////////////////////board : " + service.content(cri).toString());
		
		return "board/content";
	}
	//=========================================================================================	
	
	
	
	//=========================================================================================
	// g002
	// 기능		:	내용 보여줌2
	// 메서드	:	GET
	// URI		:	/board/{boardName}/content/{bno}
	//=========================================================================================
	@GetMapping("/{boardName}/content/{bno}")
	public String content2(Model model, @PathVariable("boardName") String boardName, @PathVariable("bno") String bno) throws Exception{
		
		
		// sqlinjection 대응
		if(isSqlInjection(boardName)) {throw new Exception();}
		
		/*
		Criteria cri = new Criteria();
		cri.setBno(Long.parseLong(bno)); //bno삽입
		cri.setB_name(boardName);//게시판명 삽입
		cri.setB_name2(makeKorean(cri.getB_name())); //한글 게시판명 생성
		
		int total = service.getTotal(cri);
		
		cri.setPageNum( (int) Math.ceil( (total-Long.parseLong(bno))/(cri.getAmount()*1.0) ) );
		
		cri.setLimitNum( (cri.getPageNum()-1)*cri.getAmount() ); //limitNum 생성
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("board", service.content(cri));
		
		
		 */
		return "board/content";
	}
	//=========================================================================================	
		
		
		
		
		
	//=========================================================================================
	// g003
	// 기능		:	글쓰기폼 보여주기
	// 메서드	:	GET  
	// URI		: 	/board/register
	//=========================================================================================
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String writeForm(Model model, @RequestParam("b_name") String b_name) throws Exception{
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		model.addAttribute("b_name", b_name);
		model.addAttribute("b_name2", makeKorean(b_name));
		return "board/writeForm";
	}
	//=========================================================================================
	
	
	
	//=========================================================================================
	// p000
	// 기능		:	글쓰기 처리
	// 메서드	:	POST
	// URI		:	/board/register
	//=========================================================================================
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String writePro(Model model, BoardVO boardVO) throws Exception{
		
		//log.info("//////////////////test : " + boardVO.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(boardVO.getB_name())) {throw new Exception();}
		
		service.register(boardVO);
		
		return "redirect:/board/"+boardVO.getB_name()+"/list";
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// g000
	// 기능		:
	// 메서드	:  
	// URI		: 
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
	
	//=========================================================================================
	// 메서드2
	// SqlInjection 대응 함수
	// 정해진 값만 들어와짐
	//=========================================================================================
	private boolean isSqlInjection(String b_name) {
		
		switch(b_name) {
		case "sample": return false;
		default : return true;
		}
		
	}//b_name2
	//=========================================================================================
	
}//class
