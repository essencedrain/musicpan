package com.musicpan.mapper;


import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.musicpan.domain.EmailAuthVO;
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
  
  
  
  @Test
  public void testExp() {
	  
	  MemberVO vo = mapper.readInfo("test");
		
		//경험치->레벨환산
		vo.setLevel( convertGrade(vo.getGrade()) );
		
		log.info("/////////////////////////// 1 : " + vo.getLevel());
		
		//지금레벨 시작경험치
		long start = getExp(vo.getLevel());
		log.info("/////////////////////////// 2 : "+start);
		//현재경험치 = grade
		log.info("/////////////////////////// 3 : "+vo.getGrade());
		//다음레벨 경험치
		vo.setNextExp( getExp( vo.getLevel()+1 ) );
		log.info("/////////////////////////// 4 : "+vo.getNextExp());
		
		//경험치percent
		log.info("/////////////////////////// 5 : "+ Math.round( ( (float)(vo.getNextExp()-vo.getGrade()) / (float)(vo.getNextExp()-start) *100) )  );
	  
  }
  
  
  /*
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
  */
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
  
  
//===============================================================
	// 구간 경험치 획득
	/*
	 	1~10	:	100level
	 	11~50	:	200level-1000
	 	51~100	:	800level-31000
	 	101~150	:	3000level-251000
	 	151~180	:	30000level-4301000
	 	181~199	:	300000level-52901000
	 */
	//===============================================================
	
	private long getExp(long level) {
		
		if(level>=0 && level<11) {
			return 100*level;
		}else if(level>=11 && level<51){
			return 200*level-1000;
		}else if(level>=51 && level<101){
			return 800*level-31000;
		}else if(level>=101 && level<151){
			return 3000*level-251000;
		}else if(level>=151 && level<181){
			return 30000*level-4301000;
		}else {
			return 300000*level-52901000;
		}
		
	}
	//===============================================================
	
	
	
	
	
	//===============================================================
	// db유저 경험치 -> 등급변환
	/*
	 	0~9 	: 레벨업경험치 100		//	0~999
	 	10~49	: 레벨업경험치 200		//	1,000~8,999	
	 	50~99	: 레벨업경험치 800		//	9,000~48,999
	 	100~149	: 레벨업경험치 3,000	//	49,000~198,999
	 	150~179	: 레벨업경험치 30,000	//	199,000~1,098,999
	 	180~199	: 레벨업경험치 300,000	//	1,099,000~7,098,999
	 	
	 	경험치
	 		로그인		:	10
	 		글쓰기		:	20
	 		댓글쓰기	:	2
	 		글추/비추	:	3/-2
	 		댓글추/비추	:	2/-1
	 		
	 */
	//===============================================================
	private long convertGrade(long grade) {
		
		if(grade>=0 && grade<1000) {
			return (long)Math.floor(grade/100);
			
		}else if(grade>=1000 && grade<9000){
			
			return (long)Math.floor( ((grade-1000)/200)+10 );
			
		}else if(grade>=9000 && grade<49000){
			
			return (long)Math.floor( ((grade-9000)/800)+50 );
			
		}else if(grade>=49000 && grade<199000){
			
			return (long)Math.floor( ((grade-49000)/3000)+100 );
			
		}else if(grade>=199000 && grade<1099000){
			
			return (long)Math.floor( ((grade-199000)/30000)+150 );
			
		}else {
			return (long)Math.floor( ((grade-1099000)/300000)+180 );
		}
	}
	//===============================================================
  
}//class


