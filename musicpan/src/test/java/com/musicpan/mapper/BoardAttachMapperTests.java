package com.musicpan.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.musicpan.domain.BoardAttachVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class BoardAttachMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper mapper;
	 
	@Test
	public void testSearch() {
		
		String[] boardArr = {"sample", "free", "analysis"};
		
		for(String temp : boardArr) {
			List<BoardAttachVO> result = mapper.getOldFiles(temp);
		
				for(BoardAttachVO temp2 : result) {
					log.info(temp2);
				}
		
		}
	}
	
}//class
