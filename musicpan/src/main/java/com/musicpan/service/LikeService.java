package com.musicpan.service;

import java.util.List;
import java.util.Map;

import com.musicpan.domain.LikeVO;

public interface LikeService {

	public Map<String, Integer> insertLike(LikeVO vo);
	public Map<String, Integer> checkDuplication(LikeVO vo);
	public Map<String, Integer> deleteLike(LikeVO vo);
	public Map<String, Integer> readLike(LikeVO vo);
	
	public Map<String, Integer> insertLike_reply(LikeVO vo);
	public Map<String, Integer> checkDuplication_reply(LikeVO vo);
	public Map<String, Integer> deleteLike_reply(LikeVO vo);
	public Map<String, Integer> readLike_reply(LikeVO vo);
	
}//interface
