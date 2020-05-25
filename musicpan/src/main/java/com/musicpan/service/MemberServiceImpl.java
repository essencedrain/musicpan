package com.musicpan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		return mapper.checkId(id)==1 ?
				true : false;
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


	@Override
	public boolean member_Name_validation(String name) {
		return mapper.checkName(name)==1 ?
				true : false;
	}


	@Override
	public boolean member_Email_validation(String email) {
		return mapper.checkEmail(email)==1 ?
				true : false;
	}

	
}//class
