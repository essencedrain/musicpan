package com.musicpan.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicpan.domain.VisitVO;
import com.musicpan.mapper.VisitMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class VisitServiceImpl implements VisitService{
	
	@Setter(onMethod_ = @Autowired)
	private VisitMapper mapper;
	
	@Override
	public int[] insertVisitor(VisitVO vo) {
		
		mapper.insert(vo);
		
		SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		String todate = format.format(time);
		
		
		
		int[] countArray = new int[4];
		
		countArray[0] =  mapper.countAll();
		countArray[1] =  mapper.countToday(todate);
		countArray[2] =  mapper.countAllDistinct();
		countArray[3] =  mapper.countTodayDistinct(todate);
		
		
		return countArray;
	}

	
	
}//class
