package org.sensor.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.sensor.domain.MemberVo;
import org.sensor.domain.sensorBean;
import org.sensor.service.sensorService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;




@Log4j
@RestController
@AllArgsConstructor
public class AjexController {
	private sensorService ss;
	
	
	@GetMapping("/GetSensor_1")
	public String senser1() {
		//System.out.println(ss.Getvalue().get(0));
		//ss.Getvalue().get(0).getMq1();
		//int random = (int)(Math.random()*100);
		//String str = String.valueOf(random);
		//System.out.println(str);
		String str = String.valueOf(ss.Getvalue().get(0).getMq2());
		return str;
	}
	
	@GetMapping("/GetSensor_2")
	public String senser2() {
		String str = String.valueOf(ss.Getvalue().get(0).getMq7());
		return str;
	}
	
	@GetMapping("/GetSensor_3")
	public String senser3() {
		String str = String.valueOf(ss.Getvalue().get(0).getVi());
		return str;
	}
	
	@GetMapping("/GetSensor_4")
	public String senser4() {
		String str = String.valueOf(ss.Getvalue().get(0).getWave());
		return str;
	}
	
	@PostMapping("/GetSensor_5")
	public ArrayList<sensorBean> senser5() {
		return (ArrayList<sensorBean>) ss.GetEvent_All();
	}
	
	@PostMapping("/GetSensor_6")
	public ArrayList<sensorBean> senser6() {
		System.out.println(ss.GetEvent_Chart());
		return (ArrayList<sensorBean>) ss.GetEvent_Chart(); 
	}
	
	@PostMapping("/SensorTest1")
	public String SensorTest1() {
		for(int i = 0; i < 5; i++) {
			ss.SensorTest1();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "테스트1작동";
	}
	@PostMapping("/SensorTest2")
	public String SensorTest2() {
		for(int i = 0; i < 5; i++) {
			ss.SensorTest2();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "테스트2작동";
	}
	@PostMapping("/SensorTest3")
	public String SensorTest3() {
		for(int i = 0; i < 5; i++) {
			ss.SensorTest3();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "테스트3작동";
	}
	@PostMapping("/SensorTest4")
	public String SensorTest4() {
		for(int i = 0; i < 5; i++) {
			ss.SensorTest4();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "테스트4작동";
	}
	
	@GetMapping("/inspection")
	public String inspection(HttpSession httpSession,MemberVo memberVo) {
		//어렵지? 이건?세션값(아이디)를 오브젝트에넣고~
		//그 오브젝트에담긴 아이디로 정보를찾고~
		//그리고 memberVo는 ajax로 보낼때 URL에 ?contents=prompt값을 같이날려줘서 바로 들어갔어.
		//membervo에는 contents만 들어있어 나머지는 다 널이고
		//String에 담고 vo에 오브젝트 넣어주면 컨텐츠만 널이야.
		//String에 담은걸 셋해주면 다완성되지. 그걸 넘긴다.
		Object Object = httpSession.getAttribute("user");
		System.out.println(Object+"1");
		Object = ss.MemberViewDetail(Object);
		System.out.println(Object+"2");
		String contents = memberVo.getContents();
		memberVo = (MemberVo) Object;
		memberVo.setContents(contents);
		System.out.println(memberVo);
		try {
			ss.inspection(memberVo);
			return "점검요청이 되었습니다.";
		} catch (Exception e) {
			return "이미 점검요청하였습니다.";
		}
		
	}
	@GetMapping("/inspection1")
	public String inspection1(MemberVo memberVo) {
	
		System.out.println(memberVo);
		try {
			
			return "점검요청이 되었습니다.";
		} catch (Exception e) {
			return "이미 점검요청하였습니다.";
		}
		
	}
	
	
//	
}
