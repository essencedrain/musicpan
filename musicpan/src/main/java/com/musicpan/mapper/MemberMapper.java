package com.musicpan.mapper;

import org.apache.ibatis.annotations.Param;

import com.musicpan.domain.EmailAuthVO;
import com.musicpan.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String id);
	public int insert(MemberVO vo);
	public int insert_auth1(String id);
	public int checkId(String id);
	public int checkName(String name);
	public int checkEmail(String email);
	
	public int insertEmailKey(@Param("authEmailKey") String authEmailKey, @Param("email") String email);
	public EmailAuthVO getEmailKey(String email);
	public int checkEmailFromKey(String email);
	public int deleteEmailKey(String email);
	
	public int addGradePoint(@Param("id") String id, @Param("point") int point);
	public int isUpdated(@Param("id") String id);
}
