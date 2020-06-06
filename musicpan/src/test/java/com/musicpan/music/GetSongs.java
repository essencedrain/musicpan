package com.musicpan.music;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class GetSongs {

	
	//----------------------------------------------------------------------------------------------------------------------------------------------
		// getSongInfo() : 곡id에 대한 곡 정보 가져옴
		//----------------------------------------------------------------------------------------------------------------------------------------------
		public List<String[]> getSongInfo(List<String> list) {
			/*
			 String[16]
			 0: idx
			 1: 곡제목
			 2: 가수명
			 3: 최근거래가
			 4: 옥션최저가
			 5: 수익률3
			 6: 수익률6
			 7: 수익률12
			 8: 수익률all
			 9: 저작권료 정보 제공 월 갯수
			 10: 공표일
			 11: spa
			 12: 사자호가
			 13: 사자수량
			 14: 팔자호가
			 15: 팔자수량
			 */
			List<String[]> result = new ArrayList<>();
			String url="https://www.musicow.com/song/";
			DecimalFormat fmt = new DecimalFormat("0.##");
			
			for(String i : list) {
				String[] data = new String[16];
				Document doc= null;
				
				//=========================================================================================================
				// 1
				//=========================================================================================================
				try {
					doc = Jsoup.connect(url+i).get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				//곡명, 가수명
				String song = doc.select(".information").select("strong").text();
				String singer = doc.select(".information").select(".artist").text();
				
				//최근거래가
				String recentPriceTemp = doc.select(".information").select(".txt_red").text();
				String recentPrice = recentPriceTemp.substring(0,recentPriceTemp.length()-3).replaceAll(",", ""); 
				
				//옥션최저가
				String auctionPriceTemp = doc.select(".information").select(".price").select("dd:nth-child(2)").text();
				String auctionPrice = auctionPriceTemp.substring(0,auctionPriceTemp.length()-3).replaceAll(",", "");
				//=========================================================================================================
				
				
				//=========================================================================================================
				// 2
				//=========================================================================================================
				String url2="https://www.musicow.com/api/song";
				
				try {
					doc = Jsoup.connect(url2).data("song_id", i).userAgent("Mozilla").post();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				String jsonData2 =doc.text();
				
				//JSON 파싱
				JsonObject tempSell = null;
				JsonObject tempBuy = null;
				JsonObject temp22 = null;
				JsonPrimitive jsonPrimitive2 = null;
				int unitsSell = 0;
				int priceSell = 0;
				int unitsBuy = 0;
				int priceBuy = 0;
				JsonElement element2 = JsonParser.parseString(jsonData2);
				JsonObject object2 = element2.getAsJsonObject();

				
					//팔자
					if(!object2.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("1").isJsonArray()) {
					
						tempSell = object2.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("1").getAsJsonObject();
						
						for(String k : tempSell.keySet()) {
							temp22 = tempSell.get(k).getAsJsonObject();
							break;
						}//for
						jsonPrimitive2 = temp22.getAsJsonPrimitive("cnt_units_market");
						unitsSell = jsonPrimitive2.getAsInt();
						jsonPrimitive2 = temp22.getAsJsonPrimitive("amount");
						priceSell = jsonPrimitive2.getAsInt();
					}//if
					
					
					//사자
					
					if(!object2.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("2").isJsonArray()) {
					
						tempBuy = object2.get("market_order").getAsJsonObject().get("type").getAsJsonObject().get("2").getAsJsonObject();
						
						for(String k : tempBuy.keySet()) {
							temp22 = tempBuy.get(k).getAsJsonObject();
							break;
						}//for
						jsonPrimitive2 = temp22.getAsJsonPrimitive("cnt_units_market");
						unitsBuy = jsonPrimitive2.getAsInt();
						jsonPrimitive2 = temp22.getAsJsonPrimitive("amount");
						priceBuy = jsonPrimitive2.getAsInt();
					}//if	
					
				//=========================================================================================================
				
				
				
				
				
				
				
				
				//=========================================================================================================
				// 3
				//=========================================================================================================
				try {
					doc = Jsoup.connect(url+i+"?tab=info").get();
				} catch (Exception e) {
					log.info("GetSongNums.getSongInfo().doc 에러 : " + e);
				}//try
				
				
				//공표일
				Elements releaseTemp2 = doc.select(".lst_bul > dl >dd");
				String release = releaseTemp2.text().substring(0, 4);
				
					
				
				// 저작권료 자료 획득
				int[] fees = new int[2];
				List<Integer> listTemp = new ArrayList<>();
				List<Integer> tongList = new ArrayList<>();
				boolean valueFlag = false; //저작권개시 플래그
				
				Elements script = doc.select("script");
				//log.info("!");
				//log.info(script.get(5).html());
				Element script2 = script.get(10);
				String jsonData = script2.html().substring(83,script2.html().length()-56);
				
				//JSON 파싱
					JsonElement element = JsonParser.parseString(jsonData);
					JsonObject object1 = element.getAsJsonObject();
					
					//2020.12->2015.1 거꾸로된 자료 일단 먼저 담기(
					for(String k : object1.keySet()) {
						JsonObject temp = object1.get(k).getAsJsonObject();
						for(String j : temp.keySet()) {
							JsonPrimitive jsonPrimitive = temp.getAsJsonPrimitive(j);
							int value = jsonPrimitive.getAsInt();
							listTemp.add(value);
						}//for j
					}//for k
					
					//이걸 뒤집고
					Collections.reverse(listTemp);
					
					
					//이걸로 저작권 첫 개시일부터 자료 담음
					for(int k : listTemp) {
						fees[0] += 1;
						if(k==0) {
							if(!valueFlag) { //저작권개시 안했으면
								fees[0] -= 1; //월 갯수에서 하나 까고 저장안함								
							}else {
								fees[1] += k;
								tongList.add(k);
							}//if
						}else {
							valueFlag = true;//저작권개시 플래그
							fees[1] += k;
							tongList.add(k);
						}
					}//for k
					
					double avg = 0;
					if(fees[0]!=0) {
						avg = fees[1]/fees[0];
					}
					
					double dev = 0; //편차
					double devSqvSum = 0; //편차제곱합
					double var = 0; //분산
					double std = 0; // 표준편차
					
					
					for(int k=0; k<tongList.size();k++) {
						dev = (tongList.get(k)-avg);
						devSqvSum += Math.pow(dev, 2); // 편차제곱합에 누적시킴
					}
					
					var = devSqvSum / tongList.size(); // 분산 도출 
					std = Math.sqrt(var); // 표준편차 도출
					
					double spa = 9999;
					if(fees[0]!=0) {
						spa = std / avg; //SPA : 규봉이가 제안한 표준편차 나누기 평균이래
					}
						
				//최근수익률3,6,12,all
				double[] rawProfit = new double[4];
				double tempRawProfit =0;
				
				if(priceSell != 0) { //최저가가 0이 아니어야됨
					//다시 뒤집어서, 아래 수익률 계산
					Collections.reverse(tongList);
					
					for(int k=0; k<tongList.size(); k++) {
						
						tempRawProfit += tongList.get(k);
						if(k==2) {
							rawProfit[0] = (tempRawProfit/3*12)/priceSell*100;
						}else if(k==5) {
							rawProfit[1] = (tempRawProfit/6*12)/priceSell*100;
						}else if(k==11) {
							rawProfit[2] = (tempRawProfit/12*12)/priceSell*100;
						}//if
					}//for
					if(fees[0]!=0) {
						rawProfit[3] = (tempRawProfit/fees[0]*12)/priceSell*100;
					}else {
						rawProfit[3] = 0;
					}
				}else {
					rawProfit[0] = 0;
					rawProfit[1] = 0;
					rawProfit[2] = 0;
					rawProfit[3] = 0;
				}//if
				//=========================================================================================================
				
				
				
				
					data[0] = i;
					data[1] = song;
					data[2] = singer;
					data[3] = recentPrice;
					data[4] = auctionPrice;
					data[5] = fmt.format(rawProfit[0]);
					data[6] = fmt.format(rawProfit[1]);
					data[7] = fmt.format(rawProfit[2]);
					data[8] = fmt.format(rawProfit[3]);
					data[9] = fees[0]+"";
					data[10] = release;
					data[11] = fmt.format(spa);
					data[12] = priceBuy+"";
					data[13] = unitsBuy+"";
					data[14] = priceSell+"";
					data[15] = unitsSell+"";
					result.add(data);
				
				

			}//for
			
			return result;
		}
		//----------------------------------------------------------------------------------------------------------------------------------------------
		
		
		//----------------------------------------------------------------------------------------------------------------------------------------------
		// getList() : 곡idx 가져옴
		//----------------------------------------------------------------------------------------------------------------------------------------------
		public List<String> getList() {
			List<String> songNums = new ArrayList<String>();
			String url="https://www.musicow.com/auctions?tab=market&keyword=&sortorder=&page=";

			try {
				int page=1;
				boolean flag = true;
				
				while(flag) {
					
					Document doc = Jsoup.connect(url+page).get();
					
					Elements temp = doc.select(".user_buy").select("li").select("a");
					
					//페이지 노래 갯수 (18개가 wjdtkd)
					//log.info(temp.size());
					
					if(temp.size() < 18) {
						flag = false;
					}//if
					
					String[] songNum = new String[temp.size()];
					
					for (int i = 0; i < temp.size(); i++) {
					    songNum[i] = temp.get(i).attr("href").substring(6).trim();
					    songNums.add(songNum[i]);
					}//for
					page += 1;
					
				}//while
				
				
			} catch (Exception e) {
				log.info("GetSongNums.getList() 에러 : " + e);
			}
			
			return songNums;
	 
		}
		//----------------------------------------------------------------------------------------------------------------------------------------------
	
	
}//class
