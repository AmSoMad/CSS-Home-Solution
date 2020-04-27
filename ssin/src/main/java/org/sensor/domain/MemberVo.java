package org.sensor.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVo {
	
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String address;
	private String email;
	private Date time;
	private int cno;
	private String contents;
	private String asresult;
	
	
}
