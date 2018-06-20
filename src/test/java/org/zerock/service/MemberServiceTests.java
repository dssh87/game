package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberAuthVO;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MemberServiceTests {
	

	@Setter(onMethod_= {@Autowired})
	private MemberService service;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Test
	public void TestCreat() {
		
		MemberVO vo = new MemberVO();
		
		vo.setMid("하이룽");
		vo.setMpw("1111");
		vo.setMname("햄토리");
		vo.setEmail("3333@gmail.com");
		
		service.create(vo);
	}
	
	@Test
	public void TestCreateAuth() {
		MemberAuthVO vo = new MemberAuthVO();
		
		vo.setMid("aaaa");
		
		service.createAuth(vo);
		
	}
	
	@Test
	public void TestUpdatePassword() throws Exception{
		
		String mid = "하이룽";
		String empw = encoder.encode("1111");
		log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+empw);
		
		service.updatePassword(mid,empw);
	}

}
