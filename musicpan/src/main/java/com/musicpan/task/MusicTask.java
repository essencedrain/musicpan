package com.musicpan.task;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.musicpan.domain.SongBasicVO;
import com.musicpan.mapper.MusicMapper;
import com.musicpan.music.MusicPro;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class MusicTask {

	@Setter(onMethod_ = {@Autowired})
	private MusicMapper mapper;
	
	//MusicPro 로드
	private MusicPro musicPro = new MusicPro();
	
	//매일 5분마다
	@Scheduled(cron="0 */5 * * * *")
	public void routine5() throws Exception{
		
		//현재 유저마켓에 있는 모든 곡 idx(Stirng) 획득
		HashSet<String> list = musicPro.getList();
		//현재 DB에 있는 모든 곡 idx(int)획득
		List<Integer> dbIdxs = mapper.getIdx();
		
		
		//스프레드 및 최근거래내역 갱신
		updateSpread(list);
		
		//log.info("list size : "+list.size());
		//log.info("dbIdxs size : "+dbIdxs.size());
		//위 2개 size 비교
		if(list.size()!=dbIdxs.size()) {//사이트와 DB간 곡 갯수가 다를때 신곡 추가해주는 루틴
		//size다르면 신곡 추가된것, 신곡 추가해주기
			for(int temp : dbIdxs) {
				if(list.contains(temp+"")) {
					//유저마켓 list(hashset)에서 삭제
					list.remove(temp+"");
				}//if
			}//for
			//log.info("list size : "+list.size());
			
			//기본정보(옥션포함) 삽입
			insertBasic(list);
			
		}else {// 사이트 마감된 옥션 곡 갯수와 DB 옥션 정보 갯수를 비교해서
		//다르면 else 분기로 인해 무조건 재옥션이니 재옥션 처리 한다.
			
			//HashSet<String> 옥션idx
			HashSet<String> setOfSite = musicPro.getAuctionAllList();
			
			//DB에서 옥션 갯수 가져오자
			List<Integer> dbAuctionAllCnt = mapper.getAuctionAllCnt();
			
			//비교해서 다르면 => 재옥션
			//db에 있는거 걸러주자
			if(dbAuctionAllCnt.size() != setOfSite.size()) {
				for(int temp : dbAuctionAllCnt) {
					if(setOfSite.contains(temp+"")) {
						setOfSite.remove(temp+"");
					}//if
				}//for
			}//if
			
			//삽입
			for(String temp : setOfSite) {
				insertReAuction(temp);
			}//for
			
		}////if(list.size()!=dbIdxs.size())
		
		
		
	}//public void routine5()

	
	
	
	
	
	//----------------------------------------------------------------------------------------------------------------
	// 기본정보 삽입 (옥션포함)
	// parameter : 정제된 idx (신규곡)
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
			insertAuction(vo.getSong(), vo.getSinger());
			
			//저작권정보 삽입
			insertFee(temp);
		}
	}//insertBasic
	//----------------------------------------------------------------------------------------------------------------
	
	//----------------------------------------------------------------------------------------------------------------
	// 신곡 옥션정보삽입
	//----------------------------------------------------------------------------------------------------------------
	private void insertAuction(String song, String singer) {
		
		//사이트로부터 곡과 가수에 대해서 이미 진행한 옥션IDX들을 얻어온다.
		//신곡이라서 1개밖에 안나옴
		List<String> listAuction = musicPro.getAuctionList(song, singer);
		String target = listAuction.get(0);
		
		//수집해오고
		String[] auctionResult = musicPro.getAuctionInfo(target);
		int temp = Integer.parseInt(target);
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
	
	
	//----------------------------------------------------------------------------------------------------------------
	// 재옥션정보삽입
	//----------------------------------------------------------------------------------------------------------------
	private void insertReAuction(String auctionIdx) {
		
		//수집해오고
		String[] auctionResult = musicPro.getAuctionInfo(auctionIdx);
		int temp = Integer.parseInt(auctionIdx);
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
	
	
	//----------------------------------------------------------------------------------------------------------------
	// 저작권료 정보 삽입
	//----------------------------------------------------------------------------------------------------------------
	private void insertFee(String idx) {
		
		List<String> result = musicPro.getFeeInfo(idx);
		int tempIdx = Integer.parseInt(idx);
		
		for(int i=0; i<result.size()-1;i++) {
			
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
		
		
		//최근12개월 저작권 유형 정보 삽입
		String tempFeeInfo = result.get(result.size()-1);
		String[] tempFeeInfo2 = tempFeeInfo.trim().split(",");
		Date tempfeeMonth=null;
		try {
			tempfeeMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").parse(tempFeeInfo2[0]);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int broadcast = Integer.parseInt(tempFeeInfo2[1]);
		int transfer = Integer.parseInt(tempFeeInfo2[2]);
		int duplication = Integer.parseInt(tempFeeInfo2[3]);
		int performance = Integer.parseInt(tempFeeInfo2[4]);
		int oversea = Integer.parseInt(tempFeeInfo2[5]);
		int etc = Integer.parseInt(tempFeeInfo2[6]);
		
		mapper.insertFeeInfo(tempIdx, tempfeeMonth, broadcast, transfer, duplication, performance, oversea, etc);
		
	}
	//----------------------------------------------------------------------------------------------------------------
	
	
	//----------------------------------------------------------------------------------------------------------------
	// 스프레드 정보 갱신
	// 갱신하다가 최근거래가가 다르면 최근거래내역도 갱신
	//----------------------------------------------------------------------------------------------------------------
	private void updateSpread(HashSet<String> list) {
		
		for(String temp : list) {
			
			int idx = Integer.parseInt(temp);
			
			//getSpreadInfo 결과
			Map<String,Object> resultSpread = musicPro.getSpreadInfo(temp);
			
			
			//최근거래가
			int recentPrice = Integer.parseInt( (String)resultSpread.get("recentPrice") );
			
			if(recentPrice!=0) {
			
				//최근거래시간
				Date recentPriceTime=null;
				try {
					recentPriceTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse( (String)resultSpread.get("recentPriceTime") );
				} catch (Exception e) {
					e.printStackTrace();
				}//try
				
				
				//매수
				List<String[]> tempBuy = (List<String[]>)resultSpread.get("buy");
				int buyUnit;
				int buyPrice;
				if(tempBuy!=null) {
					buyPrice = Integer.parseInt(tempBuy.get(0)[0]);
					buyUnit = Integer.parseInt(tempBuy.get(0)[1]);
				}else {
					buyUnit = 0;
					buyPrice = 0;
				}//if
				
				//매도
				List<String[]> tempSell = (List<String[]>)resultSpread.get("sell");
				int sellUnit;
				int sellPrice;
				if(tempSell!=null) {
					sellPrice = Integer.parseInt(tempSell.get(0)[0]);
					sellUnit = Integer.parseInt(tempSell.get(0)[1]);
				}else {
					sellUnit = 0;
					sellPrice = 0;
				}//if
				
				
				//------------------------------
				
				Date dbRecnetPriceTime = mapper.getRecentPriceTime(idx);
				
				//basic 갱신
				mapper.updateSpreadInfo(idx, recentPrice, recentPriceTime, buyUnit, buyPrice, sellUnit, sellPrice);
				
				
				//최근거래시간이 다르면? 최근거래내역 업데이트해야지
				if( !recentPriceTime.equals(dbRecnetPriceTime) ) {
	//						log.info("idx : " + idx);
	//						log.info("최근 거래 시간 : " + recentPriceTime); //getSpreadInfo 결과
	//						log.info("최근 DB 거래 시간 : " + dbRecnetPriceTime); //music_basic의 최근거래시간
	//						log.info("같냐? : " + (recentPriceTime.equals(dbRecnetPriceTime)) );
					
					//DB에 저장된 최신 거래내역 15건
					List<Date> resultHis = mapper.getHisTime(idx);
					
					//사이트에서 가져온 최신 거래내역 최대 15건
					//getRecentInfo 결과
					List<String> resultRecent = musicPro.getRecentInfo(temp);
					
					for(String tempRecent : resultRecent) {
						
						String[] tempArr = tempRecent.split(",");
						
						//날짜 앞에 20 더해줘야함
						//거래시간
						Date hisTime=null;
						try {
							hisTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse( "20"+tempArr[0] );
						} catch (Exception e) {
							e.printStackTrace();
						}//try
						
						int hisPrice = Integer.parseInt(tempArr[1]);
						int hisUnit = Integer.parseInt(tempArr[2]);
						
						
						//DB에서 가져온거랑 대조해서 없는거면 삽입
						boolean tempFlag = false;
						for(Date tempHistroy : resultHis) {
							//log.info(tempHistroy + " // " + hisTime + " // " + (tempHistroy.equals(hisTime)) );
							if( hisTime.equals(tempHistroy) ) {
								tempFlag = true;
							}//if
						}//for
						if(!tempFlag) {
							//거래내역 신규삽입
							mapper.insertHistory(idx, hisTime, hisPrice, hisUnit);
							//log.info(idx+"에 신규삽입!");
						}//if
					}//for
					
				}//if
			}//if
		}//for(String temp : list) {
		
	}
	//----------------------------------------------------------------------------------------------------------------
}//class
