package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberAuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Override
	public MemberVO read(String mid) {
		
		return mapper.read(mid);
	}

	@Transactional
	@Override
	public void create(MemberVO vo) {
		
		String encPassword = encoder.encode(vo.getMpw());
		
		log.info("vo.setMpw(encPassword)는 뭐~~~~~~~~~~?"+vo);
		vo.setMpw(encPassword);
	
		mapper.create(vo);
		
		MemberAuthVO getAuth = new MemberAuthVO();
		getAuth.setMid(vo.getMid());
		getAuth.setAuth("ROLE_USER");
		
		log.info("vo.getMid..."+vo.getMid());
		log.info("auth.."+getAuth);
		
		vo.getAuthList().add(getAuth);
			
		vo.getAuthList().forEach(auth->mapper.createAuth(auth));
		
	}

	@Override
	public void createAuth(MemberAuthVO auth) {
		
		mapper.createAuth(auth);
	}

	@Override
	public void updatePassword(String mid, String encryptedPw) {
		
		mapper.updatePassword(mid, encryptedPw);
	}

	@Override
	public Integer idcheck(String mid) {

		return mapper.idcheck(mid);
	}

}
