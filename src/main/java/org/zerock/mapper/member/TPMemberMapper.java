package org.zerock.mapper.member;

import org.zerock.domain.member.TPMemberVO;

public interface TPMemberMapper {
	
	public int insert(TPMemberVO vo);
	
	public int insertAuth(TeamAuthVO vo);
	
}
