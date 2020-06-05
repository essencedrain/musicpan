package com.musicpan.music;

import java.util.HashSet;
import java.util.Map;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MuziMain {

	
	@Setter(onMethod_ = { @Autowired })
	private DataSource ds;
	
	
	@Test
	public void mainTest() {
		
		Map<String,String> result2 = null;

		MusicPro test = new MusicPro();
		HashSet<String> result = test.getList();
		
		
		for(String temp : result) {
			result2 = test.getBasicInfo(temp);
			String temp2 = "";
			for(String temp3 : result2.keySet()) {
				temp2 += " "+temp3 +" // "+result2.get(temp3);
			}
			System.out.println(temp2);
		}
		
		/*
		String sql = "insert into test_songs values(?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?,?,?) ON DUPLICATE KEY UPDATE price=?, auctionPrice=?, profit3=?, profit6=?, profit12=?, profitAll=?, feeMonths=?, spa=?, lastUpdate=now(), price_buy=?, units_buy=?, price_sell=?, units_sell=?";

		for(String[] i : result) {
			
			
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				
		        con = ds.getConnection();
		        pstmt = con.prepareStatement(sql);
		        
		        pstmt.setInt(1, Integer.parseInt(i[0])); //idx
				pstmt.setString(2, i[1]); // 곡제목
				pstmt.setString(3, i[2]); // 가수명
				pstmt.setInt(4, Integer.parseInt(i[3])); //최근거래가
				pstmt.setInt(5, Integer.parseInt(i[4])); //옥션최저가
				pstmt.setFloat(6, Float.parseFloat(i[5])); //수익률3
				pstmt.setFloat(7, Float.parseFloat(i[6])); //수익률6
				pstmt.setFloat(8, Float.parseFloat(i[7])); //수익률12
				pstmt.setFloat(9, Float.parseFloat(i[8])); //수익률All
				
				pstmt.setInt(10, Integer.parseInt(i[9])); //저작권료 정보 제공 월 갯수
				pstmt.setInt(11, Integer.parseInt(i[10])); //공표년
				pstmt.setFloat(12, Float.parseFloat(i[11])); // spa
				pstmt.setInt(13, Integer.parseInt(i[12])); //사자호가 **
				pstmt.setInt(14, Integer.parseInt(i[13])); //사자수량 **
				pstmt.setInt(15, Integer.parseInt(i[14])); //팔자호가 **
				pstmt.setInt(16, Integer.parseInt(i[15])); //팔자수량 **
				
				//중복일 경우
				pstmt.setInt(17, Integer.parseInt(i[3])); //최근거래가
				pstmt.setInt(18, Integer.parseInt(i[4])); //옥션최저가
				pstmt.setFloat(19, Float.parseFloat(i[5])); //수익률3
				pstmt.setFloat(20, Float.parseFloat(i[6])); //수익률6
				pstmt.setFloat(21, Float.parseFloat(i[7])); //수익률12
				pstmt.setFloat(22, Float.parseFloat(i[8])); //수익률All
				pstmt.setInt(23, Integer.parseInt(i[9])); //저작권료 정보 제공 월 갯수
				pstmt.setFloat(24, Float.parseFloat(i[11])); // spa
				pstmt.setInt(25, Integer.parseInt(i[12])); //사자호가 **
				pstmt.setInt(26, Integer.parseInt(i[13])); //사자수량 **
				pstmt.setInt(27, Integer.parseInt(i[14])); //팔자호가 **
				pstmt.setInt(28, Integer.parseInt(i[15])); //팔자수량 **
				
				pstmt.executeUpdate();
				
				pstmt.close();
				
			}catch (Exception e) {
				log.info("DB 연결 실패"+e);
			}finally {
				try {
					 if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
					 if(con != null) { try { con.close();  } catch(Exception e) {} }
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//for
		*/
		
	}//mainTest()
	
	
}//class
