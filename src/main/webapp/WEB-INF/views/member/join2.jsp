<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="bd" tagdir="/WEB-INF/tags/sale"%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<bd:navbar></bd:navbar>
</body>
<div class="container">
	<h3 style="text-align: center;">회원가입</h3>
	<div class="col-12">
		<!-- 점보트론 -->
		<div class="jumbotron bg-light" style="padding-top: 40px;">
			<!-- 로그인 정보를 숨기면서 전송post -->
			<form method="post" action="${appRoot }/member/join">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디"
						name="userID">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호"
						name="userPassword">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이름"
						name="userName">
				</div>
				<div class="form-group" style="text-align: center;"></div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="이메일"
						name="userEmail">
				</div>
				<input type="submit" class="btn btn-primary form-control"
					value="회원가입">
			</form>
		</div>
	</div>
</div>
</body>
</html>