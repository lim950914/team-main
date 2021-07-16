<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>login</title>
</head>
<body>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6 col-12">
			<h1>로그인</h1>
			<form action="${appRoot }/login" method="post">
				<div class="form-group">
					<label for="login-id-input">ID</label>				
					<input id="login-id-input" class="form-control" name="memberId" />
				</div>
				<div class="form-group">
					<label for="login-pw-input">Password</label>
					<input id="login-pw-input" type="password" class="form-control" name="memberPw" />
				</div>
				
				<div class="form-group form-check">
					<input name="remember-me" type="checkbox" class="form-check-input" id="login-id-checkbox">
					<label class="form-check-label" for="login-id-checkbox">로그인 상태 유지</label>
				</div>
				
				<input class="btn btn-primary" type="submit" value="로그인">
			</form>
		</div>
	</div>	
</div>
</body>
</html>