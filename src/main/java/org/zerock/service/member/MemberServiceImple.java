package org.zerock.service.member;


import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.member.AuthVO;
import org.zerock.domain.member.MemberVO;
import org.zerock.mapper.member.MemberMapper;

import lombok.Setter;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImple implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder encoder;
	
	@Override
	@Transactional
	public boolean insert(MemberVO vo) {
		
		// 패스워드 암호화
		vo.setMemberPw(encoder.encode(vo.getMemberPw()));
		int cnt = mapper.insert(vo);
		
		// 권한 입력
		AuthVO avo = new AuthVO();
		avo.setMemberId(vo.getMemberId());
		avo.setAuth("ROLE_USER");
		mapper.insertAuth(avo);
				
		return cnt == 1;
	}

	@Override
	public MemberVO read(String memberId) {
		return mapper.read(memberId);
	}

//	@Override
//	public MemberVO findMember(String memberPhoneNum) {
//		return mapper.findMember(memberPhoneNum);
//	}
//
//	@Override
//	public void smsService(String memberPhoneNum, String cerNum) {
//		String api_key = "NCS33JDKV3KUVIJW";
//	    String api_secret = "BRAV2PTBLGUH8RFPDC2KSYQZU9JJQPE3";
//	    Message coolsms = new Message(api_key, api_secret);
//
//	    // 4 params(to, from, type, text) are mandatory. must be filled
//	    HashMap<String, String> params = new HashMap<String, String>();
//	    params.put("to", memberPhoneNum);    // 수신전화번호
//	    params.put("from", "010-8807-6027");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//	    params.put("type", "SMS");
//	    params.put("text", "인증번호는" + "["+cerNum+"]" + "입니다.");
//	    params.put("app_version", "test app 1.2"); // application name and version
//
//	    try {
//	      JSONObject obj = (JSONObject) coolsms.send(params);
//	      System.out.println(obj.toString());
//	    } catch (CoolsmsException e) {
//	      System.out.println(e.getMessage());
//	      System.out.println(e.getCode());
//	    }
//	}
//
//	@Override
//	public void smsSubmit(String memberPhoneNum, String smsContent) {
//		String api_key = "NCS33JDKV3KUVIJW";
//	    String api_secret = "BRAV2PTBLGUH8RFPDC2KSYQZU9JJQPE3";
//	    Message coolsms = new Message(api_key, api_secret);
//			
//	    HashMap<String, String> params = new HashMap<String, String>();
//	    params.put("to", memberPhoneNum);    // 수신전화번호
//	    params.put("from", "010-8807-6027");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//	    params.put("type", "LMS");
//	    params.put("text", smsContent);
//	    params.put("app_version", "test app 1.2"); // application name and version
//
//	    try {
//	      JSONObject obj = (JSONObject) coolsms.send(params);
//	      System.out.println(obj.toString());
//	    } catch (CoolsmsException e) {
//	      System.out.println(e.getMessage());
//	      System.out.println(e.getCode());
//	    }
//	}
}




















