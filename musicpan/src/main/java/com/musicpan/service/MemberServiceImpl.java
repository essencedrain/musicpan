package com.musicpan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.controller.CommonController;
import com.musicpan.domain.MemberVO;
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
	
	
	@Transactional
	@Override
	public boolean register(MemberVO vo) {
				
		try {
			//가입처리
			mapper.insert(vo);
			
			//권한부여
	    	//일반계정
			try {
				if(vo.getGrade()==0) {
		    		mapper.insert_auth1(vo.getId());
		    	}
			} catch (Exception e) {
				return false;
			}
	    	
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	
}//class
