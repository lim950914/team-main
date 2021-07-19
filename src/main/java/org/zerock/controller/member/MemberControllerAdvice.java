package org.zerock.controller.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class MemberControllerAdvice {
	
	@InitBinder 
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
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
