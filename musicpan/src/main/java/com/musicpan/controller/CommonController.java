package com.musicpan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.musicpan.domain.MemberVO;
import com.musicpan.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private MemberService memberService;
	
	
	
	//=================================================================================================
	/*
	 	NO			Task		Method	URL						Parameter		From		URL이동
	 	-----------------------------------------------------------------------------------------------
	 	g000		메인화면	GET		/	
	 	g001		접근에러	GET		/accessError
	 	g002		로그인		GET		/customLogin
	 	g003		회원가입	GET		/register
	 	g004		회원축하	GET		/registerSuccess
	 	
	 	
	 	
	 	p000		로그아웃	POST	/customLogout
	 	p001		회원가입	POST	/register
	 	
	 */
	//=================================================================================================
	
	
	//=========================================================================================
	// g000
	// 기능		:	홈화면
	// 메서드	:	GET 
	// URI		:	/
	//=========================================================================================
	@GetMapping("/")
	public String home() {
		return "home";
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// g001
	// 기능		:	접근에러
	// 메서드	:	GET
	// URI		:	/accessError
	//=========================================================================================
	@GetMapping("/accessError")
	public String accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
		
		return "error/accessError";
	}
	//=========================================================================================
	
	
	
	
	
	//=========================================================================================
	// g002
	// 기능		:	로그인 페이지 이동
	// 메서드	:	GET
	// URI		:	/customLogin
	//=========================================================================================
	@GetMapping("/customLogin")
	public String loginInput(HttpServletRequest request, HttpServletResponse response) {
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response); 
		
		try {
			//여러가지 이유로 이전페이지 정보가 없는 경우가 있음.
			//https://stackoverflow.com/questions/6880659/in-what-cases-will-http-referer-be-empty
			request.getSession().setAttribute("prevPage", savedRequest.getRedirectUrl());
		} catch(NullPointerException e) {
			request.getSession().setAttribute("prevPage", "/");
		}
		
		return "member/customLogin";
	}
	//=========================================================================================
	
	
	
	
	
	//=========================================================================================
	// p000
	// 기능		:	로그아웃 처리
	// 메서드	:	POST
	// URI		:	/customLogout
	//=========================================================================================
	@PostMapping("/customLogout")
	public String logoutPost() {
		return "member/customLogout";
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// g003
	// 기능		:	회원가입 폼 보여줌
	// 메서드	:	GET
	// URI		:	/register
	//=========================================================================================
	@GetMapping("/register")
	public String register() {
		return "member/register";
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// g004
	// 기능		:	회원가입 축하 폼 보여줌
	// 메서드	:	GET
	// URI		:	/registerSuccess
	//=========================================================================================
	@GetMapping("/registerSuccess")
	public String registerSuccess() {
		return "member/registerSuccess";
	}
	//=========================================================================================
		
		
	
	
	//=========================================================================================
	// p001
	// 기능		:	회원가입 처리
	// 메서드	:	POST
	// URI		:	/register
	//=========================================================================================
    @PostMapping("/register")
    public String memberInsert(MemberVO memberVO) throws Exception{
         
        //비밀번호 암호화
        memberVO.setPwd(pwencoder.encode(memberVO.getPwd()));
        
        log.info("register post : " + memberVO.toString());
        
        //가입처리
        if(memberService.register(memberVO)) {
        	return "redirect:/registerSuccess";
        }else {
        	throw new Exception(); 
        }//if
    }
	//=========================================================================================
	
	
	
    
    //=========================================================================================
  	// g000
  	// 기능		:
  	// 메서드	:  
  	// URI		: 
  	//=========================================================================================
  	
  	//=========================================================================================	
}//class
