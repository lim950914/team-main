<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp" %>

<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>main</h1>
	  <sec:authorize access="isAuthenticated()">
	  <form action="${appRoot }/logout" method="post">
	  	<input type="submit" class="btn btn-dark" value="로그아웃">
	  </form>
  </sec:authorize>
</div>
</body>
</html>