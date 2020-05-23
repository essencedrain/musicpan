package com.musicpan.service;

import java.util.List;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;

public interface BoardService {
	
	//public void register(BoardVO board);

	//public BoardVO get(Long bno);

	//public boolean modify(BoardVO board);

	//public boolean remove(Long bno);

	public List<BoardVO> getList(Criteria cri);
	public int getTotal(Criteria cri);
	public BoardVO content(Criteria cri);
	/*
	public List<BoardVO> getList(String b_name);
	

	//추가
	
	public List<BoardAttachVO> getAttachList(Long bno);
	
	public void removeAttach(Long bno);
	*/
}
