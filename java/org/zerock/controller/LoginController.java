package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

		String mid = vo.getMid();
		String mpw = vo.getMpw();
		String mname = vo.getMname();
		String email = vo.getEmail();
				
		if (mid != null && mid.trim().length() != 0 && mpw != null && mpw.trim().length() != 0 &&
				mname != null && mname.trim().length() != 0 && email != null && email.trim().length() != 0) {
			service.create(vo);
			rttr.addFlashAttribute("msg", "join");
			
		} else {
			rttr.addFlashAttribute("msg", "joinFail");
			return "redirect:/join";
		}
		return "redirect:/myLogin";
	}	
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public ResponseEntity<String> checkId(@RequestBody String mid) {
		log.info("idCheck progress.... : " + mid);
		int result = service.idcheck(mid);
		log.info("result : " + result);
		
		ResponseEntity<String> entity = null;
		
		entity = new ResponseEntity<String>(Integer.toString(service.idcheck(mid)), HttpStatus.OK);
		log.info("아이디 체크 진행중..................");
		log.info("아이디 체크 결과 : " + Integer.toString(service.idcheck(mid)));
		
		return entity;
	}
	
	

}
