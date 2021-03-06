package com.musicpan.service;

import java.util.List;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyPageDTO;
import com.musicpan.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public int registerRe(ReplyVO vo);
	
	public ReplyVO get(Long rno, String b_name);
	
	public int modify(ReplyVO vo);
	
	public int remove(Long rno, String b_name);
	
	public List<ReplyVO> getList(Criteria cri, Long bno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long bno);
	
}//interface
