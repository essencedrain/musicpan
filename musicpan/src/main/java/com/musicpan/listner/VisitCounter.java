package com.musicpan.listner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.musicpan.domain.VisitVO;
import com.musicpan.service.VisitServiceImpl;

public class VisitCounter implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		HttpSession session = se.getSession();
		
		//등록되어있는 빈을 사용할수 있도록 설정해준다
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());
        VisitServiceImpl service = (VisitServiceImpl)wac.getBean("visitServiceImpl");
        

        //request를 파라미터에 넣지 않고도 사용할수 있도록 설정
        ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
        HttpServletRequest req = attr.getRequest();
        
        
        VisitVO vo = new VisitVO();
        vo.setVisit_ip(req.getRemoteAddr());
        vo.setVisit_agent(req.getHeader("User-Agent")==null?"none":req.getHeader("User-Agent"));//브라우저 정보
        vo.setVisit_refer(req.getHeader("referer")==null?"none":req.getHeader("referer"));//접속 전 사이트 정보
        
        int[] countArray = service.insertVisitor(vo);
        
        session.setAttribute("countAll", countArray[0]+"");
        session.setAttribute("countToday", countArray[1]+"");
        session.setAttribute("countAllDistinct", countArray[2]+"");
        session.setAttribute("countTodayDistinct", countArray[3]+"");
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
