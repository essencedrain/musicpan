package com.musicpan.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.musicpan.domain.LikeVO;
import com.musicpan.service.LikeService;

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

@RequestMapping("/like/")
@RestController
@Log4j
@AllArgsConstructor
public class LikeController {

	
	private LikeService service;
	
	//====================================================================================================
	// 000	좋아요등록	POST	/like/insert
	//====================================================================================================
	@PreAuthorize("principal.username == #vo.id")
	@PostMapping(value = "/insert"
			,consumes = "application/json"
			,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE}
			)
	public ResponseEntity<Map<String, Integer>> create(@RequestBody LikeVO vo) throws Exception{
		
		//log.info("like 들어옴 : " + vo.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(vo.getB_name())) {throw new Exception();}
		
		
		Map<String, Integer> result = service.insertLike(vo);
		
		return result.get("status") == 1
				? new ResponseEntity<>(result,HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	//====================================================================================================
	// 001	좋아요체크	POST	/like/check
	//====================================================================================================
	@PreAuthorize("principal.username == #vo.id")
	@PostMapping(value = "/check"
				,consumes = "application/json"
				,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE}
			)
	public ResponseEntity<Map<String, Integer>> checkDuplication(@RequestBody LikeVO vo) throws Exception{
		
		//log.info("check 들어옴 : " + vo.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(vo.getB_name())) {throw new Exception();}
		
		
		Map<String, Integer> result = service.checkDuplication(vo);
		
		return result != null
				? new ResponseEntity<>(result,HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	//====================================================================================================
	// 002	좋아요삭제	POST	/like/delete
	//====================================================================================================
	@PreAuthorize("principal.username == #vo.id")
	@PostMapping(value = "/delete"
				,consumes = "application/json"
				,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE}
			)
	public ResponseEntity<Map<String, Integer>> deleteLike(@RequestBody LikeVO vo) throws Exception{
		
		//log.info("delete 들어옴 : " + vo.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(vo.getB_name())) {throw new Exception();}
		
		
		Map<String, Integer> result = service.deleteLike(vo);
		
		return result.get("status") == 1
				? new ResponseEntity<>(result,HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//====================================================================================================
	
	
	
	//====================================================================================================
	// 004	좋아요읽기	POST	/like/read/:b_name/:bno/:id
	//====================================================================================================
	@GetMapping(value = "/read/{b_name}/{bno}/{id}"
				,produces = {
						MediaType.APPLICATION_XML_VALUE
						,MediaType.APPLICATION_JSON_UTF8_VALUE
				}
			)
	public ResponseEntity<Map<String, Integer>> readLike(
							@PathVariable("b_name") String b_name
							, @PathVariable("bno") Long bno
							, @PathVariable("id") String id
							) throws Exception{
		
		//log.info("check 들어옴 : " + vo.toString());
		
		// sqlinjection 대응
		if(isSqlInjection(b_name)) {throw new Exception();}
		
		LikeVO vo = new LikeVO();
		vo.setB_name(b_name);
		vo.setBno(bno);
		vo.setId(id);
		Map<String, Integer> result = service.readLike(vo);
		
		return result != null
				? new ResponseEntity<>(result,HttpStatus.OK)
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
			default : return true;
		}
		
	}//b_name2
	//=========================================================================================
}//class
