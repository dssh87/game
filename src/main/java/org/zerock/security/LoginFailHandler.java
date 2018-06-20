package org.zerock.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginFailHandler implements AuthenticationFailureHandler {
    
    
    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse res, AuthenticationException arg2)
            throws IOException, ServletException {
    	log.info("fail....");
        req.setAttribute("username", req.getParameter("username"));
        req.getRequestDispatcher("/myLogin?error=true").forward(req, res);
    }

}
