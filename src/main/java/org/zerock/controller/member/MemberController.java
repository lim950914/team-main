package org.zerock.controller.member;

import java.util.Random;

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
	
	@GetMapping("/join") // 회원가입 페이지
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
		
		// 서비스
		MemberVO vo = serivce.read(id);
		
		if (vo == null) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<> ("exist", HttpStatus.OK);
		}
		
	}
	
//	@GetMapping("/sendSMS") // 회원 가입 휴대폰 인증 
//	public @ResponseBody int sendSMS(String memberPhoneNum, HttpSession session) {
//		MemberVO phoneCheck = serivce.findMember(memberPhoneNum);
//		System.out.println(phoneCheck);
//		
//		if (memberPhoneNum == null || memberPhoneNum.isEmpty()) {
//			session.setAttribute("null", "번호를 입력해주세요.");
//			return 2;
//		} 
//		
//		if (phoneCheck == null && memberPhoneNum != null) {
//			Random rand  = new Random();
//	    String numStr = "";
//	    for(int i=0; i<4; i++) {
//	        String ran = Integer.toString(rand.nextInt(10));
//	        numStr+=ran;
//	    }
//
//	    System.out.println("수신자 번호 : " + memberPhoneNum);
//	    System.out.println("인증번호 : " + numStr);
//	    serivce.smsService(memberPhoneNum,numStr);
////	    rttr.addFlashAttribute("AuthenticationNum", numStr);
//	    session.setAttribute("phoneConfirm", numStr);
//	    
//	    return 0;
//		}
//		
//		if (phoneCheck.getMemberPhoneNum() != null || !phoneCheck.getMemberPhoneNum().isEmpty()) {
//			session.setAttribute("inUse", "이미 등록된 번호입니다.");
//			return 1;
//		} 
//		
//		return 0;
//	}
//	
//	@GetMapping("/authentication") // 인증번호 확인
//	public @ResponseBody int authentication(String phoneConfirm, HttpSession session) {
//		int result = 1;
//		
//		if (phoneConfirm == null || phoneConfirm.isEmpty()) {
//			return result;
//		}
//		
//		if (session.getAttribute("phoneConfirm").equals(phoneConfirm)) {
//			result = 0;
//		} else {
//			result = 1;
//		}
//		
//		return result;
//	}
//	
	
		// date 타입 변환시켜 주는 메소드
		// https://docs.spring.io/spring-framework/docs/current/reference/html/web.html#spring-web
		// InitBinder 핸들러 메소드가 일하기전 실행하는 메소드
		// ControllerAdvice에서 실행
	
}

	
	
	
	
	
	
