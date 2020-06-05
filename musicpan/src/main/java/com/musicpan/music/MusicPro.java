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
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

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
			// getAuctionInfo(String idx) : 기본 정보
			// auctionInfo[i] = auctionUnits[i]+","+auctionStart[i]+","+auctionLowPrice[i]+","+auctionAvgPrice[i];
			//  옥션정보[옥션횟수] = 수량,시작가,낙찰가,평균가
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public String[] getAuctionInfo(String idx) {
				Document doc= null;
				String url="https://www.musicow.com/song/";
				Elements releaseTemp = null;
				
				try {
					doc = Jsoup.connect(url+idx+"?tab=info").get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				//옥션기록
				//String[횟수]
				//String[0] = 수량,시작가,낙찰가,평균가
				//옥션횟수
				//int auctionCnt = doc.select(".detail_zone .lst_numb_card").size();
				//2=1회 4=2회 6=3회
				
				//좌상 옥션 수량
				releaseTemp = doc.select(".lst_numb_card:nth-child(1) dl dd:nth-child(2)");
				String[] auctionUnits = releaseTemp.text().trim().replaceAll(" ", "").replaceAll(",", "").trim().split("주");
				//log.info(releaseTemp.text());
				
				//좌하 옥션 시작가
				releaseTemp = doc.select(".lst_numb_card:nth-child(1) dl dd:nth-child(4)");
				String[] auctionStart = releaseTemp.text().trim().replaceAll(" ", "").replaceAll(",", "").trim().split("캐쉬");
				//log.info(releaseTemp.text());
				
				//우상 최저 낙찰가
				releaseTemp = doc.select(".lst_numb_card:nth-child(2) dl dd:nth-child(2)");
				String[] auctionLowPrice= releaseTemp.text().trim().replaceAll(" ", "").replaceAll(",", "").trim().split("캐쉬");
				//log.info(releaseTemp.text());
				
				
				//우하 평균 낙찰가
				releaseTemp = doc.select(".lst_numb_card:nth-child(2) dl dd:nth-child(4)");
				String[] auctionAvgPrice= releaseTemp.text().trim().replaceAll(" ", "").replaceAll(",", "").trim().split("캐쉬");
				//log.info(releaseTemp.text());
				
				String[] auctionInfo = new String[auctionUnits.length];
				for(int i=0; i<auctionUnits.length;i++) {
					auctionInfo[i] = auctionUnits[i]+","+auctionStart[i]+","+auctionLowPrice[i]+","+auctionAvgPrice[i];
				}//for
				
				return auctionInfo;
				
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getFeeInfo(String idx) : 저작권료 정보
			/*
			  
			  feeList 는 과거 저작권료 정보
			  String[연월, 저작권료] 로 가다가
			  
			  마지막은 최근12개월 저작권료 구성
			  String[연월, 방송,전송,복제, 공연,해외,기타]
			  
			  으로 구성되어 있음
			  
			 */
			//----------------------------------------------------------------------------------------------------------------------------------------------
			public List<String[]> getFeeInfo(String idx) {
			
				Document doc= null;
				String url="https://www.musicow.com/song/";
				Elements releaseTemp = null;
				
				try {
					doc = Jsoup.connect(url+idx+"?tab=info").get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				
				
				//----------------------------------------------
				//최근 12개월 저작권료 (1주 기준) 구성
				//feeCompo[연월(아래추가),방송,전송,복제, 공연,해외,기타]
				//----------------------------------------------
				String[] feeCompo = new String[7];
				for(int i=1; i<7; i++) {
					releaseTemp = doc.select(".tbl_flex > dl:nth-child("+i+") > dd");
					feeCompo[i] = releaseTemp.text();
					feeCompo[i] = feeCompo[i].substring(0,feeCompo[i].indexOf("원")).replaceAll(",", "");
				}//for
				//----------------------------------------------
				
				
				//----------------------------------------------
				// 저작권료 자료 획득
				// List<String[연월, 저작권료]> feeList
				//----------------------------------------------
				List<String[]> feeList = new ArrayList<>();
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
						
						String[] tempValue = new String[2];
						tempValue[0] = k+""+j;
						tempValue[1] = jsonPrimitive.getAsString();
						feeList.add(tempValue);
					}//for j
				}//for k
				
				//뒤집음 옛날->최신
				Collections.reverse(feeList);
				//----------------------------------------------
				feeCompo[0] = feeList.get(feeList.size()-1)[0];
				feeList.add(feeCompo);
				
				
				return feeList;
			}
			//----------------------------------------------------------------------------------------------------------------------------------------------
			
			
			
			//----------------------------------------------------------------------------------------------------------------------------------------------
			// getRecentInfo(String idx) : 시세
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
			 	release		공표일
			 	composer	작곡가
			 	lyricist	작사가
			 	arranger	편곡가(null가능)
				copyright	저작권1, 인접권0
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
				Elements releaseTemp = null;
				String release =null;
				String singer =null;
				String composer = null;
				String lyricist = null;
				String arranger = null;
				String copyright = null;
				String stockCnt = null;
				String secRight = null;
				
				//----------------------------------------------
				//공표일
				releaseTemp = doc.select(".lst_bul > dl:nth-child(1) > dd");
				release = releaseTemp.text();
				//----------------------------------------------
				//가수
				releaseTemp = doc.select(".lst_bul > dl:nth-child(2) > dd");
				singer = releaseTemp.text();
				//----------------------------------------------
				//작곡가
				releaseTemp = doc.select(".lst_bul > dl:nth-child(3) > dd");
				composer = releaseTemp.text();
				//----------------------------------------------
				//작사가
				releaseTemp = doc.select(".lst_bul > dl:nth-child(4) > dd");
				lyricist =releaseTemp.text();
				//----------------------------------------------
				result.put("release", release);
				result.put("singer", singer);
				result.put("composer", composer);
				result.put("lyricist", lyricist);
				
				
				
				if(songFlag==11) {
					//편곡가
					releaseTemp = doc.select(".lst_bul > dl:nth-child(5) > dd");
					arranger = releaseTemp.text();
				}else {
					//저작권1 인접권0
					releaseTemp = doc.select("#wrap > div.contans > div > div > div.div_half > section > div.box_gray > div > dl:nth-child(5) > dd");
					copyright = releaseTemp.text().trim();
					copyright = copyright.substring(0,3);
					copyright = copyright.equals("원작자") ? "1" : "0";
				}
				
				if(songFlag==11) {
					//저작권1 인접권0
					releaseTemp = doc.select("#wrap > div.contans > div > div > div.div_half > section > div.box_gray > div > dl:nth-child(6) > dd");
					copyright = releaseTemp.text().trim();
					copyright = copyright.substring(0,3);
					copyright = copyright.equals("원작자") ? "1" : "0";
				}
				result.put("arranger", arranger);
				result.put("copyright", copyright);
				
				
				
				
				if(songFlag==11) {
					//지분수
					releaseTemp = doc.select("#wrap > div.contans > div > div > div.div_half > section > div.box_gray > div > dl:nth-child(10) > dd > p:nth-child(1)");
					stockCnt = releaseTemp.text().trim();
					stockCnt = stockCnt.substring(stockCnt.indexOf("/")+1).replaceAll(",", "");
					//----------------------------------------------
					//2차저작물작성권(1,0)
					releaseTemp = doc.select("#wrap > div.contans > div > div > div.div_half > section > div.box_gray > div > dl:nth-child(10) > dd > p:nth-child(2)");
					secRight = releaseTemp.text().trim();
					secRight = secRight.substring(secRight.indexOf("(")+1,secRight.indexOf("(")+2);
					secRight = secRight.equals("O") ? "1" : "0";
				}else{
					//지분수
					releaseTemp = doc.select("#wrap > div.contans > div > div > div.div_half > section > div.box_gray > div > dl:nth-child(9) > dd > p:nth-child(1)");
					stockCnt = releaseTemp.text().trim();
					stockCnt = stockCnt.substring(stockCnt.indexOf("/")+1).replaceAll(",", "");
					//----------------------------------------------
					//2차저작물작성권(1,0)
					releaseTemp = doc.select("#wrap > div.contans > div > div > div.div_half > section > div.box_gray > div > dl:nth-child(9) > dd > p:nth-child(2)");
					secRight = releaseTemp.text().trim();
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
			// recentPrice(String), recentPriceTime(String), buy(List<String[갯수, 가격]>), sell(List<String[갯수, 가격]>)
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
				//List<String[갯수, 가격]>
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
				//List<String[갯수, 가격]>
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
			
			
}//class
