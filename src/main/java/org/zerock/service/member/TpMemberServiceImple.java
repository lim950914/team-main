package org.zerock.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.zerock.domain.member.TpMemberVO;
import org.zerock.mapper.member.TpMemberMapper;

import lombok.Setter;

@Service
public class TpMemberServiceImple implements TpMemberService {
	
	@Setter(onMethod_ = @Autowired)
	private TpMemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Override
	public boolean insert(TpMemberVO vo) {
		
		// 패스워드 암호화
		vo.setMemberPw(encoder.encode(vo.getMemberPw()));
		
		return mapper.insert(vo) == 1;
	}
	
}
