package com.musicpan.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import com.musicpan.domain.MemberVO;

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


