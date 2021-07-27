<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"></script>
<!-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> -->

<script>
var appRoot = '${root }';
var productSeq = '${product.product_seq}';
var userSeq = '${authUser.user_seq}';
</script>
<script>
	$(document)
			.ready(
					function() {

						/*밑의 이미지를 호버하면 main이미지가 바뀌는 js */
						/*일단 아래 섬네일에서 호버된걸 선택  */
						$(".hoveredImage").hover(function() {

							/* 호버된 이미지의 src값  */
							var hovered = $(this).attr("src");
							/* 왼쪽위의 주소를 변경 */
							$("#productMainImage").attr("src", hovered);
						})

						/*모달창-메세지넘어왔을때나오게함  */
						var message = '${message}';
						checkModal(message);
						history.replaceState({}, null, null);//뒤로가기로왔을시에없앰?
						function checkModal(message) {
							if (message && history.state == null) {
								$("#myModal .modal-body p").html(message)
								$("#myModal").modal("show");
							}
						}

						/*토탈가격 구하는 함수*/
						function totalp() {
							var sum = 0;
							$(".po_groupprice").each(function() {
								sum += Number($(this).val());
							});
							$(".total_price").val(sum + "원");
						}

						/* 옵션 클릭시 추가하기 */
						$("#optionSelectBox")
								.on(
										'change',
										function() {
											/* 선택된 옵션 val을 가져옴=productOption_seq */
											var poSeq = $(this).val();
											var po_name = $(this).find(
													"option:selected").data(
													"name");
											var po_quantity = $(this).find(
													"option:selected").data(
													"quantity");
											var po_price = $(this).find(
													"option:selected").data(
													"price");

											/* 옵션재고가 0이면 추가안하게끔 */
											if (po_quantity == 0) {
												return;
											}

											/* 이전 optionContainerNumber가 있는가 선택 */
											var exist = $('input[name="order_poseq"][value='
													+ poSeq + ']').length;
											if (exist == 0) {
												$("#optionBox")
														.append(
																'<div id="optionContainer"'+poSeq+'>'
																		+ '<input style="width:130px;" class="border-0" type="text" name="order_poname" value="'+po_name+'" readonly/>'
																		+ '<input style="width:70px; text-align:right;" class="border-0 po_price" type="number" name="order_poprice" value="'+po_price+'" readonly/>'
																		+ "원"
																		+ '<input type="number" name="order_poseq" value="'+poSeq+'"hidden/>'
																		+ '<input type="number" name="maxPoQuantity" value="'+po_quantity+'"hidden/>'
																		+ '<span class="mx-3"></span>'
																		+ '<button class="minus_btn optionBtn" type="button"><i class="fas fa-minus"></i></button>'
																		+ '<input style="width:50px;" class="amount" type="number" max="'+po_quantity+'" min="1" value="1" name="order_quantity"/>'
																		+ '<button class="plus_btn optionBtn" type="button"><i class="fas fa-plus"></i></button>'
																		+ '<button class="removeOption_btn optionBtn" type="button">제거</button>'
																		+ '<input style="width:80px; text-align:right;" class="border-0 po_groupprice" type="number" name="" value="'+po_price+'" readonly/>'
																		+ "원"
																		+ '</div>');

												totalp();
											}
										});
						/* 수동으로 개수를 넣으면 가격업데이트 */
						$(document)
								.on(
										'change',
										"input[name=order_quantity]",
										function() {

											var amou = $(this).val();
											var maxLimit = $(this)
													.siblings(
															"input[name=maxPoQuantity]")
													.val();
											Number(amou);
											Number(maxLimit);
											if (amou > maxLimit) {
												amou = maxLimit;
												$(this).val(amou);
											}
											var poPrice = $(this).siblings(
													".po_price").val();
											var pri = amou * poPrice;
											$(this).siblings(".po_groupprice")
													.val(pri);
											totalp();
										});

						/* 클릭시 옵션제거=동적태그를 가져오려면 아래처럼생성해야함 */
						$(document).on('click', ".removeOption_btn",
								function() {
									$(this).parent().remove();
									totalp();
								});

						/* 클릭시 수량증감(+가격도변경) */
						$(document)
								.on(
										'click',
										".plus_btn",
										function() {
											var amou = $(this).siblings(
													".amount").val();
											var maxLimit = $(this)
													.siblings(
															"input[name=maxPoQuantity]")
													.val();
											var amouc = parseInt(amou);
											if (amouc < maxLimit) {
												amouc += 1;
											}
											$(this).siblings(".amount").val(
													amouc);
											/* 가격도 수정 */
											var poPrice = $(this).siblings(
													".po_price").val();
											var pri = amouc * poPrice;
											$(this).siblings(".po_groupprice")
													.val(pri);
											totalp();
										});
						$(document).on(
								'click',
								".minus_btn",
								function() {
									var amou = $(this).siblings(".amount")
											.val();
									if (amou > 1) {
										var amouc = parseInt(amou) - 1;
										$(this).siblings(".amount").val(amouc);
										/* 가격도 수정 */
										var poPrice = $(this).siblings(
												".po_price").val();
										var pri = amouc * poPrice;
										$(this).siblings(".po_groupprice").val(
												pri);
									}
									totalp();
								});

						/* 장바구니/구매 버튼 */
						$("#order_btn").click(function() {
							if ("${authUser}" == "") {
								$("#myModal .modal-body p").html("로그인 해야합니다.");
								$("#myModal").modal("show");
								return;
							}
							$("#checkCartOrder").val("order");

							$("#order_form").submit();
						});
						$("#cart_btn").click(function() {
							if ("${authUser}" == "") {
								$("#myModal .modal-body p").html("로그인 해야합니다.");
								$("#myModal").modal("show");
								return;
							}
							$("#checkCartOrder").val("cart");

							$("#order_form").submit();
						});

						/* 하트 누르면 */
						$("#like").click(
								function() {
									if (userSeq == '') {
										$("#myModal .modal-body p").html(
												"좋아요를 누르려면 로그인해야합니다")
										$("#myModal").modal("show");
										return
										

									}
									$.ajax({
										type : "post",
										url : appRoot + "/product/like",
										contentType : "application/json",
										dataType : "JSON",
										data : '{"product_seq":' + productSeq
												+ ',"user_seq":' + userSeq
												+ '}',
										success : function(data, status, xhr) {
											$("#totalLike").text(data);
										},
										error : function() {
										}
									});
								});

						/* 하트애니메이션 */
						$(function() {
							$(".HeartAnimation").click(function() {
								if (userSeq == '') {
									return
									

								}
								if ($(this).hasClass("animate2") === true) {
									$(this).removeClass("animate2");
									$(this).toggleClass("animate");
								}
								$(this).toggleClass("animate");
							});
						});
						/* 이미 눌렀으면 애니메이션 자동실행 */
						var check = $
						{
							produckLikeCheck
						}
						if (check != 0) {
							$(".HeartAnimation").addClass("animate2");
						}

					});
