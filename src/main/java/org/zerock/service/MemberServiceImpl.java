package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.zerock.domain.MemberAuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;

public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public MemberVO read(String mid) {
		
		return mapper.read(mid);
	}

	@Override
	public void create(MemberVO vo) {
		
		mapper.create(vo);
	}

	@Override
	public void createAuth(MemberAuthVO auth) {
		
		mapper.createAuth(auth);
		
	}

	@Override
	public void updatePassword(String mid, String encryptedPw) {
		
		mapper.updatePassword(mid, encryptedPw);
	}

}
