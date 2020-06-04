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
	
	public int insert(BoardVO board);
	
	public int getRank(Criteria cri);
	
	public int update(BoardVO board);
	
	public int updateFlag(BoardVO board);
	
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount, @Param("b_name") String b_name);
	
	public void updateLike(@Param("bno") Long bno, @Param("b_name") String b_name, @Param("amount") int amount);
	public void updatedisLike(@Param("bno") Long bno, @Param("b_name") String b_name, @Param("amount") int amount);
}
