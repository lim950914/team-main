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

<title>Join us</title>

<link rel="stylesheet" href="${appRoot }/resources/css/join.css">

<script>

</script>

</head>
<style>

</style>
<body>
<bd:navbar></bd:navbar>
<div class="container">
	<section id="mem-section">
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
							<input id="mem-id-input" name="memberId" type="text" maxlength="20" />
							<button type="button" id="mem-idcheck-btn" class="btn waves-effect waves-light col s3">중복확인</button>
							<label for="mem-id-input">아이디</label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-pw-input" name="memberPw" type="password" />
							<label for="mem-pw-input">패스워드</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-pwcheck-input" type="password"  />
							<label for="mem-pwcheck-input">패스워드 확인</label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-name-input" name="memberName" type="text" />
							<label for="mem-name-input">이름</label>
						</div>
					</div>
					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-birth-input" name="memberBirth" type="date" />
							<label for="mem-birth-input">생년월일</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-phone-input" name="memberPhoneNum" type="number" />
							<button type="button" id="mem-phoneNum-btn" class="btn waves-effect waves-light col s3">인증하기</button>
							<label for="mem-phone-input">'-' 제외하고 입력</label>
						</div>
					</div>

					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-phonecheck-input" name="phone" type="text" />
							<button type="button" id="mem-phoneNum-btn" class="btn waves-effect waves-light col s2">확인</button>
							<label for="mem-phonecheck-input">인증번호 입력</label>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<input id="mem-email-tnput" name="memberMail" type="email" />
							<label for="mem-email-tnput">이메일</label>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<input id="" name="memberAddNum" type="text" /> 
							<label for="" id="">우편번호</label>
						</div>
					</div>
					
					<div class="row margin">
						<div class="input-field col s12">
							<input id="" name="memberAddCity" type="text" />
							<button type="button" id="mem-addCity-btn" class="btn waves-effect waves-light col s2">검색</button>
							<label for="" id="">주소</label>
						</div>
					</div>

					<div class="row">
						<div class="input-field col s12">
							<button type="submit" id="mem-add-btn" class="btn waves-effect waves-light col s12">회원가입</button>
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































