package com.musicpan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList(@Param("b_name") String b_name);
	
}
