package org.zerock.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/*")
@Log4j
public class TpMemberController {
	
	@RequestMapping("/join")
	public void memberJoin() {
		log.info("회원가입");
	}
}
