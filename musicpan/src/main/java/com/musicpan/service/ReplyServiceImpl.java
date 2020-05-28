package com.musicpan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyVO;
import com.musicpan.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	
	
	@Override
	public ReplyVO get(Long rno, String b_name) {
		return mapper.read(rno, b_name);
	}

	
	
	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	
	
	@Override
	public int remove(Long rno, String b_name) {
		return mapper.delete(rno, b_name);
	}

	
	
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

}//class
