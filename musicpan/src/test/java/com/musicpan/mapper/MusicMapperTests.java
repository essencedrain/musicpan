package com.musicpan.mapper;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.musicpan.domain.SongBasicVO;
import com.musicpan.music.MusicPro;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MusicMapperTests {

	
	@Setter(onMethod_ = @Autowired)
	private MusicMapper mapper;
	
	
	@Test
	public void test() {
	
		MusicPro test = new MusicPro();
		HashSet<String> list = test.getList();
		Map<String, String> result = new HashMap<>();  
		
		SongBasicVO vo = new SongBasicVO();
		
		//basicInfo test
		for(String temp : list) {
			result = test.getBasicInfo(temp);
			
			vo.setIdx(Integer.parseInt(temp));
			vo.setSong(result.get("song"));
			vo.setSinger(result.get("singer"));
			vo.setComposer(result.get("composer"));
			vo.setLyricist(result.get("lyricist"));
			
			if(result.get("arranger")!=null) {
				vo.setArranger(result.get("arranger"));
			}else {
				vo.setArranger("");
			}
			
			String dateTemp = result.get("releaseDate");
			Date to=null;
			try {
				to = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(dateTemp);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			vo.setReleaseDate(to);
			
			vo.setCopyRight(Integer.parseInt(result.get("copyRight")));
			vo.setSecRight(Integer.parseInt(result.get("secRight")));
			vo.setStockCnt(Integer.parseInt(result.get("stockCnt")));
			
			mapper.insert(vo);
			
			
		}//for
		
	}
	
}//class
