package org.zerock.mapper.member;

import org.zerock.domain.member.TpAuthVO;
import org.zerock.domain.member.TpMemberVO;

public interface TpMemberMapper {
	
	public int insert(TpMemberVO vo);
	
	public int insertAuth(TpAuthVO vo);
	
	public TpMemberVO read(String memberId);
	
}
