package com.musicpan.service;

import com.musicpan.domain.MemberVO;

public interface MemberService {

	public boolean member_validation(String id);
	public boolean member_Name_validation(String name);
	public boolean member_Email_validation(String email);
	public boolean register(MemberVO vo);
	
	public boolean createEmailKey(String email);
	public boolean authEmailKey(String email, String authEmailKey);
	
}//class
