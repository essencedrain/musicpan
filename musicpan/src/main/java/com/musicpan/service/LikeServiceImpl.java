package com.musicpan.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.LikeVO;
import com.musicpan.mapper.BoardMapper;
import com.musicpan.mapper.LikeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LikeServiceImpl implements LikeService {
	
	
	@Setter(onMethod_ = @Autowired)
	private LikeMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public Map<String, Integer> insertLike(LikeVO vo) {
		
		Map<String, Integer> result = new HashMap<String,Integer>();   
		
		result.put("status", mapper.insert(vo));
		result.put("like", mapper.readLike(vo));
		result.put("dislike", mapper.readDislike(vo));
		
		if(vo.getFlag() == 1) {
			boardMapper.updateLike(vo.getBno(), vo.getB_name(), 1);
		}else {
			boardMapper.updatedisLike(vo.getBno(), vo.getB_name(), 1);
		}
		return result;
	}

	@Override
	public Map<String, Integer> checkDuplication(LikeVO vo) {
		Map<String, Integer> result = new HashMap<String,Integer>(); 
		result.put("check", mapper.checkDuplication(vo));
		
		if(result.get("check")!=0) {
			result.put("value", mapper.checkDuplicationValue(vo));
		}else {
			result.put("value", 0);
		}
		return result;
	}
	
	@Transactional
	@Override
	public Map<String, Integer> deleteLike(LikeVO vo) {
		
		Map<String, Integer> result = new HashMap<String,Integer>(); 
		
		result.put("status",mapper.delete(vo));
		result.put("like", mapper.readLike(vo));
		result.put("dislike", mapper.readDislike(vo));
		
		if(vo.getFlag() == 1) {
			boardMapper.updateLike(vo.getBno(), vo.getB_name(), -1);
		}else {
			boardMapper.updatedisLike(vo.getBno(), vo.getB_name(), -1);
		}
		return result;
	}

	@Override
	public Map<String, Integer> readLike(LikeVO vo) {
		
		Map<String, Integer> result = new HashMap<String,Integer>();
		result.put("like", mapper.readLike(vo));
		result.put("dislike", mapper.readDislike(vo));
		
		if(vo.getId().length() > 0) {
			result.put("check", mapper.checkDuplication(vo));
			if(result.get("check")!=0) {
				result.put("value", mapper.checkDuplicationValue(vo));
			}else {
				result.put("value", 0);
			}
		}else {
			result.put("check", 0);
			result.put("value", 0);
		}
		return result;
	}
	
}//class
