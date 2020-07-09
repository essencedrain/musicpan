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
import com.musicpan.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService{

	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
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
			temp.setGrade( convertGrade(temp) );
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
		vo.setGrade( convertGrade(vo) );
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
		
		if(board.getB_name().equals("analysis")) {
			memberMapper.addGradePoint(board.getId(), 200);//정보 분석글 200점
		}else {
			memberMapper.addGradePoint(board.getId(), 20);
		}//글쓰기 점수
		
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
		
		if(board.getB_name().equals("analysis")) {
			memberMapper.addGradePoint(board.getId(), -200);//정보 분석글 200점
		}else {
			memberMapper.addGradePoint(board.getId(), -20);
		}//글쓰기 점수
		
		attachMapper.deleteAll(board);
		
		return deleteResult;
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno, String b_name) {
		
		return attachMapper.findByBno(bno, b_name);
	}


	@Override
	public void removeAttach(Long bno, String b_name) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<BoardVO> getListForHomeFree() {
		return mapper.getListForHomeFree();
	}
	@Override
	public List<BoardVO> getListForHomeAnalysis() {
		return mapper.getListForHomeAnalysis();
	}
	
	
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
	private long convertGrade(BoardVO temp) {
		
		long grade = temp.getGrade();
		
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
}//class
