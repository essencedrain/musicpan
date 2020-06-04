package com.musicpan.service;

import java.util.List;

import com.musicpan.domain.BoardAttachVO;
import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;

public interface BoardService {
	
	public void register(BoardVO board);

	public List<BoardVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
	public BoardVO content(Criteria cri);
	
	public int getRank(Criteria cri);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(BoardVO board);
	
	public List<BoardAttachVO> getAttachList(Long bno, String b_name);
	
	public void removeAttach(Long bno, String b_name);
	
}//interface
