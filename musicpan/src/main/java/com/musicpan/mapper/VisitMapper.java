package com.musicpan.mapper;

import com.musicpan.domain.VisitVO;

public interface VisitMapper {

	public int insert(VisitVO vo);
	public int countAll();
	public int countToday(String todate);
}//interface
