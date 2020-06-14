package com.musicpan.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.musicpan.domain.BoardAttachVO;
import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;
import com.musicpan.domain.PageDTO;
import com.musicpan.domain.ReplyVO;
import com.musicpan.service.BoardService;
import com.musicpan.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/")
@AllArgsConstructor
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService replyService;
	
	//============================================================================================================================================================
	/*
	 	NO			Task		Method	URL									Parameter		From			URL이동				권한
	 	----------------------------------------------------------------------------------------------------------------------------------------------------------
	 	g000		리스트		GET		/board/{boardName}/list				cri				/				board/list
	 	g001		내용		GET		/board/content						cri				list			board/content
	 	g002		내용2		GET		/board/{boardName}/content/{bno}	boardName, bno	list			board/content
	 	g003		글쓰기		GET		/board/register						b_name			list,content	board/writeForm		isAuthenticated()
	 	g004		수정하기	GET		/board/update						cri				content			board/modifyForm	isAuthenticated()
	 	g005		첨부조회	GET		/board/getAttachList				b_name, bno		content			
	 					
	 	p000		글쓰기		POST	/board/register						boardVO												principal.username == #boardVO.id
	 	p001		수정하기	POST	/board/update						boardVO			modifyForm							principal.username == #boardVO.id
	 	p002		삭제하기	POST	/board/delete						boardVO			content								principal.username == #boardVO.id
	 	p003		댓글수정폼	POST	/board/reply						cri,rno...		content								
	 	p004		댓글수정처리POST	/board/replyPro						cri,rno...		content								
	 */
	//============================================================================================================================================================
	
	
	
	
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
		
		//if( (cri.getPageNum()*cri.getAmount()) > total ) {throw new Exception();}
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		//게시판스타일boardStyle
		model.addAttribute("boardStyle", boardStyle(boardName));
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
		model.addAttribute("boardStyle", boardStyle(cri.getB_name()));
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
		
		Criteria cri = new Criteria();
		cri.setBno(Long.parseLong(bno)); //bno삽입
		cri.setB_name(boardName);//게시판명 삽입
		cri.setB_name2(makeKorean(cri.getB_name())); //한글 게시판명 생성
		
		int total = service.getTotal(cri); // 전체 글 갯수
		int rank = service.getRank(cri); //이 글이 몇번째 글인지 
		
		cri.setPageNum( (int) Math.floor( (total-rank+cri.getAmount()) /(cri.getAmount()*1.0) ) ); //total과 rank를 기반으로 pageNum 계산
		
		cri.setLimitNum( (cri.getPageNum()-1)*cri.getAmount() ); //limitNum 생성
		
		model.addAttribute("cri",cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("board", service.content(cri));
		
		model.addAttribute("boardStyle", boardStyle(cri.getB_name()));
		
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
	// g004
	// 기능		:	수정폼 보여주기
	// 메서드	:	GET
	// URI		:	/board/update
	//=========================================================================================
	@GetMapping("/update")
	@PreAuthorize("isAuthenticated()")
	public String modifyForm(Model model, @ModelAttribute("cri") Criteria cri) throws Exception{
		
		// sqlinjection 대응
		if(isSqlInjection(cri.getB_name())) {throw new Exception();}
		cri.setB_name2(makeKorean(cri.getB_name())); // 한글 게시판명 생성
		
		model.addAttribute("board", service.content(cri));
		
		return "board/modifyForm";
	}
	//=========================================================================================	
	
	
	
	//=========================================================================================
	// g005
	// 기능		:	첨부파일 조회
	// 메서드	:	GET
	// URI		:	/board/getAttachList
	//=========================================================================================
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(String b_name, Long bno) throws Exception{
		
		//log.info("getAttachList : " + b_name + " // " + bno);
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		return new ResponseEntity<>(service.getAttachList(bno, b_name), HttpStatus.OK);
	}
	//=========================================================================================	
	
	
	
	
	//=========================================================================================
	// p000
	// 기능		:	글쓰기 처리
	// 메서드	:	POST
	// URI		:	/board/register
	//=========================================================================================
	@PostMapping("/register")
	@PreAuthorize("principal.username == #boardVO.id")
	public String writePro(BoardVO boardVO) throws Exception{
		
		//log.info("//////////////////test : " + boardVO.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(boardVO.getB_name())) {throw new Exception();}
		
		
//		log.info("====================================================");
//		log.info("register : " + boardVO);
//		log.info("====================================================");
//		
//		if(boardVO.getAttachList() != null) {
//			boardVO.getAttachList().forEach(attach -> log.info(attach));
//		}
//		/board/{boardName}/content/{bno}	
//		log.info("====================================================");
		
		//log.info("notice_flag : " + boardVO.getNotice_flag());
		
		long result = service.register(boardVO);
		
		return "redirect:/board/"+boardVO.getB_name()+"/content/" + result;
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// p001
	// 기능		:	수정하기 처리
	// 메서드	:	POST
	// URI		:	/board/update
	//=========================================================================================
	@PostMapping("/update")
	@PreAuthorize("principal.username == #boardVO.id")
	public String modifyPro(BoardVO boardVO) throws Exception{
		
		//log.info("//////////////////test : " + boardVO.toString());
		//log.info("//////////////////test1 : " + boardVO.toString());
		
		
		
		// sqlinjection 대응
		if(isSqlInjection(boardVO.getB_name())) {throw new Exception();}
		
		service.modify(boardVO);
		
		return "redirect:/board/"+boardVO.getB_name()+"/content/"+boardVO.getBno();
	}
	//=========================================================================================	
	
	
	
	
	//=========================================================================================
	// p002
	// 기능		:	삭제처리
	// 메서드	:	POST
	// URI		: 	/board/delete
	//=========================================================================================
	@PostMapping("/delete")
	@PreAuthorize("principal.username == #boardVO.id")
	public String deletePro(BoardVO boardVO) throws Exception{
		
		//log.info("//////////////////test1 : " + boardVO.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(boardVO.getB_name())) {throw new Exception();}
		
		
		List<BoardAttachVO> attachList = service.getAttachList(boardVO.getBno(), boardVO.getB_name());
		
		if(service.remove(boardVO)) {
			//파일삭제
			deleteFiles(attachList);
		}
		return "redirect:/board/"+boardVO.getB_name()+"/list";
	}
	//=========================================================================================	
	
	
	
	//=========================================================================================
	// p003
	// 기능		:	댓글 수정 폼 보여주기
	// 메서드	:	POST
	// URI		: 	/board/reply
	//=========================================================================================
	@PostMapping("/reply")
	@PreAuthorize("principal.username == #id")
	public String replyModifyForm(
			Model model
			, @ModelAttribute("cri") Criteria cri
			,@RequestParam("rno") String rno
			,@RequestParam("replyPage") String replyPage
			,@RequestParam("reply") String reply
			,@RequestParam("id") String id
			) throws Exception{
		
		if(isSqlInjection(cri.getB_name())) {throw new Exception();}
		cri.setB_name2(makeKorean(cri.getB_name())); // 한글 게시판명 생성
		//[-- 수정된 댓글 --]&#013;&#010; 삭제
		if(reply.substring(0,26).equals("[-- 수정된 댓글 --]&#013;&#010;")) {
			reply = reply.substring(26);
		}
		model.addAttribute("rno", rno);
		model.addAttribute("reply", reply);
		model.addAttribute("replyPage", replyPage);
		
		//log.info("////////////////////////////////////////////////////test1 : "+cri.toString());
		//log.info("////////////////////////////////////////////////////test2 : "+rno);
		//log.info("////////////////////////////////////////////////////test3 : "+reply);
		//log.info("////////////////////////////////////////////////////test3 : "+replyPage);
		
		return "board/replyModifyForm";
	}
	//=========================================================================================
	
	
	
	//=========================================================================================
	// p004
	// 기능		:	댓글 수정처리
	// 메서드	:	POST
	// URI		: 	/board/replyPro
	//=========================================================================================
	@PostMapping("/replyPro")
	@PreAuthorize("principal.username == #id")
	public String replyPro(
			Model model
			, @ModelAttribute("cri") Criteria cri
			,@RequestParam("rno") String rno
			,@RequestParam("replyPage") String replyPage
			,@RequestParam("reply") String reply
			,@RequestParam("id") String id
			,RedirectAttributes rttr
			) throws Exception{
		
		//log.info("////////////////////////////////////////////////////test1 : "+cri.toString());
		//log.info("////////////////////////////////////////////////////test2 : "+rno);
		//log.info("////////////////////////////////////////////////////test3 : "+reply);
		//log.info("////////////////////////////////////////////////////test3 : "+replyPage);
		
		// sqlinjection 대응
		if(isSqlInjection(cri.getB_name())) {throw new Exception();}
		cri.setB_name2(makeKorean(cri.getB_name())); // 한글 게시판명 생성
		
		ReplyVO vo = new ReplyVO();
		
		vo.setRno(Long.parseLong(rno));
		vo.setB_name(cri.getB_name());
		vo.setReply(reply);
		replyService.modify(vo);
		
		//수정한 댓글로 자동 스크롤링 하도록
		rttr.addFlashAttribute("replyUpdateFlag", 1);
		rttr.addFlashAttribute("replyUpdate_rno", rno);
		rttr.addFlashAttribute("replyUpdate_page", replyPage);
		return "redirect:/board/"+cri.getB_name()+"/content/"+cri.getBno();
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
			case "free": return "자유";
			case "analysis": return "정보·분석";
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
			case "free": return false;
			case "analysis": return false;
			default : return true;
		}
		
	}//b_name2
	//=========================================================================================
	
	
	
	//=========================================================================================
	// 메서드3
	// 게시판 스타일 지정 
	// 0: 조회수, 1:좋아요
	//=========================================================================================
	private int boardStyle(String b_name) {
		
		switch(b_name) {
		case "analysis": return 1;
		case "free": return 1;
		default : return 0;
		}
		
	}//b_name2
	//=========================================================================================
	
	
	
	//=========================================================================================
	// 메서드4
	// 파일삭제 메서드
	//=========================================================================================
	private void deleteFiles(List<BoardAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("/home/upload/"+attach.getUploadPath()+"/" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("/home/upload/"+attach.getUploadPath()+"/s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	//=========================================================================================
	
}//class
