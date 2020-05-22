package com.musicpan.mapper;

import com.musicpan.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String id);
	public int insert(MemberVO vo);
	public int insert_auth1(String id);
}
