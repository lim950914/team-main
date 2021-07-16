package org.zerock.controller.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
