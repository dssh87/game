package org.zerock.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String mid, mpw, mname, email, phone_number;
	
	private List<MemberAuthVO> authList;
	
	public MemberVO() {
		this.authList = new ArrayList<MemberAuthVO>();		
	}	
}
