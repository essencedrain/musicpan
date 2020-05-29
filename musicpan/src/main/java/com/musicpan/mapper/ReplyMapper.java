package com.musicpan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	public int updateRef(ReplyVO vo);
	
	public int insertRe(ReplyVO vo);
	public int getMaxStep(ReplyVO vo);
	
	public ReplyVO read(@Param("rno") Long rno, @Param("b_name") String b_name);
	
	public int delete(@Param("rno") Long rno, @Param("b_name") String b_name);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	public int deleteFlag(@Param("rno") Long rno, @Param("b_name") String b_name);
	
}//class
