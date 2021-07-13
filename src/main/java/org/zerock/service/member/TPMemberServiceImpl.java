package org.zerock.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.member.TPMemberVO;
import org.zerock.mapper.member.TPMemberMapper;

import lombok.Setter;

@Service
public class TPMemberServiceImpl implements TPMemberService {
	
	@Setter(onMethod_ = @Autowired)
	private TPMemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Override
	public boolean insert(TPMemberVO vo) {
		
		// 패스워드 암호화
		vo.setMemberPw(encoder.encode(vo.getMemberPw()));
		int cnt = mapper.insert(vo);
		
		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setMemberId(vo.setMemberId());
		avo.setAuth("ROLE_USER");
		mapper.insertAuth(avo);
		
		return cnt == 1;
	}
}
