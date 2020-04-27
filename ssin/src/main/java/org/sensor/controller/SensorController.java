package org.sensor.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.sensor.domain.sensorBean;
import org.sensor.service.sensorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/senser/*")
@Log4j
@AllArgsConstructor
public class SensorController {
	
	private sensorService ss;
	
	@GetMapping("/SampleData")
	public String SampleData() {
		//샘플데이터 전송
		for(int i  = 0; i < 10; i++) {
			ss.insertRandom();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		return "S_result";
	}
	
	@GetMapping("/ssin")
	public String ssin(sensorBean sb) {
		//System.out.println("------------"+sb+"---------------");
		ss.GetSensor(sb);
		return "S_result";
	}
	
	@GetMapping("/index2")
	public String index2() {
		
		return "index2";
	}
	
	
		
	@RequestMapping("/index")
	public String index(Model model) {
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		System.out.println("계산들어감");
		List<sensorBean> sensorBeans = ss.GetEvent_All();
		//전체센서값 빈도조회
		for(int i = 0; i < sensorBeans.size(); i++) {
			if(((int)sensorBeans.get(i).getMq2()) > 700) {
				count1 ++;
			}
			if(((int)sensorBeans.get(i).getMq7()) > 800) {
				count2 ++;
			}
			if(((int)sensorBeans.get(i).getVi()) > 100) {
				count3 ++;
			}
			if(((int)sensorBeans.get(i).getWave()) > 1000) {
				count4 ++;
			}
			
		}
		model.addAttribute("count_Add_1",count1);
		model.addAttribute("count_Add_2",count2);
		model.addAttribute("count_Add_3",count3);
		model.addAttribute("count_Add_4",count4);
		//전체센서값 빈도 전송
		//초기화
		count1 = 0; count2 =0; count3 = 0; count4 = 0;
		//최근 1시간 센서값 조회
		sensorBeans = ss.GetEvent_OneHour();
		for(int i = 0; i < sensorBeans.size(); i++) {
			if(i > 0) {
				if(sensorBeans.get(i).getMq2() == sensorBeans.get(i-1).getMq2() && 
						(sensorBeans.get(i).getMq7() == sensorBeans.get(i-1).getMq7()) && 
							(sensorBeans.get(i).getVi() == sensorBeans.get(i-1).getVi()) &&
							(sensorBeans.get(i).getWave() == sensorBeans.get(i-1).getWave())) {
					sensorBeans.remove(i);
					System.out.println(i+"번째삭제됌");
					//센서 중복값 삭제
				}
			}
		}
		//정리된(축소시킨) 1시간데이터 전송
		model.addAttribute("OneHour",sensorBeans);
		for(int i = 0; i < sensorBeans.size(); i++) {
			if(((int)sensorBeans.get(i).getMq2()) > 700) {
				count1 ++;
			}
			if(((int)sensorBeans.get(i).getMq7()) > 800) {
				count2 ++;
			}
			if(((int)sensorBeans.get(i).getVi()) > 100) {
				count3 ++;
			}
			if(((int)sensorBeans.get(i).getWave()) > 1000) {
				count4 ++;
			}
			
		}
		//한시간 빈도값 축적
		model.addAttribute("count_Add_5",count1);
		model.addAttribute("count_Add_6",count2);
		model.addAttribute("count_Add_7",count3);
		model.addAttribute("count_Add_8",count4);
		//초기화
		count1 = 0; count2 =0; count3 = 0; count4 = 0;
		//오늘기준 빈도조회
		sensorBeans = ss.GetEvent_OneDay();
		for(int i = 0; i < sensorBeans.size(); i++) {
			if(((int)sensorBeans.get(i).getMq2()) > 700) {
				count1 ++;
			}
			if(((int)sensorBeans.get(i).getMq7()) > 800) {
				count2 ++;
			}
			if(((int)sensorBeans.get(i).getVi()) > 100) {
				count3 ++;
			}
			if(((int)sensorBeans.get(i).getWave()) > 1000) {
				count4 ++;
			}
			
		}
		System.out.println("계산끝남");
		model.addAttribute("count_Day1",count1);
		model.addAttribute("count_Day2",count2);
		model.addAttribute("count_Day3",count3);
		model.addAttribute("count_Day4",count4);
		return "index";
	}
	
	
	@RequestMapping("/Test1")
	public String test1(Model model) {
		//Model model,sensorBean sb
		//model.addAttribute(service.Getvalue(sb));
		List<sensorBean> sensorBeans = ss.GetEvent_OneHour();
		for(int i = 0; i < sensorBeans.size(); i++) {
			if(i > 0) {
				if(sensorBeans.get(i).getMq2() == sensorBeans.get(i-1).getMq2() && 
						(sensorBeans.get(i).getMq7() == sensorBeans.get(i-1).getMq7()) && 
							(sensorBeans.get(i).getVi() == sensorBeans.get(i-1).getVi()) &&
							(sensorBeans.get(i).getWave() == sensorBeans.get(i-1).getWave())) {
					sensorBeans.remove(i);
					System.out.println(i+"번째삭제됌");
					
				}
			}
		}
		model.addAttribute("OneHour",sensorBeans);
		return "Test1";
	}
	
	@RequestMapping("/ViewDetails.bo")
	public String ViewDelay() {
		
		return "sensor/ViewDelay";
	}
	
	@RequestMapping("/ViewDetails1.bo")
	public String mq2(Model model) {
		int count1 = 0;
		int count2 = 0;
		int count3 = 0;
		int count4 = 0;
		List<sensorBean> sensorBeans = ss.GetEvent_Chart();
		model.addAttribute("chartTable_Data",sensorBeans);
		for(int i = 0; i < sensorBeans.size(); i++) {
			if(((int)sensorBeans.get(i).getMq2()) > 700) {
				count1 ++;
			}
			if(((int)sensorBeans.get(i).getMq7()) > 800) {
				count2 ++;
			}
			if(((int)sensorBeans.get(i).getVi()) > 100) {
				count3 ++;
			}
			if(((int)sensorBeans.get(i).getWave()) > 1000) {
				count4 ++;
			}
			
		}
		model.addAttribute("count_Add_5",count1);
		model.addAttribute("count_Add_6",count2);
		model.addAttribute("count_Add_7",count3);
		model.addAttribute("count_Add_8",count4);
		
		return "sensor/ViewDetails";
	}
	
	@RequestMapping("/Delete.bo")
	public String DeleteBo() {
		System.out.println("1시간전 데이터 삭제합니다.");
		ss.DeleteSensorData_1Hour();
		return "redirect:ViewDetails.bo";
	}
	
	//7.로그아웃
	@GetMapping("/logout")
    public String logout(HttpSession httpSession,RedirectAttributes rttr) {

		Object obj = httpSession.getAttribute("user"); 
		System.out.println(obj);
		if (obj != null) {
			httpSession.removeAttribute("user");
			httpSession.invalidate();
			rttr.addFlashAttribute("msg","logout");
		}
		return "redirect:/";
    }
	
	
	
}
