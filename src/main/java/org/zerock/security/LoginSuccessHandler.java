package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginSuccessHandler implements AuthenticationSuccessHandler {	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication auth)
			throws IOException, ServletException {
				log.info("들어와라");
				log.warn("Login Success");
				
				List<String> roleNames = new ArrayList<>();
				
				auth.getAuthorities().forEach(authority -> {
					
					roleNames.add(authority.getAuthority());					
				});
				
				log.warn("ROLE NAMES: " + roleNames);
				
				if(roleNames.contains("ROLE_ADMIN")) {
					
					log.info("admin으로 들어옴~~~~");
					res.sendRedirect("/board/list");
					return;
				}
				
				if(roleNames.contains("ROLE_USER")) {
					log.info("user로 들어옴~~~~~~~~~~~");
					
					res.sendRedirect("/board/list");
					return;
				}
				
				res.sendRedirect("/");
			}
}