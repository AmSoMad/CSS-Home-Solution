package org.sensor.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.sensor.domain.MemberVo;
import org.sensor.service.sensorService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.sensor.domain.MemberVo;
import org.sensor.domain.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor
public class MemberController {
		private sensorService ss;
		
		// 1.회원가입
		@RequestMapping("/join")
		public void join() throws Exception {
		}
		
		
		// 2.회원가입페이지
		@PostMapping("/join1")
		public String join1(MemberVo memberVo, RedirectAttributes redirectAttributes) throws Exception {
			//회원정보보기에서 정보를 가져오듯. 회원가입시 넣은 ID와 PW를 쿼리에서 select 해서 값이 없으면 가입처리 (if != null) 이건 값이있다.
			//그럴경우 가입실패 -> 이미 중복된 아이디. 로 처리.
			//else 일경우 같은정보가 없는것으로 가입처리진행
			//String hashedPw = BCrypt.hashpw(memberVO.getPw(), BCrypt.gensalt());
			//memberVO.setPw(hashedPw);
			System.out.println(memberVo);
			ss.MemberInsert(memberVo);
			redirectAttributes.addFlashAttribute("msg", "join");
			log.info("***************회원가입  **************");
			
			return "redirect:/";

		}
		
		
		
		// 4.로그인구현
		@PostMapping("/login1")
		public String login1(Model model, LoginVO loginVO, HttpSession httpSession, RedirectAttributes redirectAttributes) throws Exception {
			System.out.println(ss.login(loginVO));
			
			if(ss.login(loginVO).get(0).getId().equals("admin") && ss.login(loginVO).get(0).getPw().equals("456456")) {
				return "redirect:/member/admin";  //
			}
			
			
			if (ss.login(loginVO) != null) {
				System.out.println("1번");
				if(ss.login(loginVO).size() == 0) {
					redirectAttributes.addFlashAttribute("msg", "fail");
					System.out.println("2번");
					return "redirect:/";
				}else {
					if ((ss.login(loginVO).get(0).getId().equals(loginVO.getId()) && ss.login(loginVO).get(0).getPw().equals(loginVO.getPw()))) {
						System.out.println("3번");
						redirectAttributes.addFlashAttribute("msg", "success");
						model.addAttribute("user", loginVO);
						httpSession.setAttribute("user", loginVO.getId());
						System.out.println("4번");
						return "redirect:/senser/index2";
					} else {
						redirectAttributes.addFlashAttribute("msg", "fail");
						System.out.println("5번");
						return "redirect:/";
					}
				}
			}else {
				redirectAttributes.addFlashAttribute("msg", "fail");
				System.out.println("6번");
			}
			return "/member/login1";
		}
		
		
		@RequestMapping("/senser/index")
		public String sensorIndex1() {
			return "redirect:/senser/index";
		}
		//5. 회원정보보기
	    @GetMapping("/memberviewdetail") 
	    public String memberviewdetail (HttpSession httpSession,Model model ) { 
	    	Object object = httpSession.getAttribute("user"); // user��
	    	System.out.println(object);
	        MemberVo memberVo = ss.MemberViewDetail(object);
	        model.addAttribute(memberVo);
	  
	        return "/member/memberviewdetail"; 
	  }
		
	  //6.회원정보 수정하기 / 회원정보 탈퇴하기 
			@PostMapping("/info")
			public String info(MemberVo memberVo, HttpSession httpSession,Model model, @RequestParam("modify")String modify, RedirectAttributes rttr)throws Exception {
				memberVo.setId((String)httpSession.getAttribute("user"));
				System.out.println(modify);
				if(modify.equals("수정")) {
					System.out.println(memberVo);
				log.info(ss.modifyMember(memberVo));
				System.out.println(memberVo);				
				rttr.addFlashAttribute("msg","modify");
				}		
				if(modify.equals("회원탈퇴")) {
					ss.withdrawal(memberVo);
					System.out.println(memberVo);
					rttr.addFlashAttribute("msg","withdrawalmember");
					
					
				}
				return "redirect:/";
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
			
			
			
			
		
		//관리자페이지
		
		@RequestMapping("/admin")
		public String adminPage(Model model) {
			model.addAttribute("check", ss.inspection_select());
			model.addAttribute("countCheck",ss.inspection_select().size());
			return "member/adminPage";
		}
		
		@RequestMapping("/admin1")
		public String adminPage1(Model model, MemberVo memberVo) {
			System.out.println(memberVo.getCno()+" 접수번호 점검완료 삭제합니다.");
			ss.CheckDelete(memberVo);
			model.addAttribute("check", ss.inspection_select());
			model.addAttribute("countCheck",ss.inspection_select().size());
			return "member/adminPage";
		}
		
		@RequestMapping("/MemberList.bo")
		public String adminPage_MemberList(Model model) {
			model.addAttribute("MemberList", ss.MemberSelect_Admin());
			return "member/adminPage_MemberList";
		}
		
		@RequestMapping("/MemberModify.bo")
		public String adminPage_MemberModify(Model model,MemberVo memberVo) {
			model.addAttribute("MemberList", ss.MemberSelect_Admin());
			return "member/adminPage_MemberModify";
		}
		
		@RequestMapping("/MemberDelete.bo")
		public String adminPage_MemberDelete(Model model) {
			model.addAttribute("MemberList", ss.MemberSelect_Admin());
			return "member/adminPage_MemberDelete";
		}
	
		
		
}
