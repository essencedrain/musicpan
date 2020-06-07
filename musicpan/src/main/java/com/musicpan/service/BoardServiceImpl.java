package com.musicpan.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.BoardAttachVO;
import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;
import com.musicpan.mapper.BoardAttachMapper;
import com.musicpan.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;
	

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		List<BoardVO> notice = mapper.getListNotice(cri);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		List<BoardVO> resultList = new ArrayList<>();
		
		resultList.addAll(notice);
		resultList.addAll(list);
		
		for(BoardVO temp : resultList) {
			temp.setModiDate( convertDate(temp) );
		}
		
		
		return resultList;
	}


	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	
	@Override
	public BoardVO content(Criteria cri) {
		mapper.increaseHit(cri);
		BoardVO vo = mapper.read(cri); 
		return vo;
	}
	
	@Transactional
	@Override
	public long register(BoardVO board) {
		
		if(board.getNotice_flag()==0) {
			mapper.insert(board);
		}else{
			mapper.insertNotice(board);
		}
		
		
		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return board.getBno();
		}//if
		
		board.getAttachList().forEach(attach -> {
			attach.setBno(board.getBno());
			attach.setB_name(board.getB_name());
			attachMapper.insert(attach);
		});
		
		return board.getBno();
	}


	@Override
	public int getRank(Criteria cri) {
		return mapper.getRank(cri);
	}

	@Transactional
	@Override
	public boolean modify(BoardVO board) {
		
		attachMapper.deleteAll(board);
		
		boolean modifyResult = mapper.update(board) == 1;
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attach.setB_name(board.getB_name());
				attachMapper.insert(attach);
			});
		}//if
		
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(BoardVO board) {
		
		boolean deleteResult = mapper.updateFlag(board) == 1;
		
		attachMapper.deleteAll(board);
		
		return deleteResult;
	}

	
	
	
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


	@Override
	public List<BoardAttachVO> getAttachList(Long bno, String b_name) {
		
		return attachMapper.findByBno(bno, b_name);
	}


	@Override
	public void removeAttach(Long bno, String b_name) {
		// TODO Auto-generated method stub
		
	}
	//===============================================================
}//class
