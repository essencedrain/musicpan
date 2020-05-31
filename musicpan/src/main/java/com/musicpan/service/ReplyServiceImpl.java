package com.musicpan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicpan.domain.Criteria;
import com.musicpan.domain.ReplyPageDTO;
import com.musicpan.domain.ReplyVO;
import com.musicpan.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		
		mapper.insert(vo);
		return mapper.updateRef(vo);
	}

	
	
	@Override
	public ReplyVO get(Long rno, String b_name) {
		return mapper.read(rno, b_name);
	}

	
	
	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	
	
	@Override
	public int remove(Long rno, String b_name) {
		
		ReplyVO vo = new ReplyVO();
		vo.setRno(rno);
		vo.setB_name(b_name);
		
		int ref = mapper.getRef(vo);
		vo.setRef(ref);
		if(rno==ref) {
			if(mapper.getMaxStep(vo) > 0) {
				//-1로 수정
				return mapper.deleteFlag2(rno, b_name);
			}	
		}
		
		//1로 수정
		return mapper.deleteFlag(rno, b_name);
	}

	
	
	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		return mapper.getListWithPaging(cri, bno);
	}



	@Override
	public int registerRe(ReplyVO vo) {
		
		int ref = mapper.getRef(vo);
		vo.setRef(ref);
		
		int maxStep = mapper.getMaxStep(vo);
		
		vo.setReply_step(maxStep+1);
		
		return mapper.insertRe(vo);
	}



	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		return new ReplyPageDTO(
				mapper.getCountByBno(bno, cri.getB_name())
				,mapper.getListWithPaging(cri, bno)
				);
	}

}//class
