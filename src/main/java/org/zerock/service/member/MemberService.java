package org.zerock.service.member;

import org.zerock.domain.member.MemberVO;

public interface MemberService {

	boolean insert(MemberVO vo);
	
	public MemberVO read(String memberId);

}
