package org.zerock.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.member.Criteria;
import org.zerock.domain.member.MemberVO;
import org.zerock.service.member.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService serivce;
	
	@RequestMapping("/login")
	public void login() {
		log.info("로그인");
	}
	
	@GetMapping("/join") // 회원가입 페이지 매핑
	public void memberJoin(Criteria cri) {
		log.info("회원가입");
	}
	
	@PostMapping("/join") // 회원가입
	public String joinPost(MemberVO vo, RedirectAttributes rttr) {
		log.info(vo);
		
		boolean ok = serivce.insert(vo);
		
		if (ok) {
			return "redirect:/main/main";
		} else {
			return "redirect:/member/join?error";
		}
	}
	
	@GetMapping("/dup")
	@ResponseBody
	public ResponseEntity<String> duplicate(String id) {
		log.info("id중복 확인");
		
		// 서비스 일 시키고
		MemberVO vo = serivce.read(id);
		
		if (vo == null) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("exist", HttpStatus.OK);
		}
		
	}
	
		// date 타입 변환시켜 주는 메소드
		// https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#spring-web
		// InitBinder 핸들러 메소드가 일하기전 실행하는 메소드
		// ControllerAdvice에서 실행
	
}

	
	
	
	
	
	
