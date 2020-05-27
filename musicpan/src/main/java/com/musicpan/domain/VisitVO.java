package com.musicpan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VisitVO {
	private long visit_no;
    private String visit_ip;
    private Date visit_time;
    private String visit_refer;
    private String visit_agent;
}
