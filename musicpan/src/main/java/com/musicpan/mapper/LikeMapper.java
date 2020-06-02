package com.musicpan.mapper;

import com.musicpan.domain.LikeVO;

public interface LikeMapper {

	public int insert(LikeVO vo);
	public int checkDuplication(LikeVO vo);
	public int checkDuplicationValue(LikeVO vo);
	
	public int readLike(LikeVO vo);
	public int readDislike(LikeVO vo);
	
	public int delete(LikeVO vo);
	
}//class
