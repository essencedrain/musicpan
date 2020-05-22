package com.musicpan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.SecurityContextRepository;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	//=========================================================================================
	// 기능 : 접근에러
	// 메서드 : GET
	// URI : /accessError
	//=========================================================================================
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied : " + auth);

		model.addAttribute("msg", "Access Denied");
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// 기능 : 
	// 메서드 : 
	// URI : 
	//=========================================================================================
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// 기능 : 
	// 메서드 : 
	// URI : 
	//=========================================================================================
	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// 기능 : 
	// 메서드 : 
	// URI : 
	//=========================================================================================
	@PostMapping("/customLogout")
	public void logoutPost() {

		log.info("post custom logout");
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// 기능 : 
	// 메서드 : 
	// URI : 
	//=========================================================================================
	@GetMapping("/login")
	public String Login(HttpServletRequest request, HttpServletResponse response) {
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response); 
		
		try {
			//여러가지 이유로 이전페이지 정보가 없는 경우가 있음.
			//https://stackoverflow.com/questions/6880659/in-what-cases-will-http-referer-be-empty
			request.getSession().setAttribute("prevPage", savedRequest.getRedirectUrl());
		} catch(NullPointerException e) {
			request.getSession().setAttribute("prevPage", "/");
		}
		return "customLogin";
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// 기능 : 
	// 메서드 : 
	// URI : 
	//=========================================================================================
	@GetMapping("/register")
	public String register() {
		log.info("register");
		return "member/register";
	}
	//=========================================================================================
	
	
	
	
}
