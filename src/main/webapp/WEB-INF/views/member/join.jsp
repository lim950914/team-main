<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/sale"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<!-- https://materializecss.com/color.html script 및 css 참고 홈페이지 -->

<!-- Compiled and minified CSS, https://cdnjs.cloudflare.com/ -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript, https://cdnjs.cloudflare.com/ -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

<link rel="stylesheet" href="${appRoot }/resources/css/join.css">

<title>Join us</title>

<script>

</script>

</head>

<body>
<div class="container">
	<c:if test="${not empty param.error }">
		<div id="alert1" class="alert alert-danger" role="alert">
			회원 가입 실패.
		</div>
	</c:if>
	<section id="join-section">
		<div class="row">
			<div class="z-depth-1 card-panel" style="margin-left: 255px;">
				<form class="login-form" action="${appRoot }/member/join" method="post">
					<div class="row">
						<div class="input-field col s12 center">
							<h4>회원가입</h4>
							<p class="center">ELON MASK에 오신걸 환영합니다</p>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-id-input" name="memberId" type="text" maxlength="20" />
							<button type="button" id="join-idcheck-btn" class="btn waves-effect waves-light col s3">중복확인</button>
							<label for="join-id-input">아이디</label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-pw-input" name="memberPw" type="password" />
							<label for="join-pw-input">패스워드</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-pwcheck-input" type="password" />
							<label for="join-pwcheck-input">패스워드 확인</label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-name-input" name="memberName" type="text" />
							<label for="join-name-input">이름</label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-birth-input" name="memberBirth" type="date" />
							<label for="join-birth-input">생년월일</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-phone-input" name="memberPhoneNum" type="number" />
							<button type="button" id="join-phoneNum-btn" class="btn waves-effect waves-light col s3">인증하기</button>
							<label for="join-phone-input">휴대폰번호 '-' 제외하고 입력</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-phonecheck-input" name="phone" type="text" />
							<button type="button" id="join-phonecheck-btn" class="btn waves-effect waves-light col s2">확인</button>
							<label for="join-phonecheck-input">인증번호 입력</label>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-email-input" name="memberMail" type="email" />
							<label for="join-email-input">이메일</label>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-addnum-input" name="memberAddNum" type="text" /> 
							<label for="join-addnum-input" id="join-addnum-label">우편번호</label>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<input id="join-addcity-input" name="memberAddCity" type="text" />
							<button type="button" id="join-addCity-btn" class="btn waves-effect waves-light col s2">검색</button>
							<label for="join-addcity-input" id="join-addcity-label">주소</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<button type="submit" id="join-add-btn" class="btn waves-effect waves-light col s12">회원가입</button>
						</div>
					<div class="input-field col s12">
						<p class="margin center medium-small sign-up"> 로그인 하시겠습니까?
						<a style="color: #666;" href="${appRoot }/member/login">Log-in</a>
						</p>
					</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>
</body>
</html>































