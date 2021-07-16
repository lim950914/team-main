package org.zerock.service.member;

import org.zerock.domain.member.MemberVO;

public interface MemberService {

	boolean insert(MemberVO vo);
	
	MemberVO read(String name);
	
}
