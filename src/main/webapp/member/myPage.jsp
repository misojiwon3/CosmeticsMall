<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String img_path_shipping = "/shopping/resources/image/mypage";
	String id = (String)session.getAttribute("loginID");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	a {
		text-decoration : none;
	}
	b {
		font-size : 18px;
	}
	.leftmenu {
		margin : 2px;
	}
	.progression {
		text-align : center;
	}
	.ownPoint {
		border-top : 2px solid black;
		border-bottom : 2px solid black;
		width : 720px;
	}
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<table width=927 align="center">
<tr>
<!-- 왼쪽 메뉴 -->
	<td class="leftMenu" valign="top" width="207">
		<h2>마이페이지</h2>
		<hr>
		<b>포인트</b><br>
		<a href="#">&nbsp;&nbsp;포인트 조회</a><br>
		<b>주문</b><br>
		<a href="#">&nbsp;&nbsp;주문 조회</a><br>
		<a href="#">&nbsp;&nbsp;취소/반품/교환</a><br>
		<a href="#">&nbsp;&nbsp;WishList</a><br>
		<b>개인정보</b><br>
		<a href="member.me?method=updatePage">&nbsp;&nbsp;개인정보 수정</a>
	</td>
<!-- 오른쪽 -->
	<td valign="top" width="720">	
		<h2>마이페이지</h2><br><br>	
		<div class="ownPoint">
			<h3>고객정보</h3>
			
		</div>
		<div>
			<table class="progression">
			<tr>
				<td width=120px height=60px><img src="<%=img_path_shipping%>/step/payOrder.jpg"/></td>
				<td width=120px height=60px><img src="<%=img_path_shipping%>/step/payCompleteOrder.jpg"/></td>
				<td width=120px height=60px><img src="<%=img_path_shipping%>/step/deliveryReadyOrder.jpg"/></td>
				<td width=120px height=60px><img src="<%=img_path_shipping%>/step/shippingOrder.jpg"/></td>
				<td width=120px height=60px><img src="<%=img_path_shipping%>/step/deliveryCompleteOrder.jpg"/></td>
				<td width=120px height=60px><img src="<%=img_path_shipping%>/step/completePurchaseOrder.jpg"/></td>				
			</tr>
			<tr>
				<td>결제접수</td><td>결제완료</td><td>배송준비중</td><td>배송중</td><td>배송완료</td><td>구매완료</td>
			</tr>
			</table>
		</div>			
	</td>
</tr>
</table>
</body>
</html>