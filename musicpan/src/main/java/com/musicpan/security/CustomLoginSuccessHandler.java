package com.musicpan.security;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.musicpan.mapper.MemberMapper;
import com.musicpan.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {
    	
    	ObjectMapper mapper = new ObjectMapper();	//JSON 변경용
    	
    	ResponseDataDTO responseDataDTO = new ResponseDataDTO();
    	responseDataDTO.setCode(ResponseDataCode.SUCCESS);
    	responseDataDTO.setStatus(ResponseDataStatus.SUCCESS);
    	
    	String prevPage = null;
    	if(request.getSession().getAttribute("prevPage")!=null) {
    		prevPage = request.getSession().getAttribute("prevPage").toString();	//이전 페이지 가져오기    		
    	}else {
    		prevPage = "/";
    	}
    	
    	//인증된 사용자의 정보를 추출
    	CustomUser user = (CustomUser) authentication.getPrincipal();
    	
    	//오늘 활동이 있는지 확인
    	boolean isUpdated = memberMapper.isUpdated(user.getUsername())==1?true:false;
    	
    	//없으면 로그인점수 10점 추가
    	if(!isUpdated) {
    		memberMapper.addGradePoint(user.getUsername(), 10);
    	}//if
    	
    	
    	Map<String, String> items = new HashMap<String,String>();	
    	items.put("url", prevPage);	// 이전 페이지 저장
    	responseDataDTO.setItem(items);
    	
    	response.setCharacterEncoding("UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);
        response.getWriter().print(mapper.writeValueAsString(responseDataDTO));
        response.getWriter().flush();
    }
}


