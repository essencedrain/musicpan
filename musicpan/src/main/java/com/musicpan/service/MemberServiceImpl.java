package com.musicpan.service;

import org.springframework.stereotype.Service;

import com.musicpan.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	private MemberMapper mapper;
	
	//아이디, 비번 확인
	@Override
	public int auth(String id, String pwd) {
		
		return 0;
	}//auth()
	
	
}//class
