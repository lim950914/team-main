package org.zerock.mapper.member;

import org.zerock.domain.member.AuthVO;
import org.zerock.domain.member.MemberVO;

public interface MemberMapper {
	
	public int insert(MemberVO vo);
	
	public int insertAuth(AuthVO vo);
	
	public MemberVO read(String memberId);
	
//	public MemberVO findMember(String memberPhoneNum);
}
