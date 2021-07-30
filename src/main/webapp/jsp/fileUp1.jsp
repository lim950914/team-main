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
<div class="container"> <!-- 파일 전송은 꼭 method="post" 왜냐하면 get방식은 주소창에 넘어가는데 파일은 주소창x 
							 				enctype="multipart/form-data" 이 코드도 꼭 명시 -->
	<form action="${appRoot }/upload/sub01" method="post" enctype="multipart/form-data"> 
		fname : <input name="fname" value="trump" /> <br>
		file : <input type="file" name="qwe" accept="image/*" /> <br>
		<input type="submit">		
	</form>
	
	<hr>
	
	<form action="${appRoot }/upload/sub02" method="post" enctype="multipart/form-data"> 
		name : <input name="name" value="lim" /> <br>
		file : <input type="file" name="file" accept="image/*" /> <br>
		<input type="submit">		
	</form>
	
</div>
</body>
</html>








