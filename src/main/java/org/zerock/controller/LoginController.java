package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {
		
	@GetMapping("/myLogin")
	public String loginInput(String error, String logout, Model model ) {
		
		log.info("error: "+ error);
		log.info("logout: "+ logout);
		
		if(error != null) {
			model.addAttribute("error", "아이디와 비밀번호를 확인하세요.");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "로그아웃 되었습니다.");
		}
		
		return "/myLogin";
	}
	
	@GetMapping("/myLogout")
	public void logout() {
		
	}
	
	@GetMapping("/accessDenied")
	public void accessDenied() {
		
		
	}	
	
	
}
