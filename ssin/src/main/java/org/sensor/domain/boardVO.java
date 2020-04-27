package org.sensor.domain;

import java.util.Date;

import lombok.Data;

@Data
public class boardVO {
	private int bno;
	private String id;
	private String title;
	private String contents;
	private Date time;
	private String rev;
	private Date rev_time;
}
