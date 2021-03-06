package org.zerock.service;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MemberAuthVO;
import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public MemberVO read(String mid);
	
	public void create(MemberVO vo);
	
	public void createAuth(MemberAuthVO auth);
	
	public void updatePassword(@Param("mid")String mid, @Param("empw")String encryptedPw);
	
	public Integer idcheck(String mid);

}
