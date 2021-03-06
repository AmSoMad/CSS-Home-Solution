package org.sensor.service;

import java.util.List;

import org.sensor.domain.sensorBean;
import org.sensor.domain.LoginVO;
import org.sensor.domain.MemberVo;

public interface sensorService {
	
	public void GetSensor(sensorBean sb);
	
	public void insertRandom();
	
	public void DeleteSensorData_1Hour();
	
	public List<sensorBean> Getvalue();
	
	public List<sensorBean> GetChart();
	
	public List<sensorBean> GetWave();
	
	public List<sensorBean> GetEvent_OneHour();
	
	public List<sensorBean> GetEvent_All();
	
	public List<sensorBean> GetEvent_OneDay();

	public List<sensorBean> GetEvent_Chart();

	public void SensorTest1();
	
	public void SensorTest2();
	
	public void SensorTest3();
	
	public void SensorTest4();
	
	public List<sensorBean> MemberSelect_Admin();
	
	public List<LoginVO> login (LoginVO loginVO);
	
	public MemberVo MemberViewDetail(Object object);
	
	public boolean modifyMember(MemberVo memberVo);
	
	public boolean withdrawal(MemberVo memberVo);
	
	public void MemberInsert(MemberVo memberVo);
	
	public void inspection(Object object);
	
	public List<MemberVo> inspection_select();
	
	public void CheckDelete(MemberVo memberVo);
	
	public void inspection_update(MemberVo memberVo);

}
