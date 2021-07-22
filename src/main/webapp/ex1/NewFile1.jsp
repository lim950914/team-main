<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<!-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> -->

<title>상품페이지</title>
</head>
<body>
	
<u:mainNav/>
<div class="container">
  <section id="container">
  
	<div class="container">
				<table>
					
					<tr>
						<!-- 상품정보 왼쪽위 이미지  -->
						<c:set var="visibility" value="100%"></c:set>
						<c:if test="${product.product_status == 1 }">
							<c:set var="visibility" value="30%"></c:set>
						</c:if>
						<td colspan="2" class="tableLeftUp">
							<div style="position : relative;">
								<img style="opacity : ${visibility}"  id="productMainImage" class="card-img-top" src="${root }/resources/upload/${productImgList[0] }" alt="제품이미지">
								<div style="position:absolute;top:45%;left:40%">
									<c:if test="${product.product_status == 1 }">
										<h5>판매 종료</h5>
									</c:if>
								</div>
							</div>
						</td>
						
						<!-- 상품정보 오른쪽 항목 -->
						<td rowspan="2" class="align-top">
							<div class="m-5">
								<h3 class="text-left"><c:out value="${product.product_name }"></c:out></h3>
								<fmt:formatNumber value="${product.product_price }" type="number" var="price"></fmt:formatNumber>
								<h5 class="text-right"><c:out value="${price }"></c:out>원</h5>					
								<fmt:formatNumber value="${product.product_quantity }" type="number" var="quantity"></fmt:formatNumber>
								<p class="text-right">총 <c:out value="${quantity }"></c:out>개 남음</p>
								<p class="text-right">판매자 : <c:out value="${ product.user_nickname }"></c:out></p>
								
								<div style="font-size: 30px;" class="container d-flex align-items-center justify-content-end">
									<div id="like">
										<div class="HeartAnimation"></div>
									</div>
									<div id="totalLike">${product.product_like }</div>
									<div class="mr-2"></div>
									<div class="mx-2" style="font-size: 30px;">
										<i class="fas fa-eye"></i>
									</div>
									<div class="ml-2"></div>
									<div>
										${product.product_readcnt }
									</div>
								</div>
									
								<p class="text-left">상품설명 </p>
								<textarea style="resize: none; border: none" rows="15" cols="50" readonly><c:out value="${product.product_info }"></c:out></textarea>
	
							
							</div>
						</td>
					</tr>
					
					<!--상품 왼쪽아래 부가정보  -->
					<tr>
						<!--이미지리스트썸네일  -->
						<td colspan="2"  valign=top>
							<c:forEach items="${productImgList }" var="productImg" varStatus="imgNum">
								<img style="opacity : ${visibility}" class="hoveredImage"alt="" src="${root }/resources/upload/${productImg}" height="80px" width="70px">
							</c:forEach>
							<hr>
							<p>부가정보란</p>
						<fmt:setTimeZone value = "GMT+9"  />
								<p>상품 등록일 : <fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value="${product.product_regdate }"/> </p>
								<p>상품 정보 수정일 : <fmt:formatDate pattern = "yyyy-MM-dd HH:mm:ss" value="${product.product_updatedate }"/> </p>
						</td>
					</tr>
					<tr style="height: 52px;">
						<td style="width: 60%;">
							<select id="optionSelectBox" style="width:280px; margin-left: 6px;" class="form-control">
							<c:choose>
								<c:when test="${product.product_status == 0}">
									<option>===옵션을 선택하세요===</option>
										<c:forEach items="${ poList}" var="poLi" >
											<option value="${poLi.productOption_seq }" data-name="${poLi.po_name}" data-price="${poLi.po_price}" data-quantity="${poLi.po_quantity}"> ${poLi.po_name} (${poLi.po_price} 원)  / (재고 : ${poLi.po_quantity}) </option>
										</c:forEach>
								</c:when>
								<c:otherwise>
									<option>===판매가 종료된 상품입니다.===</option>
								</c:otherwise>
							</c:choose>
							</select>
						</td>
						<td colspan="2" >
							<form id="order_form" action="${root }/product/cart" method="get">
								<input name="product_seq" value="${product.product_seq }" hidden="hidden"/>
								<input name="order_filename" value="${productImgList[0] }" hidden="hidden"/>
								<input name="order_productseq" value="${product.product_seq }" hidden="hidden"/>
								<input name="order_userseq" value="${authUser.user_seq }" hidden="hidden"/>
								<input name="order_username" value="${authUser.user_name }" hidden="hidden"/>
								<input name="order_useraddress" value="${authUser.user_address }" hidden="hidden"/>
								<input name="order_userphone" value="${authUser.user_phone }" hidden="hidden"/>
								<input hidden="hidden" name="type" value="${cri.type }"/>
					    		<input hidden="hidden" name="keyword" value="${cri.keyword }"/>      
					    		<input hidden="hidden" name="array" value="${cri.array }"/> 
					    		<input id="checkCartOrder" hidden="hidden" name="checkCartOrder" value=""/> 
								<div id="optionBox">
								</div>
							</form>
						</td>
					</tr>
					<tr style="height: 70px;">
						<td colspan="3">
							<div class="row">
								<div class="ml-3"></div>
								<form action="${root }/product/list">
					            	<input hidden="hidden" name="pageNum" value="${cri.pageNum }"/>
					            	<input hidden="hidden" name="amount" value="${cri.amount }"/>
					            	<input hidden="hidden" name="type" value="${cri.type }"/>
						    		<input hidden="hidden" name="keyword" value="${cri.keyword }"/>      
						    		<input hidden="hidden" name="array" value="${cri.array }"/>
						    		<input hidden="hidden" name="categoryNum" value="${cri.categoryNum }"/>
						    		<input hidden="hidden" name="categoryMain" value="${cri.categoryMain }"/>
									<input hidden="hidden" name="categorySub" value="${cri.categorySub }"/>  
									<button style="background:#4a4a4a;" class="btn_add mx-4"> 목록으로</button>
								</form>
								<div class="col-3"></div>
								<span style="margin-top: 11px; margin-left: 132px;">결제금액 : </span>
								<input class="total_price" style="border:none; width: 87px;" value="0" name="order_totalprice" readonly/>
								<button id="cart_btn" class="btn_add" type="button"> 장바구니</button>
								<button style="background:#4a4a4a;" id="order_btn" class="btn_add mx-2" type="button"> 구매</button>
							</div>
						</td>
					</tr>					
					<tr>
											<c:if test="${product.product_status != 1 }">
								<c:if test="${product.product_seller eq authUser.user_seq}">	
									<div class="row justify-content-center mt-3">
										<!--수정버튼(작성자만보이도록)  -->
										<c:url value="/product/modify" var="productModify">
											<c:param name="product_seq" value="${product.product_seq }"></c:param>
							            	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
							            	<c:param name="amount" value="${cri.amount }"></c:param>
							            	<c:param name="type" value="${cri.type }"></c:param>
								    		<c:param name="keyword" value="${cri.keyword }"></c:param>      
								    		<c:param name="array" value="${cri.array }"></c:param>
								    		<c:param name="categoryNum" value="${cri.categoryNum }"/>
								    		<c:param name="categoryMain" value="${cri.categoryMain }"/>
											<c:param name="categorySub" value="${cri.categorySub }"/>    
										</c:url>
										
										<button class="btn_add mx-2" style="background:#4a4a4a;" type="button" onclick="location.href='${productModify}' ">정보 수정</button>
										
										<!--삭제버튼(작성자만보이도록)-->
										<c:url value="/product/finish" var="productFinish">
											<c:param name="product_seq" value="${product.product_seq }"></c:param>
							            	<c:param name="pageNum" value="${cri.pageNum }"></c:param>
							            	<c:param name="amount" value="${cri.amount }"></c:param>
							            	<c:param name="type" value="${cri.type }"></c:param>
								    		<c:param name="keyword" value="${cri.keyword }"></c:param>      
								    		<c:param name="array" value="${cri.array }"></c:param>
								    		<c:param name="categoryNum" value="${cri.categoryNum }"/>
								    		<c:param name="categoryMain" value="${cri.categoryMain }"/>
											<c:param name="categorySub" value="${cri.categorySub }"/> 
										</c:url>
										<form action="${productFinish }" method="post">
											<button class="btn_add mx-2">판매종료</button>
										</form>	
									</div>
								</c:if>
							</c:if>
							<c:if test="${product.product_status == 1 }">
								<p>판매가 종료되었습니다.</p>
							</c:if>
				</tr>
				
				
				</table>
	</div>

   </section>
</div>

<!--모달창시작-->
<div id="myModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">알림</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>처리가완료되었습니다</p>
      </div>
      <div class="modal-footer">
        <button id="modalClose" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>




<!--모달창끝-->
<u:footer/>
</body>
</html>