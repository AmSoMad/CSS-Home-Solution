package org.sensor.service;



import java.util.List;

import org.sensor.domain.sensorBean;
import org.sensor.mapper.SensorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sensor.domain.MemberVo;
import org.sensor.domain.LoginVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class sensorServiceImpl implements sensorService {

	@Setter(onMethod_= @Autowired)
	private SensorMapper mapper;
	
	@Override
	public void GetSensor(sensorBean sb) {
		log.info(sb + "값 들어옴");
		mapper.insert(sb);

	}
	
	@Override
	public void insertRandom() {
		mapper.insertRandom();

	}
	
	@Override
	public void DeleteSensorData_1Hour() {
		mapper.DeleteSensorData_1Hour();

	}
	
	@Override
	public List<sensorBean> Getvalue(){
		return mapper.GetValue();
	}
	
	@Override
	public List<sensorBean> GetChart(){
		return mapper.GetChart();
	}
	
	@Override
	public List<sensorBean> GetWave(){
		return mapper.GetWave();
	}
	
	@Override
	public List<sensorBean> GetEvent_OneHour(){
		return mapper.GetEvent_OneHour();
	}
	
	@Override
	public List<sensorBean> GetEvent_All(){
		return mapper.GetEvent_All();
	}
	
	@Override
	public List<sensorBean> GetEvent_OneDay(){
		return mapper.GetEvent_OneDay();
	}
	
	@Override
	public List<sensorBean> GetEvent_Chart(){
		return mapper.GetEvent_Chart();
	}
	
	@Override
	public void SensorTest1() {
		mapper.SensorTest1();

	}
	
	@Override
	public void SensorTest2() {
		mapper.SensorTest2();

	}
	
	@Override
	public void SensorTest3() {
		mapper.SensorTest3();

	}
	
	@Override
	public void SensorTest4() {
		mapper.SensorTest4();

	}
	
	@Override
	public List<sensorBean> MemberSelect_Admin(){
		return mapper.MemberSelect_Admin();
	}
	
	@Override
	public List<LoginVO> login(LoginVO loginVO) {
		log.info("로그인"+loginVO);
		return 	mapper.login(loginVO);	
	}
		
	
	@Override
	public MemberVo MemberViewDetail(Object object) {
	return mapper.MemberViewDetail(object);	
	}
	
	@Override
	public boolean modifyMember(MemberVo memberVo) {
	
		return mapper.modifyMember(memberVo)==1;
	}
	
	@Override
	public boolean withdrawal(MemberVo memberVo) {
		return mapper.withdrawal(memberVo)==1;
	}

	@Override
	public void MemberInsert(MemberVo memberVo) {
		mapper.MemberInsert(memberVo);
		
	}

	@Override
	public void inspection(Object object) {
		mapper.inspection(object);
		
	}

	@Override
	public List<MemberVo> inspection_select() {
		
		return mapper.inspection_select();
	}

	@Override
	public void CheckDelete(MemberVo memberVo) {
		mapper.CheckDelete(memberVo);
		
	}

	@Override
	public void inspection_update(MemberVo memberVo) {
		mapper.inspection_update(memberVo);
		
	}
	
	
}
