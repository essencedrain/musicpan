package com.musicpan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;

public interface BoardMapper {

	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public BoardVO read(Criteria cri);
	
	public int increaseHit(Criteria cri);
	
	public void insert(BoardVO board);
	
	public int getRank(Criteria cri);
}
