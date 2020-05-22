package com.musicpan.service;

import com.musicpan.domain.MemberVO;

public interface MemberService {

	public boolean member_validation(String id);
	public boolean register(MemberVO vo);
	
}//class
