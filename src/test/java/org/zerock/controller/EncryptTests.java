package org.zerock.controller;

import org.junit.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.log4j.Log4j;

@Log4j
public class EncryptTests {
	
	@Test
	public void testMatches() {
		String enStr = "$2a$10$.tssA7bW7l40T5WF0jh25.TrQGeOtWAi.rl8V/2go3iBKZWxSzi3.";
		
		String user = "1111";
		
		BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
		
		boolean matching =  pwencoder.matches(user, enStr);
		
		log.info(matching);
		
	}
	
	@Test
	public void testEncrypt() {
		
		BCryptPasswordEncoder pwencoder = new BCryptPasswordEncoder();
		
		String str = "1111";
		
		String enStr = pwencoder.encode(str);
		
		log.info(enStr);
		
	}

}
