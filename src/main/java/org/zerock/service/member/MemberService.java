package org.zerock.service.member;

import org.zerock.domain.member.MemberVO;

public interface MemberService {

	boolean insert(MemberVO vo);
	
	public MemberVO read(String memberId);


//	MemberVO findMember(String memberPhoneNum);
//
//	void smsService(String memberPhoneNum, String numStr);
//	
//	public void smsSubmit(String memberPhoneNum, String smsContent);

}
