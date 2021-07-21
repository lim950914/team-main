package org.zerock.service.member;


import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.member.AuthVO;
import org.zerock.domain.member.MemberVO;
import org.zerock.mapper.member.MemberMapper;

import lombok.Setter;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImple implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Override
	@Transactional
	public boolean insert(MemberVO vo) {
		
		// 패스워드 암호화
		vo.setMemberPw(encoder.encode(vo.getMemberPw()));
		int cnt = mapper.insert(vo);
		
		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setMemberId(vo.getMemberId());
		avo.setAuth("ROLE_USER");
		mapper.insertAuth(avo);
				
		return cnt == 1;
	}

	@Override
	public MemberVO read(String memberId) {
		return mapper.read(memberId);
	}


}




















