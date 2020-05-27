package com.musicpan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicpan.domain.VisitVO;
import com.musicpan.mapper.VisitMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class VisitServiceImpl implements VisitService{
	
	@Setter(onMethod_ = @Autowired)
	private VisitMapper mapper;
	
	@Override
	public int insertVisitor(VisitVO vo) {
		
		return mapper.insert(vo);
	}

	
	
}//class
