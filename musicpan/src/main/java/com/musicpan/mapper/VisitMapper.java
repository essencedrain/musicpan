package com.musicpan.mapper;

import com.musicpan.domain.VisitVO;

public interface VisitMapper {

	public int insert(VisitVO vo);
	public int countAll();
	public int countToday(String todate);
	public int countAllDistinct();
	public int countTodayDistinct(String todate);
}//interface
