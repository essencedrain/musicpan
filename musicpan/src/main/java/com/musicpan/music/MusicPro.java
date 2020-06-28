package com.musicpan.music;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.musicpan.domain.NowAuctionVO;

import lombok.extern.log4j.Log4j;


@Log4j
public class MusicPro {

		
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getList() : 유저마켓에 있는 모든곡 idx 가져옴
			// HashSet<String>
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public HashSet<String> getList() {
				HashSet<String> songNums = new HashSet<String>();
				String url="https://www.musicow.com/auctions?tab=market&page=";

				try {
					int page=1;
					boolean flag = true;
					
					while(flag) {
							
						Document doc = Jsoup.connect(url+page).get();
						
						Elements temp = doc.select(".user_buy").select("li").select("a");
						
						if(temp.size() < 18) {
							flag = false;
						}//if
						
						for (int i = 0; i < temp.size(); i++) {
						    songNums.add(temp.get(i).attr("href").substring(6).trim());
						}//for
						page += 1;
						
					}//while
					
				} catch (Exception e) {
					log.info("GetSongNums.getList() 에러 : " + e);
				}
				return songNums;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getAuctionList(String song) : 곡명, 가수를 넣으면 옥션번호 가져옴
			// List<String> 옥션idx
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public List<String> getAuctionList(String song, String singer) {
				List<String> songNums = new ArrayList<>();
				String url="https://www.musicow.com/auctions?tab=closed&keyword=&page=";
				
				try {
					int page=1;
					boolean flag = true;
					
					while(flag) {
						
						Document doc = Jsoup.connect(url+page).get();
						
						Elements temp = doc.select(".user_buy").select("li").select("a");
						
						if(temp.size() < 18) {
							flag = false;
						}//if
						
						for (int i = 0; i < temp.size(); i++) {
							String tempSong = "";
							String tempNum = "";
							String tempSinger = "";
							//곡명
							tempSong = temp.get(i).select("div.txt_box > div > dl:nth-child(1) > dd").text().trim();
							//가수명
							tempSinger = temp.get(i).select("div.txt_box > div > dl:nth-child(2) > dd").text().trim();
							//곡옥션번호 idx
							tempNum = temp.get(i).attr("href").substring(9).trim();
							
							//songNums.add(temp.get(i).attr("href").substring(9).trim());
							//songNums.add(temp.get(i).select("div.txt_box > div > dl:nth-child(1) > dd").text().trim());
							
							//검색어(곡명, 가수명) 같은 곡만 담는다.
							if(song.equals(tempSong)) {
								if(singer.equals(tempSinger)) {
									songNums.add(tempNum);
								}
							}
						}//for
						page += 1;
						
					}//while
					
				} catch (Exception e) {
					//log.info("GetSongNums.getList() 에러 : " + e);
				}
				return songNums;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getAuctionAllList() : 모든 마감된 옥션곡 정보 반환
			// HashSet<String> 옥션idx
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public HashSet<String> getAuctionAllList() {
				HashSet<String> songNums = new HashSet<>();
				String url="https://www.musicow.com/auctions?tab=closed&keyword=&page=";
				
				try {
					int page=1;
					boolean flag = true;
					
					while(flag) {
						
						Document doc = Jsoup.connect(url+page).get();
						
						Elements temp = doc.select(".user_buy").select("li").select("a");
						
						if(temp.size() < 18) {
							flag = false;
						}//if
						
						for (int i = 0; i < temp.size(); i++) {
							
							//곡옥션번호
							String tempResult = temp.get(i).attr("href").substring(9).trim();
							
							songNums.add(tempResult);
						}//for
						page += 1;
						
					}//while
					
				} catch (Exception e) {
					log.info("GetSongNums.getList() 에러 : " + e);
				}
				return songNums;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getAuctionInfo(String idx - 옥션idx) : 옥션 정보
			// num 옥션인덱스 옥션idx
			// unitSum 총옥션수량
			// priceStart 옥션시작가
			// priceLow 낙찰최저가
			// priceAvg 낙찰평균가
			//song, singer
			//차수,수량,시작가,최저낙찰가,평균가,곡명, 가수
			// String[7] 차수,수량,시작가,최저낙찰가,평균가,곡명, 가수
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public String[] getAuctionInfo(String idx) {
				Document doc= null;
				String url="https://www.musicow.com/auction/";
				
				try {
					doc = Jsoup.connect(url+idx).get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				
				//곡명
				String song = doc.select("#page_auction > div > div > strong").text().trim();
				//가수명
				String singer = doc.select("#page_auction > div > div > em").text().trim();
				
				
				//총옥션수량
				//아래가 "옥션 수량"으로 나와야함 "낙찰 처리"가 있으면 다르게 파싱
				String validation = doc.select("dl.price > dt:nth-child(3)").text().trim();
				int totalUnits;
				int priceStart;
				if(validation.equals("옥션 수량")) {
					String tempTotalUnits = doc.select("dl.price > dd:nth-child(4) > strong").text().trim();
					String rawTotalUnits = tempTotalUnits.substring(0, tempTotalUnits.indexOf("주")).replaceAll(",", "");
					totalUnits = Integer.parseInt(rawTotalUnits);
					
					String tempPriceStart = doc.select("dl.price > dd:nth-child(6) > strong").text().trim();
					String rawPriceStart = tempPriceStart.substring(0, tempPriceStart.indexOf(" ")).replaceAll(",", "");
					priceStart = Integer.parseInt(rawPriceStart);
				}else {
					String tempTotalUnits = doc.select("dl.price > dd:nth-child(6) > strong").text().trim();
					String rawTotalUnits = tempTotalUnits.substring(0, tempTotalUnits.indexOf("주")).replaceAll(",", "");
					totalUnits = Integer.parseInt(rawTotalUnits);
					
					String tempPriceStart = doc.select("dl.price > dd:nth-child(8) > strong").text().trim();
					String rawPriceStart = tempPriceStart.substring(0, tempPriceStart.indexOf(" ")).replaceAll(",", "");
					priceStart = Integer.parseInt(rawPriceStart);
				}
				
				//헤더1줄, 마지막 집계 1줄 사이가 옥션내용
				int totalSize = doc.select(".multi_option div").size();
				//System.out.println(doc.select(".multi_option div").size());
				
				List<int[]> rawAuction = new ArrayList<>();
				
				
				//입찰내역 수집
				for(int i=1; i<totalSize-1; i++) {
					
					int[] rawData = new int[2];
					
					String rawPrice = doc.select(".multi_option div:nth-child("+(i+1)+") > ul > li:nth-child(1)").text().trim();
					
					//입찰가
					String price = rawPrice.substring(0, rawPrice.indexOf(" ") ).replaceAll(",", "");
					//입찰수량
					String unit = doc.select(".multi_option div:nth-child("+(i+1)+") > ul > li:nth-child(2)").text().replaceAll(",", "").trim();
					
					//System.out.println( doc.select(".multi_option div:nth-child("+(i+1)+") > ul > li:nth-child(2)").text().trim() );
					
					//수량
					rawData[0] = Integer.parseInt(unit);
					//가격
					rawData[1] = Integer.parseInt(price);
					
					rawAuction.add(rawData);
				}//for
				
				int unitSum =0;
				int priceSum = 0;
				int priceAvg = 0;
				int priceLow = 0;
				for(int i=0; i<rawAuction.size(); i++) {
					
					if( (i+1) == rawAuction.size()){
						int tempUnit = totalUnits - unitSum;
						unitSum += tempUnit;
						priceSum += (rawAuction.get(i)[1] * tempUnit);
						
						priceLow = rawAuction.get(i)[1];
						priceAvg = priceSum / unitSum;
						break;
					}
					
					if(totalUnits > unitSum + rawAuction.get(i)[0]) {
						unitSum += rawAuction.get(i)[0];
						priceSum += (rawAuction.get(i)[1] * rawAuction.get(i)[0]);
						
					}else if(totalUnits == unitSum + rawAuction.get(i)[0]){
						unitSum += rawAuction.get(i)[0];
						priceSum += (rawAuction.get(i)[1] * rawAuction.get(i)[0]);
						
						priceLow = rawAuction.get(i)[1];
						priceAvg = priceSum / unitSum;
						break;
					}else {
						int tempUnit = totalUnits - unitSum;
						unitSum += tempUnit;
						priceSum += (rawAuction.get(i)[1] * tempUnit);
						
						priceLow = rawAuction.get(i)[1];
						priceAvg = priceSum / unitSum;
						break;
					}//if
				}//for
				
				//num 옥션인덱스 
				//unitSum 총옥션수량
				//priceStart 옥션시작가
				//priceLow 낙찰최저가
				//priceAvg 낙찰평균가
				//차수,수량,시작가,최저낙찰가,평균가
				int num = Integer.parseInt(idx);
				
				//System.out.println(num + " // " + unitSum + " // "+ priceSum + " // "+ priceLow + " // "+ priceAvg + " // " + priceStart);
				
				String[] result = new String[7];
				
				result[0] = num+"";
				result[1] = unitSum+"";
				result[2] = priceStart+"";
				result[3] = priceLow+"";
				result[4] = priceAvg+"";
				result[5] = song;
				result[6] = singer;
				
				return result;
				
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getFeeInfo(String idx) : 저작권료 정보
			/*
			  
			  	List<String>
			  	...
				n-3	2020-03-01,56   연월일, 발생저작권료
				n-2	2020-04-01,55
				n-1	2020-05-01,53
				n	2020-05-01,370,345,2,523,0,0 연월일,방송,전송,복제, 공연,해외,기타
			  
			 */
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public List<String> getFeeInfo(String idx) {
			
				Document doc= null;
				String url="https://www.musicow.com/song/";
				Elements releasedateTemp = null;
				
				try {
					doc = Jsoup.connect(url+idx+"?tab=info").get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				List<String> feeList = new ArrayList<>();
				
				//----------------------------------------------
				//최근 12개월 저작권료 (1주 기준) 구성
				//feeCompo[연월(아래추가),방송,전송,복제, 공연,해외,기타]
				//----------------------------------------------
				String feeCompo = "";
				for(int i=1; i<7; i++) {
					releasedateTemp = doc.select(".tbl_flex > dl:nth-child("+i+") > dd");
					String temp = releasedateTemp.text();
					if(i==1) {
						feeCompo += temp.substring(0,temp.indexOf("원")).replaceAll(",", "");
					}else {
						feeCompo += ","+temp.substring(0,temp.indexOf("원")).replaceAll(",", "");
					}
				}//for
				//----------------------------------------------
				
				
				//----------------------------------------------
				// 저작권료 자료 획득
				// List<String[연월, 저작권료]> feeList
				//----------------------------------------------
				
				Elements script = doc.select("script");
				Element script2 = script.get(10);
				String jsonData = script2.html().substring(83,script2.html().length()-56);
				
				//JSON 파싱
				JsonElement element = JsonParser.parseString(jsonData);
				JsonObject object1 = element.getAsJsonObject();
				
				//최신->옛날 거꾸로된 자료 일단 먼저 담기(
				for(String k : object1.keySet()) {
					JsonObject temp = object1.get(k).getAsJsonObject();
					for(String j : temp.keySet()) {
						JsonPrimitive jsonPrimitive = temp.getAsJsonPrimitive(j);
						
						String tempValue = k+"-"+j+"-01";
						if(feeList.size()==0) {
							feeList.add(tempValue+","+feeCompo);
						}
						tempValue += ","+jsonPrimitive.getAsString().trim().replaceAll(",", "");
						feeList.add(tempValue);
					}//for j
				}//for k
				
				//뒤집음 옛날->최신
				Collections.reverse(feeList);
				//----------------------------------------------
				
				return feeList;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getRecentInfo(String idx) : 시세, 최근거래 내역
			// List<String> result
			// 20-06-05 20:50:30,23500,2
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public List<String> getRecentInfo(String idx) {
				Document doc= null;
				String url="https://www.musicow.com/song/";
				List<String> result = new ArrayList<>();
				try {
					doc = Jsoup.connect(url+idx+"?tab=price").get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				
				//최근 거래내역 갯수 max15
				//doc.select("tbody tr").size()
				int recentSize = doc.select("tbody tr").size();
				
				
				for(int i=0; i<recentSize; i++) {
					String temp = "";
					for(int j=0; j<3; j++) {
						//System.out.println(doc.select("tbody tr:nth-child("+(i+1)+") td:nth-child("+(j+1)+")").text().trim().replaceAll(",", ""));
						if(temp.length()==0) {
							temp += doc.select("tbody tr:nth-child("+(i+1)+") td:nth-child("+(j+1)+")").text().trim().replaceAll(",", "");
						}else {
							temp += ","+doc.select("tbody tr:nth-child("+(i+1)+") td:nth-child("+(j+1)+")").text().trim().replaceAll(",", "");
						}
					}
					result.add(temp);
				}//for
				
				return result;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getBasicInfo(String idx) : 기본 정보
			//
			// Map<String, String>
			/*
			 	song		곡명
			 	singer		가수
			 	releasedate		공표일
			 	composer	작곡가
			 	lyricist	작사가
			 	arranger	편곡가(null가능)
				copyRight	저작권1, 인접권0
				stockCnt	지분수
				secRight	2차저작물작성권(1:있음, 0:없음)
			 */
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public Map<String, String> getBasicInfo(String idx) {
				
				Document doc= null;
				String url="https://www.musicow.com/song/";
				Map<String, String> result = new HashMap<String, String>(); 
				
				try {
					doc = Jsoup.connect(url+idx+"?tab=info").get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				//곡명
				String song = doc.select(".information").select("strong").text();
				result.put("song", song);
				
				
				//log.info(doc.select(".lst_bul dl").size());
				//int songFlag = doc.select(".lst_bul dl").size()
				//9개 무효곡
				//10개 편곡자x
				//11개 편곡O
				/* 
					1:공표일
					2:가수
					3:작곡가
					4:작사
					5:편곡					5:인접
					6:인접					9:지분수/2차저작물
					10: 지분수 / 2차저작물
				 */
				
				
				int songFlag = doc.select(".lst_bul dl").size();
				Elements releasedateTemp = null;
				String releasedate =null;
				String singer =null;
				String composer = null;
				String lyricist = null;
				String arranger = null;
				String copyRight = null;
				String stockCnt = null;
				String secRight = null;
				
				//----------------------------------------------
				//공표일
				releasedateTemp = doc.select(".lst_bul > dl:nth-child(1) > dd");
				releasedate = releasedateTemp.text();
				//----------------------------------------------
				//가수
				releasedateTemp = doc.select(".lst_bul > dl:nth-child(2) > dd");
				singer = releasedateTemp.text();
				//----------------------------------------------
				//작곡가
				releasedateTemp = doc.select(".lst_bul > dl:nth-child(3) > dd");
				composer = releasedateTemp.text();
				//----------------------------------------------
				//작사가
				releasedateTemp = doc.select(".lst_bul > dl:nth-child(4) > dd");
				lyricist =releasedateTemp.text();
				//----------------------------------------------
				result.put("releasedate", releasedate);
				result.put("singer", singer);
				result.put("composer", composer);
				result.put("lyricist", lyricist);
				
				
				
				if(songFlag==11) {
					//편곡가
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(5) > dd");
					arranger = releasedateTemp.text();
				}else {
					//저작권1 인접권0
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(5) > dd");
					copyRight = releasedateTemp.text().trim();
					
					if(copyRight.length()>0) {//615 고유진 제자리걸음 정보 없음
						copyRight = copyRight.substring(0,3);
						copyRight = copyRight.equals("원작자") ? "1" : "0";
					}else {
						copyRight = "-1";
					}
				}
				
				if(songFlag==11) {
					//저작권1 인접권0
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(6) > dd");
					copyRight = releasedateTemp.text().trim();
					
					if(copyRight.length()>0) {//615 고유진 제자리걸음 정보 없음
						copyRight = copyRight.substring(0,3);
						copyRight = copyRight.equals("원작자") ? "1" : "0";
					}else {
						copyRight = "-1";
					}
				}
				result.put("arranger", arranger);
				result.put("copyRight", copyRight);
				
				
				
				
				if(songFlag==11) {
					//지분수
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(10) > dd > p:nth-child(1)");
					stockCnt = releasedateTemp.text().trim();
					stockCnt = stockCnt.substring(stockCnt.indexOf("/")+1).replaceAll(",", "");
					//----------------------------------------------
					//2차저작물작성권(1,0)
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(10) > dd > p:nth-child(2)");
					secRight = releasedateTemp.text().trim();
					secRight = secRight.substring(secRight.indexOf("(")+1,secRight.indexOf("(")+2);
					secRight = secRight.equals("O") ? "1" : "0";
				}else{
					//지분수
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(9) > dd > p:nth-child(1)");
					stockCnt = releasedateTemp.text().trim();
					stockCnt = stockCnt.substring(stockCnt.indexOf("/")+1).replaceAll(",", "");
					//----------------------------------------------
					//2차저작물작성권(1,0)
					releasedateTemp = doc.select(".lst_bul > dl:nth-child(9) > dd > p:nth-child(2)");
					secRight = releasedateTemp.text().trim();
					secRight = secRight.substring(secRight.indexOf("(")+1,secRight.indexOf("(")+2);
					secRight = secRight.equals("O") ? "1" : "0";
				}
				
				result.put("stockCnt", stockCnt);
				result.put("secRight", secRight);
				
				
				
				return result;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// SpreadInfo(String idx) : 스프레드정보
			// 최근거래가, 최근거래시간, 팔자, 사자
			// 파라미터 idx
			// Map<String, Object>
			// recentPrice(String), recentPriceTime(String), buy(List<String[가격,갯수]>), sell(List<String[가격,갯수]>)
			// 23500				2020-06-05 13:46:51
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public Map<String, Object> getSpreadInfo(String idx) {
				
				Map<String, Object> result = new HashMap<String, Object>(); 
				Document doc= null;
				
				String url2="https://www.musicow.com/api/song";
				
				try {
					doc = Jsoup.connect(url2).data("song_id", idx).userAgent("Mozilla").post();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				String jsonData =doc.text();
				
				JsonElement element = JsonParser.parseString(jsonData);
				JsonObject object = element.getAsJsonObject();
				
				//----------------------------------------------
				//최근거래 시간
				String recentPriceTime = object.get("song").getAsJsonObject().get("marketpubdate").getAsJsonPrimitive().getAsString();
				result.put("recentPriceTime", recentPriceTime);
				//log.info(recentPriceTime);
				//----------------------------------------------
				
				//----------------------------------------------
				//최근거래 가격
				String recentPrice = object.get("song").getAsJsonObject().get("amt_market_latest").getAsJsonPrimitive().getAsString();
				result.put("recentPrice", recentPrice);
				//log.info(recentPrice);
				//----------------------------------------------
				
				//----------------------------------------------
				//팔자 스프레드
				//List<String[가격,갯수]>
				//----------------------------------------------
				List<String[]> sellSpreadData = new ArrayList<>();
				
				if(!object.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("1").isJsonArray()){
					JsonObject sellSpread = object.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("1").getAsJsonObject();
					if(sellSpread.size() > 0 ) {//0개 방지
						for(String k : sellSpread.keySet()) {
							String[] temp = new String[2];
							temp[0] = sellSpread.get(k).getAsJsonObject().getAsJsonPrimitive("amount").getAsString();
							temp[1] = sellSpread.get(k).getAsJsonObject().getAsJsonPrimitive("cnt_units_market").getAsString();
							sellSpreadData.add(temp);
						}//for
						
					}else {
						sellSpreadData = null;
					}//if
				}else {
					sellSpreadData = null;
				}//if
				result.put("sell", sellSpreadData);
				//----------------------------------------------
				
				//----------------------------------------------
				//사자 스프레드
				//List<String[가격, 갯수]>
				//----------------------------------------------
				List<String[]> buySpreadData = new ArrayList<>();
				
				if(!object.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("2").isJsonArray()){
					JsonObject buySpread = object.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("2").getAsJsonObject();
					if(buySpread.size() > 0 ) {//0개 방지
						for(String k : buySpread.keySet()) {
							String[] temp = new String[2];
							temp[0] = buySpread.get(k).getAsJsonObject().getAsJsonPrimitive("amount").getAsString();
							temp[1] = buySpread.get(k).getAsJsonObject().getAsJsonPrimitive("cnt_units_market").getAsString();
							buySpreadData.add(temp);
						}//for
						
					}else {
						buySpreadData = null;
					}//if
				}else {
					buySpreadData = null;
				}//if
				result.put("buy", buySpreadData);
				//----------------------------------------------
				
				return result;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getFeeInfoMonth(int dbYear, int dbMonth) : 저작권료 정보
			/*
			  	이 메서드는 월이 바뀌었을때 작동이 시작된다.
			  	db 연도와 월을 넣고 사이트 스크립트에 저작권료 불러온다.
		  		db와 사이트간에 모든곡이 차이가 1이 나야 정상이고 = true
		  		(즉, db가 5면 사이트의 모든곡이 6이 되야 true)
		  		한 곡이라도 차이가 0 이면 false
			    
			    true가 되면 저작권료 갱신을 시작한다.
			 */
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public boolean getFeeInfoMonth(int dbYear, int dbMonth, List<Integer> dbIdxs) {
				
				Document doc= null;
				String url="https://www.musicow.com/song/";
				
				boolean result = false;
				
				int resultCnt = 0;
				
				for(int tempList : dbIdxs) {
					
				
					try {
						doc = Jsoup.connect(url+tempList+"?tab=info").get();
					} catch (Exception e) {
						//log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
					}//try
					
					
					
					//----------------------------------------------
					// 저작권료 자료 획득
					// List<String[연월, 저작권료]> feeList
					//----------------------------------------------
					
					Elements script = doc.select("script");
					Element script2 = script.get(10);
					String jsonData = script2.html().substring(83,script2.html().length()-56);
					
					//JSON 파싱
					JsonElement element = JsonParser.parseString(jsonData);
					JsonObject object1 = element.getAsJsonObject();
					
					forout:
					for(String k : object1.keySet()) {
						JsonObject temp = object1.get(k).getAsJsonObject();
						for(String j : temp.keySet()) {
							
							//String tempValue = k+"-"+j+"-01";
							int year = Integer.parseInt(k);
							int month = Integer.parseInt(j);
							
							if(dbMonth == 12) {//월은 12진수니 처리
								if(year==dbYear) {
									if( month == 1) {
										resultCnt += 1;
									}
								}//if
							}else {
								if(year==dbYear) {
									if( month == dbMonth+1) {
										resultCnt += 1;
									}
								}//if
							}//if
							
							//최신꺼 하나만 담고 바로 탈출
							break forout;
						}//for j
					}//for k
					
					//----------------------------------------------
				}//for(String tempList : list) {
				
				if(dbIdxs.size() == resultCnt) {
					result = true;
				}//if
				
				return result;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//************진행중 옥션 누적합 보여주기 위한 메서드*********
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getNowAuctionIdx() : 현재 진행중인 옥션 idx list로 반환
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public List<Integer> getNowAuctionIdx() {
				
				int page = 1;
				boolean last_page = false;
				List<Integer> result = new ArrayList<>();
				
				while(!last_page) {
					Document doc= null;
					String url = "https://www.musicow.com/api/auctions?page="+page;
					
					try {
						doc = Jsoup.connect(url).get();
					} catch (Exception e) {
						log.info("getAuctionInfo Jsoup.connect(url).get() : "+e);
					}//try
					
					String jsonData =doc.text();
					JsonElement element = JsonParser.parseString(jsonData);
					JsonObject object = element.getAsJsonObject();
					//log.info("jsonData : "+jsonData);
					//log.info("object : "+object);
					
					
					JsonArray ids = object.get("auctions").getAsJsonArray();
					//log.info(ids.size());//현재 페이지 옥션중인 곡 size
					
					for(int i=0; i<ids.size();i++) {
						String test = object.get("auctions").getAsJsonArray().get(i).getAsJsonObject().getAsJsonPrimitive("id").getAsString();
						result.add(Integer.parseInt(test.trim()));
					}//for
					
					
					last_page = object.get("is_last_page").getAsBoolean();
					page += 1;
				}//while
					
				return result;
					
			}//getAuctionInfo
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getNowAuctionSongInfo() : 현재 진행중인 옥션곡 정보 가져오기
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public NowAuctionVO getNowAuctionSongInfo(int idx) {
				
				Document doc= null;
				String url = "https://www.musicow.com/auction/"+idx;
				
				NowAuctionVO result = new NowAuctionVO();
				List<int[]> bidList = new ArrayList<>();
				String bidPrice = "";
				String bidUnit = "";
				String bidSum = "";
				String bidGap = "";
				
				try {
					doc = Jsoup.connect(url).get();
				} catch (Exception e) {
					log.info("getNowAuctionSongInfo Jsoup.connect(url).get() : "+e);
				}//try
				
				String song = doc.select("#page_auction > div > div > strong").text();
				String singer = doc.select("#page_auction > div > div > em").text();
				String units_string = doc.select("#page_auction > div > div > dl > dd:nth-child(4) > strong").text();
				int totalUnits = Integer.parseInt( units_string.substring(0, units_string.indexOf("주")).replaceAll(",", "") );
				String startPrice_string = doc.select("#page_auction > div > div > dl > dd:nth-child(6) > strong").text();
				int startPrice = Integer.parseInt( startPrice_string.substring(0, startPrice_string.indexOf("캐")-1).replaceAll(",", "") );
				
				
				result.setIdx(idx);
				result.setSong(song);
				result.setSinger(singer);
				result.setTotalunits(totalUnits);
				result.setStartprice(startPrice);
				
				//log.info( song + " " + singer +" "+ totalUnits+" "+startPrice );
				
				int bidSize = doc.select(".option").size()-1; //마지막은 합계
				//log.info(doc.select(".option").size());
				//log.info(doc.select("#page_auction > section.sec_auction > div.tbl_price > ul > li > div:nth-child(2) > ul > li:nth-child(1)").size());
				//#page_auction > section.sec_auction > div.tbl_price > ul > li > div:nth-child(2) > ul > li:nth-child(1)
				int totalBid = 0;
				for(int i=0;i<bidSize;i++) {
					boolean isLast = doc.select(".option").get(i).select("li:nth-child(3)").text().length() > 2?true:false;
					int[] temp= new int[3];
					
					String units_temp = doc.select(".option").get(i).select("li:nth-child(2)").text();
					String price_temp = doc.select(".option").get(i).select("li:nth-child(1)").text();
					temp[0] = Integer.parseInt( units_temp.replaceAll(",", "") );
					temp[1] = Integer.parseInt( price_temp.substring(0, price_temp.indexOf("캐")-1).replaceAll(",", "") );
					
					totalBid += temp[0];
					temp[2] = totalBid;
					bidList.add(temp);
					
					if(isLast) {
						break;
					}
				}//for
				
				if(bidList.size()>5) {
					int fixSize = bidList.size();
					for(int i=0; i<(fixSize-5); i++) {
						bidList.remove(0);
					}//for
				}//if
				
				boolean isFirst = true;
				for(int[] temp : bidList) {
					if(isFirst) {
						bidUnit += temp[0];
						bidPrice += temp[1];
						bidSum += temp[2];
						bidGap += totalUnits-temp[2];
						isFirst = false;
					}else {
						bidUnit += ","+temp[0];
						bidPrice += ","+temp[1];
						bidSum += ","+temp[2];
						bidGap += ","+(totalUnits-temp[2]);
					}
				}
				
				result.setBidprice(bidPrice);
				result.setBidunit(bidUnit);
				result.setBidsum(bidSum);
				result.setBidgap(bidGap);
				
				return result;
			}//getNowAuctionSongInfo
			//----------------------------------------------------------------------------------------------------------------------------------------------
}//class
