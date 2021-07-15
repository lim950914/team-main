package org.zerock.controller.member;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.member.TpCriteria;
import org.zerock.domain.member.TpMemberVO;
import org.zerock.service.member.TpMemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class TpMemberController {
	
	@Setter(onMethod_ = @Autowired)
	private TpMemberService Tpserivce;
	
	@GetMapping("/join")
	public void memberJoin(TpCriteria cri) {
		log.info("회원가입dddd");
	}
	
	@PostMapping("/join")
	public String joinPost(TpMemberVO vo, RedirectAttributes rttr) {
		log.info(vo);
		
		boolean ok = Tpserivce.insert(vo);
		
		if (ok) {
			return "redirect:/main/main";
		} else {
			return "redirect:/member/join?error";
		}
	}
	
	
	
//	@GetMapping(params = "date")
//	  public String localDate(
//	      @RequestParam 
//	      @DateTimeFormat(pattern = "yyyy-MM-dd")
//	      final LocalDate date) {
//	    return date.toString();
//	  }
	
}
	
	
	
	
	
	
	
