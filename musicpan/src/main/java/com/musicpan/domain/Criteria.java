package com.musicpan.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	private String b_name; //게시판이름
	private String b_name2; //게시판 한글이름
	
	private int pageNum;
	private int amount;
	private int limitNum; //셀렉트쿼리 limit 첫번째에 넣을 값
	
	private long bno;
	
	private String type;
	private String keyword;
	
	
	
	public Criteria() {
		this(1, 20);
	}
	
	

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.limitNum = (pageNum-1)*amount;
	}

	
	
	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");
	}

	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
	
	
}//class
