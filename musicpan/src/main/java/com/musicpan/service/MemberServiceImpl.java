package com.musicpan.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.EmailAuthVO;
import com.musicpan.domain.MemberVO;
import com.musicpan.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {
	
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private JavaMailSender mailSender;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	
	
	
	@Override
	public boolean member_validation(String id) {
		
		return mapper.checkId(id)==1 ?
				true : false;
	}
	
	
	
	
	@Transactional
	@Override
	public boolean register(MemberVO vo) {
		
		//비밀번호 암호화
		vo.setPwd(pwencoder.encode(vo.getPwd()));
		
		try {
			//가입처리
			mapper.insert(vo);
			
			//권한부여
	    	//일반계정
			try {
				if(vo.getGrade()==0) {
		    		mapper.insert_auth1(vo.getId());
		    	}
			} catch (Exception e) {
				return false;
			}
			
			try {
				mapper.deleteEmailKey(vo.getEmail());
			} catch (Exception e) {
				return false;
			}
	    	
			return true;
		} catch (Exception e) {
			return false;
		}
		
	}

	
	
	

	@Override
	public boolean member_Name_validation(String name) {
		return mapper.checkName(name)==1 ?
				true : false;
	}

	
	
	

	@Override
	public boolean member_Email_validation(String email) {
		return mapper.checkEmail(email)==1 ?
				true : false;
	}
	
	
	
	
	
	@Transactional
	@Override
	public boolean createEmailKey(String email) {
		
		boolean checkValid = false;
		
		if(mapper.checkEmailFromKey(email)==0) {
			checkValid = true;
		}else {
			if(mapper.deleteEmailKey(email)==1) {
				checkValid = true;
			}else {
				return false;
			}
		}
		
		if(checkValid) {
			
			String authEmailKey = getTempKey(8, false);
			
			if(mapper.insertEmailKey(authEmailKey, email)==1) {
			
				try {
					MimeMessage msg = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(msg, true, "UTF-8");
					
					messageHelper.setSubject("[뮤직판]회원가입 이메일 인증키입니다.");
					messageHelper.setText("인증번호는 "+authEmailKey+" 입니다.");
					messageHelper.setTo(email);
					msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email));
					mailSender.send(msg);
					return true;
				}catch(MessagingException e) {
					log.info("MessagingException : " + e);
					return false;
				}//try
			}else {
				return false;
			}
			
			
		}else {
			return false;
		}
		
	}//createEmailKey(String email)

	
	
	
	
	
	@Override
	public boolean authEmailKey(String email, String authEmailKey) {
		
		EmailAuthVO vo = mapper.getEmailKey(email);
		
		long today = new Date().getTime();
		
		if((today - vo.getCreatedate().getTime()) > 180000) {
			return false;
		}
		
		if(authEmailKey.equals(vo.getAuthemailkey())) {
			return true;
		}else {
			return false;
		}
		
		
	}//authEmailKey
	
	
	
	
	
	
	
	@Override
	public MemberVO getMemberInfo(String id) {
		
		MemberVO vo = mapper.readInfo(id);
		
		//경험치->레벨환산
		vo.setLevel( convertGrade(vo.getGrade()) );
		
		//지금레벨 시작경험치
		long start = getExp(vo.getLevel());
		//현재경험치 = grade
		//다음레벨 경험치
		vo.setNextExp( getExp( vo.getLevel()+1 ) );
		
		//경험치percent
		long percent = Math.round( ( (float)(vo.getGrade()-start) / (float)(vo.getNextExp()-start) *100) );
		vo.setExpPercent(percent);
		
		//날짜변환
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		vo.setRegDateString( transFormat.format( vo.getRegDate() ) );
		vo.setUpdatedateString( transFormat.format( vo.getUpdatedate() ) );
		
		//콤마찍기
		DecimalFormat df = new DecimalFormat("#,###");
		vo.setNextExpString( df.format( vo.getNextExp() ) );
		vo.setGradeString( df.format( vo.getGrade() ) );
		
		
		return vo;
	}//readMemberInfo
	
	
	
	
	
	
	@Override
	public int checkPassword(String id, String recentPwd, String newPwd) {
		
		//db 비밀번호
		String originPwd = mapper.checkPwd(id);
		
		//입력한 비밀번호 validation
		if(!pwencoder.matches(recentPwd, originPwd)) {
			return -1;
		}
		
		//새 비번 암호화
		String newPwdEnc = pwencoder.encode(newPwd);
		
		return mapper.updatePwd(id, newPwdEnc);
	}
	
	
	
	
	
	//=========================================================================================
	// getTempkey() 키생성
	//=========================================================================================
	private String getTempKey(int size, boolean lowerCheck) {
		Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        
        int num = 0;
        
        do {
            num = ran.nextInt(75) + 48;
            
            if((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                sb.append((char)num);
            }else {
                continue;
            }
        } while (sb.length() < size);
        
        if(lowerCheck) {
            return sb.toString().toLowerCase();
        }
        
        return sb.toString();
	}
	//=========================================================================================
	
	
	//===============================================================
	// 구간 경험치 획득
	/*
	 	(구)
	 	1~10	:	100level
	 	11~50	:	200level-1000
	 	51~100	:	800level-31000
	 	101~150	:	3000level-251000
	 	151~180	:	30000level-4301000
	 	181~199	:	300000level-52901000
	 	
	 	(신)
	 	1~10	:	30level
	 	11~100	:	50level-200
	 	101~150	:	100level-5200
	 	151~180	:	1000level-140200
	 	181~199	:	10000level-1760200
	 */
	//===============================================================
	
	private long getExp(long level) {
		
		if(level>=0 && level<11) {
			return 30*level;
		}else if(level>=11 && level<101){
			return 50*level-200;
		}else if(level>=101 && level<151){
			return 100*level-5200;
		}else if(level>=151 && level<181){
			return 1000*level-140200;
		}else if(level>=181 && level<200){
			return 10000*level-1760200;
		}else {
			return 9999900;
		}
		
		/*
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
		*/
		
	}
	//===============================================================
	
	
	
	
	
	//===============================================================
		// db유저 경험치 -> 등급변환
		/*
		    (구)
		 	0~9 	: 레벨업경험치 100		//	0~999
		 	10~49	: 레벨업경험치 200		//	1,000~8,999	
		 	50~99	: 레벨업경험치 800		//	9,000~48,999
		 	100~149	: 레벨업경험치 3,000	//	49,000~198,999
		 	150~179	: 레벨업경험치 30,000	//	199,000~1,098,999
		 	180~199	: 레벨업경험치 300,000	//	1,099,000~7,098,999
		 	
		 	(신)
		 	0~9 	: 레벨업경험치 30		//	0~299
		 	10~99	: 레벨업경험치 50		//	300~4,799	
		 	100~149	: 레벨업경험치 100		//	4,800~9,799
		 	150~179	: 레벨업경험치 1,000	//	9,800~39,799
		 	180~199	: 레벨업경험치 10,000	//	39,800~239,799
		 	
		 	경험치
		 		로그인		:	30
		 		글쓰기		:	20
		 		댓글쓰기	:	2
		 		글추/비추	:	3/-2
		 		댓글추/비추	:	2/-1
		 		
		 */
		//===============================================================
		private long convertGrade(long grade) {
			
			if(grade>=0 && grade<300) {
				return (long)Math.floor(grade/30);
				
			}else if(grade>=300 && grade<4800){
				
				return (long)Math.floor( ((grade-300)/50)+10 );
				
			}else if(grade>=4800 && grade<9800){
				
				return (long)Math.floor( ((grade-4800)/100)+100 );
				
			}else if(grade>=9800 && grade<39800){
				
				return (long)Math.floor( ((grade-9800)/1000)+150 );
				
			}else if(grade>=39800 && grade<239800){
				
				return (long)Math.floor( ((grade-39800)/10000)+180 );
				
			}else {
				return 200;
			}
			/*
			(구)
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
			*/
		}
		//===============================================================
		
}//class
