package org.zerock.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.member.TpCriteria;
import org.zerock.domain.member.TpMemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class TpMemberController {
	
	@GetMapping("/join")
	public void memberJoin(TpCriteria cri) {
		log.info("회원가입dddd");
	}
	
	@PostMapping("/join")
	public void joinPost(TpMemberVO vo) {
		log.info(vo);
	}
}
