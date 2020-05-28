package com.musicpan.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.musicpan.domain.BoardVO;
import com.musicpan.domain.Criteria;
import com.musicpan.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	

	@Override
	public List<BoardVO> getList(Criteria cri) {
		
		List<BoardVO> resultList = mapper.getListWithPaging(cri);
		
		for(BoardVO temp : resultList) {
			temp.setModiDate( convertDate(temp) );
		}
		
		
		return resultList;
	}


	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Transactional
	@Override
	public BoardVO content(Criteria cri) {
		mapper.increaseHit(cri);
		BoardVO vo = mapper.read(cri); 
		return vo;
	}

	@Override
	public void register(BoardVO board) {
		mapper.insert(board);
	}


	@Override
	public int getRank(Criteria cri) {
		return mapper.getRank(cri);
	}


	@Override
	public boolean modify(BoardVO board) {
		
		boolean modifyResult = mapper.update(board) == 1;
		
		return modifyResult;
	}


	@Override
	public boolean remove(BoardVO board) {
		boolean deleteResult = mapper.updateFlag(board) == 1;
		
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
		
		if(gap < (1000*60*60*24)){

            if(gap < (1000*60)){
                return Math.floor(gap/1000) +" 초 전";
            }else if(gap < (1000*60*60)){
                return Math.floor(gap/60000) +" 분 전";
            }else{
                return Math.floor(gap/3600000) +" 시간 전";
            }
            
        }else{
            int yy = dateObj.getYear();
            int mm = dateObj.getMonth() + 1;
            int dd = dateObj.getDate();

            if(gap < (1000*60*60*24*30)){
                return Math.floor(gap/86400000) + " 일 전";
            }

            return yy+"."+ ((mm > 9 ? "" : "0") + mm) + "."+ ((dd > 9 ? "":"0") + dd);
        }
	}
	//===============================================================
}//class
