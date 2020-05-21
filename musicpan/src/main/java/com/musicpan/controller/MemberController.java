package com.musicpan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*") 
@Controller
public class MemberController {

	@GetMapping("/register")
	  public void register() {
	    log.info("register");
	  }
	
}//class
