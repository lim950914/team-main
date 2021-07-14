package org.zerock.domain.member;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TpMemberVO {
	// 아이디
	private String memberId;
	
	// 비밀번호
	private String memberPw;
	
	// 이름
	private String memberName;
	
	// 휴대폰 번호
	private int memberphoneNum;
	
	// 생일
	private int memberBirth;
	
	// 이메일
	private String memberMail;
	
	// 우편번호
	private int memberAddNuml;
	
	// 주소
	private String memberAddCity;
	
	// 가입일
	private Date regDate;
	
	// 돈
	private int money;
	
	private boolean enabled;
	
	private List<TpAuthVO> authList;
}







