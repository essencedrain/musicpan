package com.musicpan.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	private long[] bnoArr = {8180L,8179L,8178L,8176L,8175L};
	
	/*
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i ->{
			ReplyVO vo = new ReplyVO();
			
			vo.setReply("댓글 달기 매퍼 테스트 " + i);
			vo.setB_name("sample");
			vo.setReply_step(0);
			vo.setBno(bnoArr[i%5]);
			vo.setId("user"+i);
			
			mapper.insert(vo);
		});
		
	}
	*/
	
	@Test
	public void testRead() {
		
		Long targetRno = 4197L;
		
		ReplyVO vo = mapper.read(targetRno, "sample");
		
		log.info(vo);
	}
	/*
	@Test
	public void testDelete() {
		
		Long targetRno = 14L;
		
		mapper.delete(targetRno, "sample");
		
	}
	 */
	
	/*
	@Test
	public void testUpdate() {
		Long targetRno = 13L;
		ReplyVO vo = mapper.read(targetRno, "sample");
		vo.setReply("수정한 댓글2");
		vo.setB_name("sample");
		int count = mapper.update(vo);
		log.info("update count : " + count);
	}
	*/
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		cri.setB_name("sample");
		
		//8180L
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bnoArr[0]);
		
		replies.forEach(reply -> log.info(reply));
		
	}
}//class
