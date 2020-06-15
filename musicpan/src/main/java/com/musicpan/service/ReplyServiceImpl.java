package com.musicpan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyPageDTO;
import com.musicpan.domain.ReplyVO;
import com.musicpan.mapper.BoardMapper;
import com.musicpan.mapper.MemberMapper;
import com.musicpan.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		
		mapper.insert(vo);
		
		if(!vo.getId().equals(boardMapper.getId(vo.getBno(), vo.getB_name()))) {
			memberMapper.addGradePoint(vo.getId(), 2);
		}
		
		boardMapper.updateReplyCnt(vo.getBno(), 1, vo.getB_name());
		return mapper.updateRef(vo);
	}

	
	
	@Override
	public ReplyVO get(Long rno, String b_name) {
		
		ReplyVO result = mapper.read(rno, b_name);
		
		result.setGrade( convertGrade(result) );
		
		return result;
	}

	
	
	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	
	@Transactional
	@Override
	public int remove(Long rno, String b_name) {
		
		ReplyVO vo = mapper.read(rno, b_name);
		vo.setB_name(b_name);
		
		
		if(!vo.getId().equals(boardMapper.getId(vo.getBno(), vo.getB_name()))) {
			memberMapper.addGradePoint(vo.getId(), -2);
		}
		
		
		int ref = mapper.getRef(vo);
		vo.setRef(ref);
		if(rno==ref) {
			if(mapper.getMaxStep(vo) > 0) {
				//-1로 수정 자식딸린 댓글
				boardMapper.updateReplyCnt(vo.getBno(), -1, vo.getB_name());
				return mapper.deleteFlag2(rno, b_name);
			}	
		}
		
		//1로 수정, 그냥 댓글 삭제
		boardMapper.updateReplyCnt(vo.getBno(), -1, vo.getB_name());
		return mapper.deleteFlag(rno, b_name);
	}

	
	
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		
		List<ReplyVO> result = mapper.getListWithPaging(cri, bno);
		
		for(ReplyVO temp : result) {
			temp.setGrade( convertGrade(temp) );
		}//for
		
		return result;
	}


	@Transactional
	@Override
	public int registerRe(ReplyVO vo) {
		
		int ref = mapper.getRef(vo);
		vo.setRef(ref);
		
		int maxStep = mapper.getMaxStep(vo);
		
		vo.setReply_step(maxStep+1);
		memberMapper.addGradePoint(vo.getId(), 2);
		boardMapper.updateReplyCnt(vo.getBno(), 1, vo.getB_name());
		return mapper.insertRe(vo);
	}



	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		List<ReplyVO> result = mapper.getListWithPaging(cri, bno);
		
		for(ReplyVO temp : result) {
			temp.setGrade( convertGrade(temp) );
		}//for
		
		
		return new ReplyPageDTO(
				mapper.getCountByBno(bno, cri.getB_name())
				,result
				);
	}

	
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
	private long convertGrade(ReplyVO temp) {
		
		long grade = temp.getGrade();
		
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