</script>

<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

input:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

#like {
	cursor: pointer;
}

.btn_add {
	color: #fff;
	font-size: 15px;
	border: none;
	background: #1e263c;
	padding: 0px 30px;
	margin: 0 0px;
	line-height: 45px;
	float: right;
	border-radius: 3px;
}

table {
	width: 85%;
	height: 800px;
	margin-left: 4%;
}

table, td, th, textarea {
	border: 1px solid #000000;
}

table td {
	width: 50%;
	text-align: center;
}

.tableLeftUp {
	height: 540px;
}

#productMainImage {
	width: 420px;
	height: 480px;
}

#container {
	clear: both;
	position: relative;
	margin: 50px auto 0px;
	padding: 0 0 50px 0;
	width: 1200px;
	z-index: 1;
}

/* 하트애니메이션 <div class="HeartAnimation"></div>*/
.HeartAnimation {
   padding-top: 2em;
   background-image:
      url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/66955/web_heart_animation.png');
   background-repeat: no-repeat;
   background-size: 2900%;
   background-position: left;
   height: 80px;
   width: 80px;
   margin: 0 auto;
   cursor: pointer;
   display:block;
}

.animate {
	animation: heart-burst .8s steps(28) forwards;
}

.animate2 {
	animation: heart-burst .0s steps(28) forwards;
}

@
keyframes heart-burst { 0% {
	background-position: left
}

100
%
{
background-position
:
right
}
}
.optionBtn {
	border-radius: 3px;
	border: none;
	background: #fff;
}
</style>


<title>상품페이지</title>
</head>
<body>

	<div class="container">
		<section id="container">
			<div class="container">
				<!--  <p class="text-left ml-5">상품 카테고리 > ${category.category_main } > ${category.category_sub }</p> -->
				<table>
					<tr>
						<!-- 상품정보 왼쪽위 이미지  -->
						<c:set var="visibility" value="100%"></c:set>
						<c:if test="${product.product_status == 1 }">
							<c:set var="visibility" value="30%"></c:set>
						</c:if>
						<td colspan="2" class="tableLeftUp">
							<div style="position: relative;">
								<img style="opacity : ${visibility}"  id="productMainImage" class="card-img-top" src="${appRoot }/resources/logo/elonmask.png" alt="제품이미지">
								<!-- 이미지 받아오기 <img style="opacity : ${visibility}" id="productMainImage" class="card-img-top" src="${root }/resources/upload/${productImgList[0] }" alt="제품이미지"> -->
								<div style="position: absolute; top: 45%; left: 40%">
									<c:if test="${product.product_status == 1 }">
										<h5>판매 종료</h5>
									</c:if>
								</div>
							</div>
						</td>
						
						<!-- 상품정보 오른쪽 항목 -->
						<td class="align-top">
							<div class="m-5">
								<h4 class="text-left"><c:out value="가나다라${product.product_name }"></c:out></h4>
								<!-- 찜기능 클릭시 상품 정보가 mypage로 전송되게하기 -->
									<span style="font-size: 30px;" class="container d-flex align-items-center justify-content-end">
										<span id="like">
											<span class="HeartAnimation"></span>
										</span>
									</span>
								<hr>
								<fmt:formatNumber value="${product.product_price }" type="number" var="price"></fmt:formatNumber>
								<p class="text-left"> <c:out value="22,000${price }"></c:out>원</p>
								<fmt:formatNumber value="${product.product_quantity }" type="number" var="quantity"></fmt:formatNumber>
								<p class="text-left">총<c:out value="8${quantity }"></c:out>개 남음</p>
								<!-- 판매자 삭제<p class="text-right">판매자 : <c:out value="${ product.user_nickname }"></c:out></p> -->
								<hr>
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
							<hr>
							<!-- 삭제 예정 -->
							<p class="text-left">상품설명 </p>
							<textarea style="resize: none; border: none" rows="15" cols="50" readonly><c:out value="${product.product_info }"></c:out></textarea>
							
							</div>
						</td>
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
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>처리가완료되었습니다</p>
				</div>
				<div class="modal-footer">
					<button id="modalClose" type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--모달창끝-->
</body>
</html>








