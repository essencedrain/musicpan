package com.musicpan.mapper;

import com.musicpan.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String id);
	public int insert(MemberVO vo);
	public int insert_auth1(String id);
	public int checkId(String id);
	public int checkName(String name);
	public int checkEmail(String email);
}
