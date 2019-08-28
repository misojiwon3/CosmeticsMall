<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String id = (String)session.getAttribute("loginID");
	String img_path = "/shopping/resources/image/product/productImages/";
	String img_path_cart_button = "/shopping/resources/image/cart/_button";
	int totalPrice = 0;
	int num = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
var amount = new Array();

function changeAmount(num, b){
	amount[num] = document.getElementById(num).value;
	if(b == 1){
		amount[num]++;
	}else if(b == -1){
		if(amount[num] > 1) amount[num]--;
	}
	document.getElementById(num).value = amount[num];
}
function deleteSelected(){
	var checkedProduct = document.getElementsByName('checkedProduct');	
	var products = "";
	
	for( var i = 0; i < checkedProduct.length; i++){		
		if(checkedProduct[i].checked){
			products += document.getElementsByName('checkedProduct')[i].value+",";
		}
	}
	if(products.length == 0){
		alert('상품을 선택하세요');
		return ;
	}
	location.href="cart.ct?method=deleteProduct&products="+products;
}
function orderSelected(){	
	var checkedProduct = document.getElementsByName('checkedProduct');	
	var products = "";
	
	for( var i = 0; i < checkedProduct.length; i++){		
		if(checkedProduct[i].checked){
			products += document.getElementsByName('checkedProduct')[i].value+",";
		}
	}
	if(products.length == 0){
		alert('상품을 선택하세요');
		return ;
	}
	location.href="order.or?method=addOrder&products="+products;
}
function orderAll(){
	var checkedProduct = document.getElementsByName('checkedProduct');
	var products = "";
	for(var i = 0; i < checkedProduct.length; i++){	
		products += document.getElementsByName('checkedProduct')[i].value+",";		
	}
	location.href="order.or?method=addOrder&products="+products;
}
function orderNow(num){
	location.href="order.or?method=orderNow&num="+num+"&amount="+document.getElementById(num).value;
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=id %>님의 장바구니</title>
<script src="/shopping/resources/js/jquery.js" type="text/javascript"></script>
<script>
	$(document).ready(function(){
		$('.checkAll').click(function(){
			$('.checkedProduct').prop('checked', this.checked);
		});	
	});
</script>
<style type="text/css">
	a { text-decoration : none; }
	div.orderList { width : 927px; margin : auto ; }
	table { text-align : center ; }
	table.orderList tr td{ text-valign : middle; }
	.orderListTop { border-top : 1px solid #e4e4e4; }
	.orderList { border-top : 1px solid #e4e4e4; height : 100px ; }
	.orderCheck { width : 927px ; height : 80px ; border-top : 1px solid #e4e4e4; border-bottom : 1px solid #e4e4e4; }
	.orderCheck font { font-size : 25px ; }
	.orderCheck span { font-size : 19px ; }
	.button { margin : 2px; }
	.amount { width : 50px ; text-align : center; font-weight : bold ; font-size : 11px; vertical-align : top; }
	.modifyAmount { border : 1px solid #e4e4e4; }
	.left { height : 45px; margin-top : 10px; float : left ; }
	.right { height : 45px; margin-top : 10px; float : right; }
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<div class="orderList">
<h2>장바구니</h2><br><hr><br>
<h3>주문리스트</h3>
<table class="orderListTop">
	<tr height="30px">
		<td width="30px"><input type="checkbox" class="checkAll"></td>
		<td colspan="2" width="450px">상품명</td><td width="119px">수량</td><td width="119px">판매가</td><td width="119px">적립포인트</td><td width="120px">선택</td>
	</tr>
</table>
<table class="orderList">
	<c:forEach var="cart" items="${cartList }">
	<tr height=100>
		<td width="30px"><input type="checkbox" name="checkedProduct" class="checkedProduct" value="${cart.getNum() }"></td>
		<td width="100px"><a href="product.pr?method=getProduct&num=${cart.getNum() }"><img src="<%=img_path %>${cart.getProductImage() }" width=100 height=100/></a></td>
		<td width="320px"><a href="product.pr?method=getProduct&num=${cart.getNum() }">${cart.getProductName() }</a></td>
		<td width="119px">
			<table border="0" align="center">
				<tr>
					<td rowspan="2">
						<input class="amount" name="modifyAmount" id="${cart.getNum() }" type="text" value="${cart.getAmount() }">
					</td>
					<td height=7px>
						<input type="image" src="<%=img_path_cart_button %>/amount/cartAmountUp.jpg" onclick="changeAmount(${cart.getNum() }, 1);">
					</td>
				</tr>
				<tr><td height=7px><input type="image" src="<%=img_path_cart_button %>/amount/cartAmountDown.jpg" onclick="changeAmount(${cart.getNum() }, -1);"></td></tr>
				<tr><td colspan="2"><a href="#" onclick="location.href='cart.ct?method=modifyProductAmount&num=${cart.getNum() }&amount='+amount[${cart.getNum() }];return false;">
					<img src="<%=img_path_cart_button %>/amount/cartModifyAmount.jpg"></a>
				</td></tr>
			</table>
		</td>
		<td width="119px">${cart.getProductPrice() }</td>
		<td width="119px">${cart.getPoint() * cart.getAmount() }</td>
		<td width="120px">
			<a href="#" onclick="orderNow(${cart.getNum() });"><img 
				class="button" src="<%=img_path_cart_button %>/cartOrderNowButton.jpg"/></a>
			<a href="#"><img 
				class="button" src="<%=img_path_cart_button %>/cartWishListButton.jpg"/></a>
			<a href="cart.ct?method=deleteProduct&products=${cart.getNum() }"><img 
				class="button" src="<%=img_path_cart_button %>/cartDeleteProductButton.jpg"/></a>
		</td>
	</tr>
	</c:forEach>
</table>
<table class="orderCheck">
	<fmt:formatNumber var="allPriceCurr" value="${allPrice }" pattern="###,###,###"/>
	<tr><td></td>
		<td width=200px><span>적립 예정 포인트&nbsp;&nbsp;</span></td>
		<td width=150px><font color="#f60b7d"><b>${allPoint }점</b></font></td>
	</tr>
	<tr>
		<td></td>
		<td width=160px><span>총 주문금액&nbsp;&nbsp;</span></td>
		<td width=170px><font color="#f60b7d"><b>${allPriceCurr }원</b></font></td>
	</tr>
</table>
<div class="left">
<a href="javascript:deleteSelected();"><input type="image" src="<%=img_path_cart_button %>/cartDeleteSelected.jpg"></a>	<!-- 선택상품 삭제 -->
<input type="image" src="<%=img_path_cart_button %>/cartWishListSelected.jpg">	<!-- 선택상품 위시리스트로 -->
</div>
<div class="right">
<a href="javascript:history.go(-1);">
<input type="image" src="<%=img_path_cart_button %>/cartShoppingMore.jpg"></a>				<!-- 쇼핑 계속하기 -->
<input type="image" src="<%=img_path_cart_button %>/cartOrderSelected.jpg" onclick="orderSelected();">	<!-- 선택상품 주문 -->
<input type="image" src="<%=img_path_cart_button %>/cartOrderAll.jpg" onclick="orderAll();" >	<!-- 전체상품 주문 -->
</div>
</div>
</body>
</html>