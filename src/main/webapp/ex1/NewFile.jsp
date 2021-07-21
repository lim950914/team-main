<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/subModules/bootstrapHeader.jsp"%>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div style="border: 1px solid #ececec; margin-top: 30px;" class="xans-element- xans-product xans-product-detail ">
			<!-- 이미지 영역 -->
			<div class="xans-element- xans-product xans-product-image imgArea ">
				<div class="keyImg">
					<img
						src="//jellychu.kr/web/product/big/201905/0c4aeae23cb1bb30bc59b1fad675d306.gif"
						alt=""> &nbsp;
				</div>
			</div>
			<!-- //이미지 영역 -->
			<!-- 상세정보 내역 -->
			<div class="infoArea">
				<h3>하트 포켓 케이스 <span> </span> <span class="displaynone">(해외배송가능상품)</span></h3>



				<div style="padding-top: 10px; padding-bottom: 10px;"
					class="xans-element- xans-product xans-product-action ">
					<a href="#none"
						onclick="add_wishlist_nologin('/member/login.html');" class=""><img
						src="/web/upload/dj/s45_but_gowishlist.gif"></a>
				</div>

				<div style="padding-top: 10px; clear: both;"
					class="xans-element- xans-product xans-product-detaildesign">
					<table border="0" summary="">
						<tbody>
							<tr style="height: 8px;" class=" xans-record-">
								<th scope="row"></th>
								<td></td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row"><span
									style="font-size: 12px; color: #555555;"
									data-i18n="PRODUCT.PRD_INFO_PRODUCT_CUSTOM">custom</span></th>
								<td><span style="font-size: 12px; color: #555555;"><span
										id="span_product_price_custom"><strike>15,000won</strike></span></span></td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row"><span
									style="font-size: 12px; color: #222222; font-weight: bold;"
									data-i18n="PRODUCT.PRD_INFO_PRODUCT_PRICE">price</span></th>
								<td><span
									style="font-size: 12px; color: #222222; font-weight: bold;"><strong
										id="span_product_price_text">11,000 won</strong><input
										id="product_price" name="product_price" value="" type="hidden"></span></td>
							</tr>
							<tr class=" xans-record-">
								<th scope="row"><span
									style="font-size: 12px; color: #555555;"
									data-i18n="PRODUCT.PRD_INFO_MILEAGE_VALUE">save</span></th>
								<td><span style="font-size: 12px; color: #555555;"><span
										id="span_mileage_text">110원 (1%)</span></span></td>
							</tr>

						</tbody>
					</table>
				</div>

				<table border="0" summary="">
					<caption>SNS</caption>
					<tbody>
						<tr class="">
							<th scope="row" style="padding-top: 15px;"><font
								color="#111111">SNS</font></th>
							<td class="social" style="padding-top: 9px;"><img
								src="/web/upload/72075174857be746507801.jpg"
								onclick="SnsLinkAction('facebook',3658);" alt=""> <img
								src="/web/upload/28974594857be746507763.jpg"
								onclick="SnsLinkAction('twitter',3658);" alt=""></td>
						</tr>
					</tbody>
				</table>
				<div id="zoom_wrap">
					<p class="image_zoom_large" style="display: none;">
						<span class="image_zoom_large_relative"><img
							id="zoom_image" alt="확대 이미지"></span>
					</p>
				</div>

				<p class="displaynone">
					<img
						src="http://img.echosting.cafe24.com/design/skin/default/product/txt_naver.gif"
						alt="개인결제창을 통한 결제 시 네이버 마일리지 적립 및 사용이 가능합니다.">
				</p>
				<!-- //상세정보 내역 -->

				<table border="0" summary="">
					<caption>상품 옵션</caption>
					<tbody
						class="xans-element- xans-product xans-product-option xans-record-">
						<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
						<!-- //참고 -->
						<tr
							class="xans-element- xans-product xans-product-option xans-record-">
							<th scope="row">기종 선택</th>
							<td><select option_product_no="3658"
								option_select_element="ec-option-select-finder"
								option_sort_no="1" option_type="T" item_listing_type="S"
								option_title="기종 선택" product_type="product_option"
								product_option_area="product_option_3658_0" name="option1"
								id="product_option_id1" class="ProductOption0"
								option_style="select" required="true"><option value="*"
										selected="" link_image="">- [필수] 옵션을 선택해 주세요 -</option>
									<option value="**" disabled="" link_image="">-------------------</option>
									<option value="아이폰 6/6s" link_image="">아이폰 6/6s</option>
									<option value="아이폰 6+/6+s" link_image="">아이폰 6+/6+s</option>
									<option value="아이폰 7/8" link_image="">아이폰 7/8</option>
									<option value="아이폰 x/xs" link_image="">아이폰 x/xs</option>
									<option value="아이폰 xs max" link_image="">아이폰 xs max</option></select></td>
						</tr>
						<tr
							class="xans-element- xans-product xans-product-option xans-record-">
							<th scope="row">옵션 선택</th>
							<td><select option_product_no="3658"
								option_select_element="ec-option-select-finder"
								option_sort_no="2" option_type="T" item_listing_type="S"
								option_title="옵션 선택" product_type="product_option"
								product_option_area="product_option_3658_0" name="option2"
								id="product_option_id2" class="ProductOption0"
								option_style="select" required="true"><option value="*"
										selected="" link_image="">- [필수] 옵션을 선택해 주세요 -</option>
									<option value="**" disabled="" link_image="">-------------------</option></select></td>
						</tr>
					</tbody>
				</table>
				<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
				<p class="info ">
					(최소주문수량 1개 이상<span class="displaynone"> / 최대주문수량 0개 이하</span>)
				</p>
				<!-- //참고 -->

				<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
				<!-- //참고 -->

				<!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
				<!-- //참고 -->

				<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
				<div id="totalProducts" class="">
					<p class="info displaynone">
						<img
							src="http://img.echosting.cafe24.com/design/skin/default/product/ico_information.gif"
							alt=""> 수량을 선택해주세요.
					</p>
					<p class="info ">
						<img
							src="http://img.echosting.cafe24.com/design/skin/default/product/ico_information.gif"
							alt=""> 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.
					</p>
					<table border="1" summary="">
						<caption>상품 목록</caption>
						<colgroup>
							<col style="width: 202px;">
							<col style="width: 85px;">
							<col style="width: 85px;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">상품명</th>
								<th scope="col">상품수</th>
								<th scope="col">가격</th>
							</tr>
						</thead>
						<tbody class="displaynone">
							<tr>
								<td>하트 포켓 케이스</td>
								<td><span class="quantity"> <input id="quantity"
										name="quantity_name" style="" value="0" type="text"> <a
										href="#none"><img
											src="http://img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif"
											alt="수량증가" class="QuantityUp up"></a> <a href="#none"><img
											src="http://img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif"
											alt="수량감소" class="QuantityDown down"></a>
								</span></td>
								<td class="right"><span class="quantity_price">11000</span>
									<span class="mileage ">(<img
										src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif">
										&nbsp;<span class="mileage_price">110</span>)
								</span></td>
							</tr>
						</tbody>
						<!-- 참고 : 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다.-->
						<tbody>
							<!-- tr>
                        <td>
                            <p class="product">
                                $상품명<br />
                                <span>$옵션</span>
                            </p>
                        </td>
                        <td>
                            <span class="quantity">
                                <input type="text" class="quantity_opt" />
                                &nbsp;<a href="#none"><img src="http://img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" alt="수량증가" class="up" /></a>
                                <a href="#none"><img src="http://img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" alt="수량감소" class="down" /></a>
                            </span>
                            <a href="#none"><img src="http://img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
                        </td>
                        <td class="right">
                            <span>$가격</span>
                            <span class="mileage">(<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_pay_point.gif" /> &nbsp;<span class="mileage_price">$적립금</span>)</span>
                        </td>
                    </tr -->
						</tbody>
						<!-- //참고 -->
						<tfoot>
							<tr>
								<td colspan="3"><strong>총 상품금액</strong>(수량) : <span
									class="total"><strong><em>0</em></strong> (0개)</span></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- //참고 -->

				<!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
				<div class="xans-element- xans-product xans-product-action ">
					<div class="btnArea">
						<li class="dj_btn_buy"><a href="#none" class="first "
							onclick="product_submit(1, '/exec/front/order/basket/', this)">바로구매하기</a></li>
						<li class="dj_btn_cart"><a id="cartBtn" href="#none" class=""
							onclick="product_submit(2, '/exec/front/order/basket/', this)">장바구니담기</a></li>
						<span class="displaynone"><img
							src="http://img.echosting.cafe24.com/design/skin/default/product/btn_sold_out.gif"
							alt="SOLD OUT"></span>
					</div>
					<!-- Mobon Shop Log Tracker v3.1 start -->
					<script type="text/javascript">
					<!--
						function mobRfShop() {
							var sh = new EN();
							// [상품상세정보]
							sh
									.setData("sc",
											"d98912a57a3ed844c1eb3707f34aa2ff");
							sh.setData("userid", "phonecloset2");
							sh.setData("pcode", "3658");
							sh.setData("price", "11000");
							sh
									.setData(
											"pnm",
											encodeURIComponent(encodeURIComponent("하트 포켓 케이스")));
							sh
									.setData(
											"img",
											encodeURIComponent("//jellychu.kr/web/product/medium/201905/ba48a7fbdf42119d9327992f8ae370c6.gif"));
							sh
									.setData(
											"cate1",
											encodeURIComponent(encodeURIComponent(sh
													.getParam(location.href,
															"cate_no"))));
							sh.setSSL(true);
							sh.sendRfShop();

							// 장바구니 버튼 클릭 시 호출 메소드(사용하지 않는 경우 삭제)
							document.getElementById("cartBtn").onmouseup = sendCart;
							function sendCart() {
								sh.sendCart();
							}
							// 찜,Wish 버튼 클릭 시 호출 메소드(사용하지 않는 경우 삭제)
							document.getElementById("wishBtn").onmouseup = sendWish;
							function sendWish() {
								sh.sendWish();
							}
						}
					//-->
					</script>
					<script src="https://cdn.megadata.co.kr/js/enliple_min2.js"
						defer="defer" onload="mobRfShop()"></script>
					<!-- Mobon Shop Log Tracker v3.1 end  -->
					<!-- 네이버 체크아웃 구매 버튼 -->
					<div id="NaverChk_Button"></div>
					<!-- //네이버 체크아웃 구매 버튼 -->


				</div>
				<!-- //참고 -->
			</div>
		</div>
	</div>
</body>
</html>