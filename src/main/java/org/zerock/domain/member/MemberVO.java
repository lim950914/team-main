package org.zerock.domain.member;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId; 	// 아아디
	private String memberPw; 	// 비밀번호
	private String memberName;	// 이름
	private String memberPhoneNum;	// 휴대전화
	private Date memberBirth;	// 생일
	private String memberMail;	// 이메일
	private Integer memberAddNum;	// 우편번호
	private String memberAddCity;	// 주소 	
	private Date regDate;		// 생성일
	private Integer money;			// 돈
	private Boolean enabled;
	
	private List<AuthVO> authList;
}







