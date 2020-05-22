package com.musicpan.service;

import org.springframework.stereotype.Service;

import com.musicpan.domain.MemberVO;
import com.musicpan.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	private MemberMapper mapper;
	

	@Override
	public boolean member_validation(String id) {
		log.info("MemberServiceImpl 아이디 확인 : " + id);
		
		return mapper.read(id)==null ?
				false : true;
	}

	
}//class
