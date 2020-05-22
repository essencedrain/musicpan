package com.musicpan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.musicpan.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	
	//=========================================================================================
	/*
	 	g000	GET		/
		g001	GET		/accessError
	  	g002	GET		/customLogin
	  	g003	GET		/register
	  	
	  	p000	POST	/customLogout
	 */
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// g000
	// 기능 : 홈화면
	// 메서드 : GET 
	// URI : /
	//=========================================================================================
	@GetMapping("/")
	public String home() {
		return "home";
	}
	//=========================================================================================
	
	//=========================================================================================
	// g001
	// 기능 : 접근에러
	// 메서드 : GET
	// URI : /accessError
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
	// 기능 : 로그인 페이지 이동
	// 메서드 : GET
	// URI : /customLogin
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
	// 기능 : 로그아웃 처리
	// 메서드 : POST
	// URI : /customLogout
	//=========================================================================================
	@PostMapping("/customLogout")
	public String logoutPost() {
		return "member/customLogout";
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// g003
	// 기능 : 회원가입 폼 보여줌
	// 메서드 : GET
	// URI : /register
	//=========================================================================================
	@GetMapping("/register")
	public String register() {
		log.info("register");
		return "member/register";
	}
	//=========================================================================================
	
	//=========================================================================================
	// g003
	// 기능 : 회원가입 폼 보여줌
	// 메서드 : GET
	// URI : /register
	//=========================================================================================
	//bindResult 다음에 Model 이 와야 한다. 순서가 틀리면 에러가 발생한다.
    @PostMapping("/register")
    public String memberInsert(@ModelAttribute(name="usersVO") MemberVO memberVO, Model model ) throws Exception{
         
         
        //비밀번호 암오화 작업
        if(StringUtils.hasText(memberVO.getPwd())) {
            String bCryptString=bCryptPasswordEncoder.encode(memberVO.getPwd());
            memberVO.setPwd(bCryptString);
        }
         
        return "redirect:/";
    }
	//=========================================================================================
	
	
	
	
}
