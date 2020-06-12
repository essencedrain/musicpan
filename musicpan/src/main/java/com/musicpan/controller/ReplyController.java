package com.musicpan.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyPageDTO;
import com.musicpan.domain.ReplyVO;
import com.musicpan.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



//=========================================================================================
//REST 컨트롤러
//=========================================================================================

//============================================================================================================================================================
/*
 	NO			Task		Method	URL									Parameter		From			URL이동				권한
 	----------------------------------------------------------------------------------------------------------------------------------------------------------
 	000			등록		POST	/replies/:b_name/new
 	001			조회		GET		/replies/:b_name/:rno
 	002			삭제		DELETE	/replies/:b_name/:rno/:id
 	003			수정		PUT		/replies/:b_name/:rno
 	004			페이지		GET		/replies/pages/:b_name/:bno/:page
 	005			대댓글등록	POST	/replies/:b_name/re
 */
//============================================================================================================================================================

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {

	
	private ReplyService service;
	
	//====================================================================================================
	// 000	등록	POST	/replies/:b_name/new
	//====================================================================================================
	@PreAuthorize("principal.username == #vo.id")
	@PostMapping(value = "/{b_name}/new"
			,consumes = "application/json"
			,produces = { MediaType.TEXT_PLAIN_VALUE }
			)
	public ResponseEntity<String> create(@PathVariable("b_name") String b_name, @RequestBody ReplyVO vo) throws Exception{
		
		//log.info("들어옴 : " + b_name  + " // " + vo.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		vo.setB_name(b_name);
		
		int insertCount = service.register(vo);
		
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	
	//====================================================================================================
	// 005	대댓글등록	POST	/replies/:b_name/re
	//====================================================================================================
	@PreAuthorize("principal.username == #vo.id")
	@PostMapping(value = "/{b_name}/re"
			,consumes = "application/json"
			,produces = { MediaType.TEXT_PLAIN_VALUE }
			)
	public ResponseEntity<String> create2(@PathVariable("b_name") String b_name, @RequestBody ReplyVO vo) throws Exception{
		
		//log.info("들어옴 : " + b_name  + " // " + vo.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		vo.setB_name(b_name);
		
		int insertCount = service.registerRe(vo);
		
		return insertCount == 1
				? new ResponseEntity<>("success",HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	//====================================================================================================
	// 004	페이지	GET	/replies/pages/:b_name/:bno/:page
	//====================================================================================================
	@GetMapping(value = "/pages/{b_name}/{bno}/{page}"
				,produces = {
						MediaType.APPLICATION_XML_VALUE
						,MediaType.APPLICATION_JSON_UTF8_VALUE
				}
			)
	public ResponseEntity<ReplyPageDTO> getList(
				@PathVariable("b_name") String b_name
				,@PathVariable("page") int page
				,@PathVariable("bno") Long bno				
	) throws Exception{
		
		Criteria cri = new Criteria(page<0?1:page,50);
		cri.setB_name(b_name);
		
		// sqlinjection 대응
		if(isSqlInjection(cri.getB_name())) {throw new Exception();}
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	//====================================================================================================
	
	
	
	
	//====================================================================================================
	// 001	조회	GET	/replies/:b_name/:rno
	//====================================================================================================
	@GetMapping(value = "/{b_name}/{rno}"
				,produces = {
						MediaType.APPLICATION_XML_VALUE
						,MediaType.APPLICATION_JSON_UTF8_VALUE
				}
			)
	public ResponseEntity<ReplyVO> get(@PathVariable("b_name") String b_name, @PathVariable("rno") Long rno) throws Exception{
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		return new ResponseEntity<>(service.get(rno, b_name), HttpStatus.OK);
	}
	//====================================================================================================
	
	
	
	
	//====================================================================================================
	// 002	삭제	DELETE	/replies/:b_name/:rno/:id
	//====================================================================================================
	@PreAuthorize("principal.username == #id")
	@DeleteMapping(value = "/{b_name}/{rno}/{id}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("b_name") String b_name, @PathVariable("rno") Long rno, @PathVariable("id") String id) throws Exception{
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		return service.remove(rno, b_name) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	//====================================================================================================
	// 003	수정	PUT	/replies/:b_name/:rno
	//====================================================================================================
	@PreAuthorize("principal.username == #vo.id")
	@RequestMapping(value = "/{b_name}/{rno}"
				,method = { RequestMethod.PUT, RequestMethod.PATCH }
				,consumes = "application/json"
				,produces = {MediaType.TEXT_PLAIN_VALUE}
			)
	public ResponseEntity<String> modify(
				@PathVariable("b_name") String b_name
				,@PathVariable("rno") Long rno
				,@RequestBody ReplyVO vo
	) throws Exception{
		vo.setB_name(b_name);
		vo.setRno(rno);
		
		// sqlinjection 대응
		if(isSqlInjection(vo.getB_name())) {throw new Exception();}
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	
	
	//====================================================================================================
	// 003	수정	PUT	/replies/:b_name/:rno
	//====================================================================================================
	//====================================================================================================
	
	
	
	//=========================================================================================
	// 메서드1
	// SqlInjection 대응 함수
	// 정해진 값만 들어와짐
	//=========================================================================================
	private boolean isSqlInjection(String b_name) {
		
		switch(b_name) {
			case "sample": return false;
			case "free": return false;
			default : return true;
		}
		
	}//b_name2
	//=========================================================================================
}//class
