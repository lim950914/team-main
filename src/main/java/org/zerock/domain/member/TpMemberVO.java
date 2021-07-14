package org.zerock.domain.member;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TpMemberVO {
	private String memberId; 	// 아아디
	private String memberPw; 	// 비밀번호
	private String memberName;	// 이름
	private String memberphoneNum;	// 휴대전화
	private Date memberBirth;	// 생일
	private String memberMail;	// 이메일
	private int memberAddNum;	// 우편번호
	private String memberAddCity;	// 주소 	
	private Date regDate;		// 생성일
	private int money;			// 돈
	private boolean enabled;
	
	private List<TpAuthVO> authList;
}







