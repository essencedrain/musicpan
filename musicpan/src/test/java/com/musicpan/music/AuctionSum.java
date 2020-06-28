package com.musicpan.music;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class AuctionSum {
	
	@Test
	public void test() {
		getNowAuctionIdx();
	}//test
	
	
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
	public Map<String, Object> getNowAuctionSongInfo(int idx) {
		
		Document doc= null;
		String url = "https://www.musicow.com/auction/"+idx;
		
		Map<String, Object> result = new HashMap<>();
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
		
		result.put("song", song);
		result.put("singer", singer);
		result.put("totalUnits", totalUnits);
		result.put("startPrice", startPrice);
		
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
		
		//result.put("bidList", bidList);
		result.put("bidPrice", bidPrice);
		result.put("bidUnit", bidUnit);
		result.put("bidSum", bidSum);
		result.put("bidGap", bidGap);
		
		return result;
	}//getNowAuctionSongInfo
	//----------------------------------------------------------------------------------------------------------------------------------------------
	
	
}//AuctionSum
