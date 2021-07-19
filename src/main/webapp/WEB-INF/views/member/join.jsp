<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Join us</title>

<script>

$(document).ready(function() {
	
	// 엘리먼트 오류 창 숨겼다 보여주는 방식
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("#passwordLengthFail").hide();
	
	// 비밀번호 일치 확인
	$("input").keyup(function() {  
		var pwd1=$("#join-pw-input1").val(); 
		var pwd2=$("#join-pw-input2").val(); 
		var submitBtn = $("#join-add-btn");
		passwordConfirm = false;
		
		if(pwd1 != "" || pwd2 != "") { 
			if(pwd1 == pwd2) { 
				$("#alert-success").show(); 
				$("#alert-danger").hide();
				$("#join-add-btn").removeAttr("disabled"); // 휴대폰 인증창으로 옮기기
			} else { 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
			} 
		}   
	}); 
  	
	// 비밀번호 4자리 이상 제한 스크립트
	$('#join-pw-input1').on("blur keyup", function() {
		if ($(this).val().length < 4 ) {
			$("#passwordLengthFail").show();
		} else {
			$("#passwordLengthFail").hide();
		}
	});	
});

</script>

</head>
<body>
<div class="container">
	<c:if test="${not empty param.error }">
		<div id="alert1" class="alert alert-danger" role="alert">
			회원 가입 실패.
		</div>
	</c:if>
	<h4>회원가입</h4>
	<div class="row">
		<div class="col-12">
				<form class="login-form" action="${appRoot }/member/join" method="post">
					<div class="form-group">
						<label for="join-id-input">아이디</label>
						<div class="input-group">
							<input type="text" class="form-control" id="join-id-input" name="memberId" maxlength="30"/>
							<div class="input-group-append">
								<button type="button" id="join-idcheck-btn" class="btn btn-primary">중복확인</button>
							</div>
						</div>
						<small id="id-message" class="form-text"></small>
					</div>
					
					<div class="form-group">
	       	   			<label for="join-pw-input1">패스워드</label>
						<input class="form-control" id="join-pw-input1" name="memberPw" type="password" onpaste="return false;" required />
	          			<small class="text-danger" id="passwordLengthFail">최소 4글자 이상 입력해주세요.</small>
					</div>
					
					<div class="form-group">
	         	 		<label for="join-pw-input2">패스워드 확인</label>
						<input class="form-control" id="join-pw-input2" type="password" onpaste="return false;" required/>
	          			<small class="text-primary" id="alert-success">비밀번호가 일치합니다.</small> 
			 			<small class="text-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</small>
					</div>
					
					<div class="form-group">
						<label for="join-name-input">이름</label>
						<input id="join-name-input" name="memberName" type="text" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for="join-birth-input">생년월일</label>
						<input id="join-birth-input" name="memberBirth" type="date" class="form-control" />
					</div>

					<div class="form-group">
						<label for="join-phone-input">휴대폰번호 '-' 제외하고 입력</label>
						<div class="input-group">
							<input id="join-phone-input" name="memberPhoneNum" type="number" class="form-control" />
							<div class="input-group-append">
								<button type="button" id="join-phoneNum-btn" class="btn btn-primary">인증하기</button>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="join-phonecheck-input">인증번호 입력</label>
						<div class="input-group">
							<input id="join-phonecheck-input" name="phone" type="text" class="form-control" />
							<div class="input-group-append">
								<button type="button" id="join-phonecheck-btn" class="btn btn-primary">확인</button>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="join-email-input">이메일</label>
						<input id="join-email-input" name="memberMail" type="email" class="form-control" />
					</div>
					
					<div class="form-group">
						<label for="join-addnum-input" id="join-addnum-label">우편번호</label>
						<input id="join-addnum-input" name="memberAddNum" type="text" class="form-control" /> 
					</div>
					
					<div class="form-group">
						<label for="join-addcity-input" id="join-addcity-label">주소</label>
						<div class="input-group">
							<input id="join-addcity-input" name="memberAddCity" type="text" class="form-control" />
							<div class="input-group-append">
								<button type="button" id="join-addCity-btn" class="btn btn-primary">검색</button>
							</div>
						</div>
					</div>
					<button disabled type="submit" id="join-add-btn" class="btn btn-primary">회원가입</button>
					<p class="margin center medium-small sign-up"> 이미 회원 아이디가 있습니까? <a style="color: #666;" href="${appRoot }/member/login">Log-in</a></p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>




















