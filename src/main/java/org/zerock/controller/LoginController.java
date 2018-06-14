package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {

	
	@GetMapping("/myLogin")
	public void getMyLogin() {
		
	}
	
	@PostMapping("/myLogin")
	public String myLogin(String msg, Model model) {
		log.info("error");
		log.info("logout");
		
		if(msg == "error") {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(msg == "logout") {
			model.addAttribute("logout", "logout!");
		}
		
		return "/myLogin";
		
	}
	
	
}
