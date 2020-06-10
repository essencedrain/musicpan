package com.musicpan.mapper;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	@Test
	public void testSearch() {
		log.info(mapper.getId(8227L, "sample"));
	}
	
	
	/*
	@Test
	public void testSearch() {

	    Criteria cri = new Criteria();
	    cri.setKeyword("일반사용자0");
	    cri.setType("TCW");
	    cri.setB_name("sample");
	    
	    log.info("//////////////"+cri.getTypeArr());
	    
	    List<BoardVO> list = mapper.getListWithPaging(cri);

	    list.forEach(board -> log.info(board));
	  }
	*/
	/*
	@Test
	public void testGetList() {
		
		Criteria cri = new Criteria();
		cri.setB_name("sample");
		
		List<BoardVO> resultList = mapper.getListWithPaging(cri);
		for(BoardVO temp : resultList) {
			temp.setModiDate( convertDate(temp) );
			log.info("//////////////"+temp.getModiDate());
		}
	}
	*/
	
	/*
	@Test
	public void testGetList() {

		mapper.getList("sample").forEach(board -> log.info(board));
		
	}
	@Test
	public void testGetList() {
		Criteria cri = new Criteria();
		cri.setB_name("sample");
		mapper.getListWithPaging(cri).forEach(board -> log.info(board));
		
	}
	 */
	/*
	@Test
	public void testInsert() {

		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작성하는 내용");
		board.setId("newbie");

		mapper.insert(board);

		log.info(board);
	}

	@Test
	public void testInsertSelectKey() {

		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글 select key");
		board.setContent("새로 작성하는 내용 select key");
		board.setWriter("newbie");

		mapper.insertSelectKey(board);

		log.info(board);
	}

	@Test
	public void testRead() {

		// 존재하는 게시물 번호로 테스트
		BoardVO board = mapper.read(5L);

		log.info(board);

	}

	@Test
	public void testDelete() {

		log.info("DELETE COUNT: " + mapper.delete(3L));
	}

	@Test
	public void testUpdate() {

		BoardVO board = new BoardVO();
		// 실행전 존재하는 번호인지 확인할 것
		board.setBno(5L);
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		board.setWriter("user00");

		int count = mapper.update(board);
		log.info("UPDATE COUNT: " + count);

	}

	@Test
	public void testPaging() {

		Criteria cri = new Criteria();
		
	    //10개씩 3페이지 
	    cri.setPageNum(3);
	    cri.setAmount(10);


		List<BoardVO> list = mapper.getListWithPaging(cri);

		list.forEach(board -> log.info(board));

	}
	
	  
		*/
	
	
	//===============================================================
	// 시간 변환 
	//===============================================================
	private String convertDate(BoardVO temp) {
		
		long mTime = temp.getRegdate().getTime();
		Date today = new Date();
		
		long gap = today.getTime() - mTime;
		Date dateObj = new Date(mTime);
		
		
		Calendar cal = Calendar.getInstance();
	    cal.setTime(dateObj);
		
	    long monLong = 1000L*60L*60L*24L*30L;
		long dayLong = 1000L*60L*60L*24L;
		long hourLong = 1000L*60L*60L;
		long minuteLong = 1000L*60L;
	    
		
		if(gap < dayLong){

            if(gap < (minuteLong)){
                return (int) Math.floor(gap/1000L) +" 초 전";
            }else if(gap < (hourLong)){
                return (int) Math.floor(gap/60000L) +" 분 전";
            }else{
                return (int) Math.floor(gap/3600000L) +" 시간 전";
            }
            
        }else{
            int yy = cal.get(Calendar.YEAR);
            int mm = cal.get(Calendar.MONTH)+1;
            int dd = cal.get(Calendar.DATE);

            if(gap < monLong){
                return (int) Math.floor(gap/86400000L) + " 일 전";
            }else {
            	return yy+"."+ ((mm > 9 ? "" : "0") + mm) + "."+ ((dd > 9 ? "":"0") + dd);
            }
        }
	}
	//===============================================================
}
