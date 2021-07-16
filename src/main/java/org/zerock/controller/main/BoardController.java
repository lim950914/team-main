package org.zerock.controller.main;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.member.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	// 로그인한 사람만 보이게 되는 메소드 권한 있는 사람만 (673쪽에 해즈롤 참조)
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(@ModelAttribute("cri") Criteria cri) {
		// forward /WEB-INF/views/board/register.jsp
	}
}
