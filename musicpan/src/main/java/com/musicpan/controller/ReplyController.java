package com.musicpan.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.musicpan.domain.Criteria;
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
 	002			삭제		DELETE	/replies/:b_name/:rno
 	003			수정		PUT		/replies/:b_name/:rno
 	004			페이지		GET		/replies/pages/:b_name/:bno/:page
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
	@PostMapping(value = "/{b_name}/new"
			,consumes = "application/json"
			,produces = { MediaType.TEXT_PLAIN_VALUE }
			)
	public ResponseEntity<String> create(@PathVariable("b_name") String b_name, @RequestBody ReplyVO vo){
		
		//log.info("들어옴 : " + b_name  + " // " + vo.toString());
		
		vo.setB_name(b_name);
		
		int insertCount = service.register(vo);
		
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
	public ResponseEntity<List<ReplyVO>> getList(
				@PathVariable("b_name") String b_name
				,@PathVariable("page") int page
				,@PathVariable("bno") Long bno				
	){
		Criteria cri = new Criteria(page,20);
		
		cri.setB_name(b_name);
		
		//log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
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
	public ResponseEntity<ReplyVO> get(@PathVariable("b_name") String b_name, @PathVariable("rno") Long rno){
		
		return new ResponseEntity<>(service.get(rno, b_name), HttpStatus.OK);
	}
	//====================================================================================================
	
	
	
	
	//====================================================================================================
	// 002	삭제	DELETE	/replies/:b_name/:rno
	//====================================================================================================
	@DeleteMapping(value = "/{b_name}/{rno}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("b_name") String b_name, @PathVariable("rno") Long rno){
		
		return service.remove(rno, b_name) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	//====================================================================================================
	// 003	수정	PUT	/replies/:b_name/:rno
	//====================================================================================================
	@RequestMapping(value = "/{b_name}/{rno}"
				,method = { RequestMethod.PUT, RequestMethod.PATCH }
				,consumes = "application/json"
				,produces = {MediaType.TEXT_PLAIN_VALUE}
			)
	public ResponseEntity<String> modify(
				@PathVariable("b_name") String b_name
				,@PathVariable("rno") Long rno
				,@RequestBody ReplyVO vo
	){
		vo.setB_name(b_name);
		vo.setRno(rno);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	
	
	//====================================================================================================
	// 003	수정	PUT	/replies/:b_name/:rno
	//====================================================================================================
	//====================================================================================================
}//class
