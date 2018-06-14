package org.zerock.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String mid, mpw, mname;
	
	private List<MemberAuthVO> authList;
	
}
