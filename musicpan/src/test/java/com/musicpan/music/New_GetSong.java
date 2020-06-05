package com.musicpan.music;

import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.musicpan.persistence.DataSourceTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class New_GetSong {

	@Setter(onMethod_ = { @Autowired })
	private DataSource dataSource;
	
	
	@Test
	public void getSongInfo() {
		Document doc= null;
		String url="https://www.musicow.com/song/712";
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			System.out.println("GetSongNums.getSongInfo().doc 에러 : " + e);
		}//try
		
		//곡명, 가수명
		String song = doc.select(".information").select("strong").text();
		String singer = doc.select(".information").select(".artist").text();
		
		//최근거래가
		String recentPriceTemp = doc.select("#page_market > div.song_header > div > dl > dd.txt_red").text();
		String recentPrice = recentPriceTemp.substring(0,recentPriceTemp.length()-3).replaceAll(",", ""); 
		
		//옥션최저가
		String auctionPriceTemp = doc.select("#page_market > div.song_header > div > dl > dd:nth-child(2)").text();
		String auctionPrice = auctionPriceTemp.substring(0,auctionPriceTemp.length()-3).replaceAll(",", "");
		
		//log.info(song +" // "+ singer +" // "+ recentPrice +" // "+ auctionPrice);
	}
	
		/*
		Document doc= null;
		
		String url2="https://www.musicow.com/api/song";
		
		try {
			doc = Jsoup.connect(url2).data("song_id", "712").userAgent("Mozilla").post();
		} catch (Exception e) {
			System.out.println("GetSongNums.getSongInfo().doc 에러 : " + e);
		}//try
		
		String jsonData =doc.text();
		
		System.out.println(jsonData);
		
		
		
		Document doc= null;
		String url="https://www.musicow.com/song/712";
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			System.out.println("GetSongNums.getSongInfo().doc 에러 : " + e);
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
		
		System.out.println(song +" // "+ singer +" // "+ recentPrice +" // "+ auctionPrice);
		 */
		
	
}//class
