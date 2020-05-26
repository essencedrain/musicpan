package com.musicpan.mapper;


import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.musicpan.domain.EmailAuthVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

//@RunWith(SpringRunner.class)
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberMapperTests {

  @Setter(onMethod_ = @Autowired)
  private MemberMapper mapper;
  
  @Setter(onMethod_ = @Autowired)
  private PasswordEncoder pwencoder;
  
  
  @Test
  public void testEmailKey() {
    
    //int insertCount1 = mapper.insertEmailKey("adsf", "asdf");
    //int insertCount2 = mapper.checkEmailKey("gth@kakao.com");
    //int insertCount2 = mapper.deleteEmailKey("gth@kakao.com");
    EmailAuthVO vo = mapper.getEmailKey("gth@kakao.com");
    
    Date today = new Date();
    
    //log.info(insertCount1);
    log.info(vo.toString());
    log.info("///////////////////////////////////test" + vo.getCreatedate().getTime() + " / " + today.getTime()+" /// " + (today.getTime()-vo.getCreatedate().getTime()));
    
  }
  /*
  @Test
  public void testRead() {
    
    MemberVO vo = mapper.read("admin90");
    
    log.info(vo);
    
    vo.getAuthList().forEach(authVO -> log.info(authVO));
    
  }
   */
  
  /*
	  @Test
	  public void insertTest() {
	    
		MemberVO vo = new MemberVO();
	    
		vo.setId("moonkero");
		vo.setPwd("test");
		vo.setName("test");
		vo.setEmail("estest");
		
		log.info("///////////////////pwd : " + vo.getPwd());
		vo.setPwd( pwencoder.encode(vo.getPwd()) );
		log.info("///////////////////enc_pwd : " + vo.getPwd());
		log.info("///////////////////enc_pwd : " + pwencoder.matches("test",vo.getPwd()));
		
		try {
			mapper.insert(vo);
			log.info("///////////////////insertTest : true");
		} catch (Exception e) {
			log.info("///////////////////insertTest : false");
		}
		
	    
	  }
   */
  
  /*
  @Test
  public void insertAuthTest() {
	  String id = "TEST";
	  try {
			mapper.insert_auth1(id);
			log.info("///////////////////insertTest : true");
		} catch (Exception e) {
			log.info("///////////////////insertTest : false");
		}
	  
  }
  */
  
}//class


