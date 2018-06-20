package org.zerock.mapper;

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
public class MemberMapperTests {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Test
	public void TestCreat() {
		
		MemberVO vo = new MemberVO();
		
		vo.setMid("킹왕짱");
		vo.setMpw("1111");
		vo.setMname("동히이");
		vo.setEmail("2222@gmail.com");
		
		mapper.create(vo);
	}
	
	@Test
	public void TestCreateAuth() {
		MemberAuthVO vo = new MemberAuthVO();
		
		vo.setMid("주인장");
		vo.setAuth("ROLE_USER");
		
		mapper.createAuth(vo);
		
	}
	
	@Test
	public void TestUpdatePassword() throws Exception{
		
		String mid = "킹왕짱";
		String empw = encoder.encode("1111");
		log.info("~~~~~~~~~~~~~~~~~~~~~~~~~~~~"+empw);
		
		mapper.updatePassword(mid,empw);
		
	}
	
	@Test
	public void TestIdCheck() {
		String mid = "oooo";
		
		mapper.idcheck(mid);
	}
}
