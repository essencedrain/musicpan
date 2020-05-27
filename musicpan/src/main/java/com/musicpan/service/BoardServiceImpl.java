package com.musicpan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;
import com.musicpan.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}


	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Transactional
	@Override
	public BoardVO content(Criteria cri) {
		mapper.increaseHit(cri);
		BoardVO vo = mapper.read(cri); 
		return vo;
	}

	@Override
	public void register(BoardVO board) {
		mapper.insert(board);
	}


	@Override
	public int getRank(Criteria cri) {
		return mapper.getRank(cri);
	}


	@Override
	public boolean modify(BoardVO board) {
		
		boolean modifyResult = mapper.update(board) == 1;
		
		return modifyResult;
	}

}//class
