package com.musicpan.mapper;

import com.musicpan.domain.LikeVO;

public interface LikeMapper {

	public int insert(LikeVO vo);
	public int checkDuplication(LikeVO vo);
	public int checkDuplicationValue(LikeVO vo);
	
	public int readLike(LikeVO vo);
	public int readDislike(LikeVO vo);
	
	public int delete(LikeVO vo);
	
	public int insert_reply(LikeVO vo);
	public int checkDuplication_reply(LikeVO vo);
	public int checkDuplicationValue_reply(LikeVO vo);
	
	public int readLike_reply(LikeVO vo);
	public int readDislike_reply(LikeVO vo);
	
	public int delete_reply(LikeVO vo);
	
}//class
