package org.zerock.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		
	}
	
	@GetMapping("/join")
	public void memberJoin(Criteria cri) {
		log.info("회원가입dddd");
	}
	
	@PostMapping("/join")
	public String joinPost(MemberVO vo, RedirectAttributes rttr) {
		log.info(vo);
		
		boolean ok = serivce.insert(vo);
		
		if (ok) {
			return "redirect:/main/main";
		} else {
			return "redirect:/member/join?error";
		}
	}

	// date 타입 변환시켜 주는 메소드
	// https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#spring-web
	// InitBinder 핸들러 메소드가 일하기전 실행하는 메소드라는 개념
	// ControllerAdvice에서 대신 실행 시켰다
//	@InitBinder 
//    public void initBinder(WebDataBinder binder) {
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        dateFormat.setLenient(false);
//        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true)); // true 빈것 허용 false 안 허용
//    }
}

	
	
	
	
	
	
