package com.musicpan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.musicpan.domain.MemberVO;
import com.musicpan.security.domain.CustomUser;
import com.musicpan.service.BoardService;
import com.musicpan.service.CommonService;
import com.musicpan.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private BoardService boardService;
	
	
	//=================================================================================================
	/*
	 	NO			Task		Method	URL						Parameter		From		URL이동
	 	-----------------------------------------------------------------------------------------------
	 	g000		메인화면	GET		/	
	 	g001		접근에러	GET		/accessError
	 	g002		로그인		GET		/customLogin
	 	g003		회원가입	GET		/register
	 	g004		회원축하	GET		/registerSuccess
	 	g005		마이페이지	GET		/mypage
	 	
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
	public String home(Model model) {
		
		model.addAttribute("txVol24", commonService.getTxVol24());
		model.addAttribute("txVolWeek", commonService.getTxVolWeek());
		model.addAttribute("boardFree", boardService.getListForHomeFree());
		model.addAttribute("boardAnalysis", boardService.getListForHomeAnalysis());
		return "home";
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// g000
	// 기능		:	홈화면
	// 메서드	:	GET 
	// URI		:	/chart
	//=========================================================================================
	@GetMapping("/chart")
	public String chart() {
		
		return "dchart/chartTest";
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
	public String loginInput(HttpServletRequest request, HttpServletResponse response, Authentication authentication) {
		
		//로그인 시 접근 불가
		if(authentication != null) {
			CustomUser user = (CustomUser) authentication.getPrincipal();
			if(user.getUsername().length()>0) {return "redirect:/";}
		}
		
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response); 

		try {
			//여러가지 이유로 이전페이지 정보가 없는 경우가 있음.
			//https://stackoverflow.com/questions/6880659/in-what-cases-will-http-referer-be-empty
			request.getSession().setAttribute("prevPage", savedRequest.getRedirectUrl());
		} catch(NullPointerException e) {
			try {
				String referrer = request.getHeader("Referer");
				request.getSession().setAttribute("prevPage", referrer);
			} catch (Exception e2) {
				request.getSession().setAttribute("prevPage", "/");
			}
		}
		
		//log.info("//////////////////test1 : " + request.getSession().getAttribute("prevPage"));
		
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
	public String register(Authentication authentication) {
		
		//로그인 시 접근 불가
		if(authentication != null) {
			CustomUser user = (CustomUser) authentication.getPrincipal();
			if(user.getUsername().length()>0) {return "redirect:/";}
		}
		
		
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
	public String registerSuccess(Authentication authentication) {
		
		//로그인 시 접근 불가
		if(authentication != null) {
			CustomUser user = (CustomUser) authentication.getPrincipal();
			if(user.getUsername().length()>0) {return "redirect:/";}
		}
		
		return "member/registerSuccess";
	}
	//=========================================================================================
		
		
	
	
	//=========================================================================================
	// g005
	// 기능		:	마이페이지 보여줌
	// 메서드	:	GET
	// URI		:	/mypage
	//=========================================================================================
	@GetMapping("/mypage")
	@PreAuthorize("isAuthenticated()")
	public String mypage(Authentication authentication, Model model) {
		
		CustomUser user = (CustomUser) authentication.getPrincipal();
		String id = user.getUsername();
		
		MemberVO vo = memberService.getMemberInfo(id);
		
		model.addAttribute("vo", vo);
		
		//log.info(vo);
		
		return "member/mypage";
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
