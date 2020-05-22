package com.musicpan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicpan.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	

	@Override
	public boolean member_validation(String id) {
		log.info("MemberServiceImpl 아이디 확인 : " + id);
		
		return mapper.read(id)==null ?
				false : true;
	}

	
}//class
