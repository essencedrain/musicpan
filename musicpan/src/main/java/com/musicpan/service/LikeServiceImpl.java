package com.musicpan.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.LikeVO;
import com.musicpan.mapper.BoardMapper;
import com.musicpan.mapper.LikeMapper;
import com.musicpan.mapper.MemberMapper;
import com.musicpan.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LikeServiceImpl implements LikeService {
	
	
	@Setter(onMethod_ = @Autowired)
	private LikeMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Transactional
	@Override
	public Map<String, Integer> insertLike(LikeVO vo) {
		
		Map<String, Integer> result = new HashMap<String,Integer>();   
		
		result.put("status", mapper.insert(vo));
		result.put("like", mapper.readLike(vo));
		result.put("dislike", mapper.readDislike(vo));
		
		String id = boardMapper.getId(vo.getBno(), vo.getB_name());
		
		if(vo.getFlag() == 1) {
			memberMapper.addGradePoint(id, 3);//글작성자 점수추가
			boardMapper.updateLike(vo.getBno(), vo.getB_name(), 1);
		}else {
			memberMapper.addGradePoint(id, -2);//글작성자 점수깎기
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
		
		String id = boardMapper.getId(vo.getBno(), vo.getB_name());
		
		if(vo.getFlag() == 1) {
			memberMapper.addGradePoint(id, -3);//글작성자 점수제거
			boardMapper.updateLike(vo.getBno(), vo.getB_name(), -1);
		}else {
			memberMapper.addGradePoint(id, 2);//글작성자 점수복구
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

	@Transactional
	@Override
	public Map<String, Integer> insertLike_reply(LikeVO vo) {
		
		Map<String, Integer> result = new HashMap<String,Integer>();   
		
		result.put("status", mapper.insert_reply(vo));
		result.put("like", mapper.readLike_reply(vo));
		result.put("dislike", mapper.readDislike_reply(vo));
		
		String id = replyMapper.getId(vo.getRno(), vo.getB_name());
		
		if(vo.getFlag() == 1) {
			memberMapper.addGradePoint(id, 2);//댓글작성자 점수추가
			replyMapper.updateLike(vo.getRno(), vo.getB_name(), 1);
		}else {
			memberMapper.addGradePoint(id, -1);//댓글작성자 점수깎기
			replyMapper.updatedisLike(vo.getRno(), vo.getB_name(), 1);
		}
		
		return result;
	}

	@Override
	public Map<String, Integer> checkDuplication_reply(LikeVO vo) {
		Map<String, Integer> result = new HashMap<String,Integer>(); 
		
		result.put("check", mapper.checkDuplication_reply(vo));
		
		if(result.get("check")!=0) {
			result.put("value", mapper.checkDuplicationValue_reply(vo));
		}else {
			result.put("value", 0);
		}
		return result;
	}
	
	@Transactional
	@Override
	public Map<String, Integer> deleteLike_reply(LikeVO vo) {
		
		Map<String, Integer> result = new HashMap<String,Integer>(); 
		
		result.put("status",mapper.delete_reply(vo));
		result.put("like", mapper.readLike_reply(vo));
		result.put("dislike", mapper.readDislike_reply(vo));
		
		String id = replyMapper.getId(vo.getRno(), vo.getB_name());
		
		if(vo.getFlag() == 1) {
			memberMapper.addGradePoint(id, -2);//댓글작성자 점수삭제
			replyMapper.updateLike(vo.getRno(), vo.getB_name(), -1);
		}else {
			memberMapper.addGradePoint(id, 1);//댓글작성자 점수복구
			replyMapper.updatedisLike(vo.getRno(), vo.getB_name(), -1);
		}
		return result;
	}

	@Override
	public Map<String, Integer> readLike_reply(LikeVO vo) {
		Map<String, Integer> result = new HashMap<String,Integer>();
		
		if(vo.getId().length() > 0) {
			result.put("check", mapper.checkDuplication_reply(vo));
			if(result.get("check")!=0) {
				result.put("value", mapper.checkDuplicationValue_reply(vo));
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
