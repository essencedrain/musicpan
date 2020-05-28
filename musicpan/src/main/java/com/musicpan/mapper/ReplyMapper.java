package com.musicpan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(@Param("rno") Long rno, @Param("b_name") String b_name);
	
	public int delete(@Param("rno") Long rno, @Param("b_name") String b_name);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
}//class
