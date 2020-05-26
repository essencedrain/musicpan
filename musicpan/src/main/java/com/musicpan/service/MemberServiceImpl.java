package com.musicpan.service;

import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Override
	public boolean member_validation(String id) {
		
		return mapper.checkId(id)==1 ?
				true : false;
	}
	
	
	@Transactional
	@Override
	public boolean register(MemberVO vo) {
				
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
		
		if(today - vo.getCreatedate().getTime() > 18000) {
			return false;
		}
		
		if(authEmailKey.equals(vo.getAuthemailkey())) {
			return true;
		}else {
			return false;
		}
		
		
	}//authEmailKey
	
	
	
	
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
}//class
