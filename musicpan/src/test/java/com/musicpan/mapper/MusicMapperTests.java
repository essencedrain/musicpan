package com.musicpan.mapper;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
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

	
	@Setter(onMethod_ = {@Autowired})
	private MusicMapper mapper;
	
	//MusicPro 로드
	private MusicPro musicPro = new MusicPro();
	
	
	
	//사이트와 DB idx 비교
	@Test
	public void testBasicInfo() {
		
		//현재 유저마켓에 있는 모든 곡 idx(Stirng) 획득
		HashSet<String> list = musicPro.getList();
		//현재 DB에 있는 모든 곡 idx(int)획득
		List<Integer> dbIdxs = mapper.getIdx();
		
		log.info("list size : "+list.size());
		log.info("dbIdxs size : "+dbIdxs.size());
		//위 2개 size 비교
		if(list.size()!=dbIdxs.size()) {
		//size다르면 신곡 추가된것, 신곡 추가해주기
			for(int temp : dbIdxs) {
				if(list.contains(temp+"")) {
					//유저마켓 list(hashset)에서 삭제
					list.remove(temp+"");
				}//if
			}//for
			log.info("list size : "+list.size());
			//기본정보(옥션포함) 삽입
			//insertBasic(list);
			
			
			for(String idx : list) {
				List<String> result = musicPro.getFeeInfo(idx);
				
				for(int i=0; i<result.size()-1;i++) {
					
					int tempIdx = Integer.parseInt(idx);
					String tempFee = result.get(i);
					String[] tempFee2 = tempFee.trim().split(",");
					
					Date tempfeeMonth=null;
					try {
						tempfeeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(tempFee2[0]);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					int fee = Integer.parseInt(tempFee2[1]);
					
					mapper.insertFee(tempIdx, tempfeeMonth, fee);
					
				}//for
				
			}//for
			
		}//if(list.size()!=dbIdxs.size()) 사이트와 DB간 곡 갯수가 다를때 신곡 추가해주는 루틴
		
		
		
	}
	
	
	
	
	
	/*
	//현재 DB속에 있는 모든 곡 idx 가져오기
	@Test
	public void testBasicInfo() {
		List<Integer> result = mapper.getIdx();
		
		log.info("testBasicInfo : " + result.size());
	}
	
	*/
	
	/*
	//전체곡 list 받아서, 전체곡 기본정보 넣기
	@Test
	public void testBasicInfo() {
	
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
	*/
	
	//----------------------------------------------------------------------------------------------------------------
		// 기본정보 삽입 (옥션포함)
		//----------------------------------------------------------------------------------------------------------------
		private void insertBasic(HashSet<String> list) {
			
			Map<String, String> result = new HashMap<>();  
			SongBasicVO vo = new SongBasicVO();
			
			for(String temp : list) {
				//log.info("list : "+temp);
				
				result = musicPro.getBasicInfo(temp);
				
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
				} catch (Exception e) {
					e.printStackTrace();
				}
				vo.setReleaseDate(to);
				
				vo.setCopyRight(Integer.parseInt(result.get("copyRight")));
				vo.setSecRight(Integer.parseInt(result.get("secRight")));
				vo.setStockCnt(Integer.parseInt(result.get("stockCnt")));
				
				mapper.insert(vo);
				//log.info("vo : "+vo.toString());
				
				//옥션정보 삽입
				insertAuction(temp);
			}
		}//insertBasic
		//----------------------------------------------------------------------------------------------------------------
		
		//----------------------------------------------------------------------------------------------------------------
		//옥션정보삽입
		//----------------------------------------------------------------------------------------------------------------
		private void insertAuction(String idx) {
			
			//수집해오고
			String[] auctionResult = musicPro.getAuctionInfo(idx);
			int temp = Integer.parseInt(idx);
			//n차 옥션에 대한 정보 music_auction에 삽입
			for(String tempAuction : auctionResult) {
				String[] tempSplit = tempAuction.trim().split(",");
				int auctionCnt = Integer.parseInt(tempSplit[0]);
				int auctionUnits = Integer.parseInt(tempSplit[1]);
				int auctionStart = Integer.parseInt(tempSplit[2]);
				int auctionLowPrice = Integer.parseInt(tempSplit[3]);
				int auctionAvgPrice = Integer.parseInt(tempSplit[4]);
				mapper.insertAuction(temp, auctionCnt, auctionUnits, auctionStart, auctionLowPrice, auctionAvgPrice);
			}//for
		}//insertAuction
		//----------------------------------------------------------------------------------------------------------------
}//class
