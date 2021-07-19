<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Join us</title>

<script>
$(function() {
	var canUseId = false;
	var passwordConfirm = false;
	
	// 아이디 중복 확인
	$("#join-idcheck-btn").click(function() {
		var idVal = $("#join-id-input").val();
		var messageElem = $("#id-message");
		canUseId = false;
		toggleEnableSubmit();
		
		if (idVal == "") {
			// 아이디가 입력되지 않았을 때
			messageElem.text("아이디를 입력해주세요.");
			
			
		} else {
			// 아이디가 입력되어있을 때
			var data = {id : idVal};
			$.ajax({
				type: "get",
				url: "${appRoot}/member/dup",
				data: data,
				success: function (data) {
					if (data == "success") {
						console.log("사용 가능한 아이디");
						canUseId = true;
						messageElem.text("사용가능한 아이디 입니다.");			
					} else if (data == "exist") {
						console.log("사용 불가능한 아이디");
						messageElem.text("이미 있는 아이디 입니다.");
					}
					
					toggleEnableSubmit();
				}, 
				error: function() {
					console.log("아이디 중복 체크 실패");
				}
				
			});
		}
	})
	
	
	// 패스워드 확인
	$("#join-pw-input1, #join-pw-input2").keyup(function() {
		var pw1 = $("#join-pw-input1").val();
		var pw2 = $("#join-pw-input2").val();
		var submitBtn = $("#join-add-btn");
		passwordConfirm = false;
		
		if (pw1 != pw2) {
			$("#password-message1").text("패스워드가 일치하지 않습니다.");	
		} else {
			if (pw1 == "") {
				$("#password-message1").text("패스워드를 입력해주세요.");
			} else {
				passwordConfirm = true;
				$("#password-message1").empty();
			}
			
		}
		
		// submit 버튼 disable/enalbe 토글
		toggleEnableSubmit();
	});
	
	function toggleEnableSubmit() {
		if (passwordConfirm && canUseId) {
			$("#join-add-btn").removeAttr("disabled");
		} else {
			$("#join-add-btn").attr("disabled", "disabled");
		}
	}
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
						<input id="join-pw-input1" name="memberPw" type="password" class="form-control" />
					</div>

					<div class="form-group">
						<label for="join-pw-input2">패스워드 확인</label>
						<input id="join-pw-input2" type="password" class="form-control" />
						<small id="password-message1" class="form-text text-danger"></small>
						<small id="password-message2" class="form-text text-primary"></small>
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
					<p class="margin center medium-small sign-up"> 로그인 하시겠습니까?<a style="color: #666;" href="${appRoot }/member/login">Log-in</a></p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>




















