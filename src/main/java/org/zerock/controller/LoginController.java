package org.zerock.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
public class LoginController {
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	@PostMapping("/myLogin")
	public void loginInput(String error, Model model ) {
		
		log.info("error......"+ error);
		
		
		if(error != null) {
			model.addAttribute("error", error);
		}		
		
	}
	@GetMapping("/myLogin")
	public void getLogin() {
		
	}

	
	@GetMapping("/myLogout")
	public void logout() {
		
	}
	
	@GetMapping("/accessDenied")
	public void accessDenied() {
		
		
	}	
	@GetMapping("/join")
	public void getJoin() {
		
	}
	
	@PostMapping("/join")
	public String postJoin(MemberVO vo, RedirectAttributes rttr) {
		log.info("vo,,,"+vo);		
		
		service.create(vo);
		log.info("auth.."+vo.getAuthList());
		
		rttr.addFlashAttribute("msg", "join");
		
		return "redirect:/myLogin";
	}
	
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String mid){
		log.info("idCheck...");
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		count = service.idcheck(mid);
		map.put("cnt", count);
		
		return map;
	}
	
	

	

}
