package com.musicpan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.BoardAttachVO;
import com.musicpan.domain.BoardVO;

public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);

	public void delete(String uuid);

	public List<BoardAttachVO> findByBno(@Param("bno") Long bno, @Param("b_name") String b_name);

	public void deleteAll(BoardVO board);

	public List<BoardAttachVO> getOldFiles(@Param("b_name") String b_name);

}