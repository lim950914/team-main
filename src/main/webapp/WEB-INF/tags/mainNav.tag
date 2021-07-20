<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="u"  tagdir="/WEB-INF/tags" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<link rel="stylesheet" href="${appRoot }/resources/css/mainNav.css">

<body>
<div class="l_header" role="banner">
	<div class="b_header_gnb">
		<div class="inner" id="lws">
			<h1 class="c_gnb_logo">
				<a href="${root }/main/mainPage">BCD</a>
			</h1>
			<div class="c_gnb_search" id="tSearch">
				<h2 class="skip">통합검색</h2>
				<form action="${root }/product/list" method="get">
					<fieldset>
						<legend>통합검색</legend>
						<input name="type" value="TC" hidden="hidden"/>
						<input type="text" class="search_text search_text_ad" name="keyword" placeholder="통합검색" title="통합검색">
						<button type="submit" class="search_button">검색</button>
					</fieldset>
				</form>		
			</div>	
		<div class="c_gnb_usermenu">
			<h2 class="skip">나의 메뉴</h2>
			<ul>
				<li class="my" data-log-actionid-area="header_util" data-log-actionid-label="my11st">
					<a href="${root }/user/userRead?user_id=${authUser.user_id}" class="menu" id="menu"></a>
					<div class="c_gnb_layer">
						<ul class="c_gnb_menulist">
							<li>
								<a href="#" data-log-actionid-area="header_util" data-log-actionid-label="coupon">나의 쿠폰</a>
							</li>
							<li>
								<a href="${root }/user/productList" >판매 목록</a>
							</li>
							<li>
								<a href="${root }/user/userOrderList" >주문/배송조회</a>
							</li>
							<li>
								<a href="#" >취소/반품/교환</a>
							</li>
							<li>
								<a href="${root }/qa/list" >고객센터</a>
							</li>
							<li>
								<a href="${root }/user/userRead?user_id=${authUser.user_id}">회원정보</a>
							</li>
						</ul>
					</div>
				</li>
				<li class="order">
					<a href="${root }/user/userOrderList" data-log-actionid-area="header_util" data-log-actionid-label="orderdlv_inquiry" class="menu">주문</a>
				</li>
				<li class="cart">
					<a href="${root }/user/cart" class="menu" data-log-actionid-area="header_util" data-log-actionid-label="cart">장바구니</a>
				</li>
			</ul>
		</div>
	</div>		
		<div class="b_header_util">
			<div class="inner">
				<div class="c_util_servicelink">
					<h2 class="skip">주요서비스 바로가기</h2>
					<ul>
						<li>
							<a href="${root }/main/mainPage" class="" >베스트</a>
						</li>
						<li>
							<a href="${root }/freeboard/list" class="">자유게시판</a>
						</li>
						<li>
							<a href="${root }/qa/list" class="" >Q&A</a>
						</li>
						<li>
							<a href="${root }/rev/list" class="">구매후기</a>
						</li>
						<li>
							<a href="${root }/product/list" class="">상품목록</a>
						</li>
						<c:if test="${authUser.user_grade == 0 }">
							<li>
								<a href="${root }/user/userList" class="">회원관리</a>
							</li>
						</c:if>
					</ul>
				</div>
				<div class="c_util_etc">
					<div class="group login_status">
						<c:choose>
							<c:when test="${authUser == null}">
								<a style="color: #666;" href="${appRoot }/member/login">로그인</a>&nbsp; &nbsp; 
								<a style="color: #666;" href="${appRoot }/member/join">회원가입</a>
							</c:when>
							<c:otherwise>
								<a style="color: #666;" href="${root }/user/logout">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>