package com.musicpan.controller;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.musicpan.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//=========================================================================================
// REST 컨트롤러
//=========================================================================================
@RequestMapping("/member") 
@RestController
@Log4j
@AllArgsConstructor
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	//=========================================================================================
	// 기능 : 아이디 중복확인
	// 리턴 : "true" 중복된 아이디 || "false" 사용가능한 아이디
	// 메서드 : POST
	// URI : member/checkId/{id}
	//=========================================================================================
	@PostMapping(value = "/checkId/{id}", 
			produces = "text/plain; charset=UTF-8")
	public String checkId(@PathVariable("id") String id) {

		//log.info("MemberController checkId: " + id);
		
		return service.member_validation(id)==true ?
				"true" : "false";

	}
	//=========================================================================================
	
	
	
	//=========================================================================================
	// 기능 : 닉네임 중복확인
	// 리턴 : "true" 중복된 닉네임 || "false" 사용가능한 닉네임
	// 메서드 : POST
	// URI : member/checkName/{id}
	//=========================================================================================
	@PostMapping(value = "/checkName/{name}", 
			produces = "text/plain; charset=UTF-8")
	public String checkName(@PathVariable("name") String name) {
		
		//log.info("MemberController checkName: " + name);
		
		return service.member_Name_validation(name)==true ?
				"true" : "false";
		
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// 기능 : 비밀번호 변경
	// 리턴 : "true" 중복된 이메일 || "false" 사용가능한 이메일
	// 메서드 : POST
	// URI : member/changePassword
	//=========================================================================================
	@PreAuthorize("principal.username == #m_id")
	@PostMapping(value = "/changePassword", 
			produces = "text/plain; charset=UTF-8")
	public String changePassword(
			@RequestParam String m_id
			,@RequestParam String newPwd
			,@RequestParam String recentPwd
	) {
		
		//log.info("MemberController changePassword: " + m_id + " // " + newPwd  + " // " + recentPwd);
		
		return service.checkPassword(m_id, recentPwd, newPwd)+"";
		
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// 기능 : 이메일 중복확인
	// 리턴 : "true" 중복된 이메일 || "false" 사용가능한 이메일
	// 메서드 : POST
	// URI : member/checkEmail
	//=========================================================================================
	@PostMapping(value = "/checkEmail", 
			produces = "text/plain; charset=UTF-8")
	public String checkEmail(@RequestParam String email) {
		
		//log.info("MemberController checkEmail: " + email);
		
		return service.member_Email_validation(email)==true ?
				"true" : "false";
		
	}
	//=========================================================================================
	
	
	//=========================================================================================
	// 기능 : 이메일 인증키 보내기
	// 리턴 : "true" 성공 || "false" 실패
	// 메서드 : POST
	// URI : member/checkEmailKey
	//=========================================================================================
	@PostMapping(value = "/checkEmailKey", 
			produces = "text/plain; charset=UTF-8")
	public String checkEmailKey(@RequestParam String email) {
		
		return service.createEmailKey(email)?"true":"false";
	}
	//=========================================================================================
	
	
	
	
	//=========================================================================================
	// 기능 : 이메일 인증키 확인
	// 리턴 : "true" 성공 || "false" 실패
	// 메서드 : POST
	// URI : member/authEmailKey
	//=========================================================================================
	@PostMapping(value = "/authEmailKey", 
			produces = "text/plain; charset=UTF-8")
	public String authEmailKey(@RequestParam String email, @RequestParam String authEmailKey) {
		
		return service.authEmailKey(email, authEmailKey)?"true":"false";
	}
	//=========================================================================================
	
	
	
	
}//class
