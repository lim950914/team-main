package org.zerock.controller.upload;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/upload")
@Log4j
public class Ex01Controller {
	
	@RequestMapping("/sub01")
	public void method1() {
		
	}
}
