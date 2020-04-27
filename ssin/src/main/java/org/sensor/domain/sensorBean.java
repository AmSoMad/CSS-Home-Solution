package org.sensor.domain;




import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.Data;

@Data
public class sensorBean {
	private long mq2;
	private long mq7;
	private long vi;
	private long wave;
	
	private int sno;
	@Autowired
	private Date time;
	
	

}