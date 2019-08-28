<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.shopping.order.OrderVO" %>
<%
	String id = (String)session.getAttribute("loginID");
	String img_path = "/shopping/resources/image/product/productImages/";
	String img_path_cart_button = "/shopping/resources/image/cart/_button";
	String img_path_pay_button = "/shopping/resources/image/pay/_button";
	List<OrderVO> orderList = (List<OrderVO>)request.getAttribute("orderList");
	String[] cellphone = orderList.get(0).getCellphone().split("-");
	String[] email = orderList.get(0).getEmail().split("@");
	String[] postnum = orderList.get(0).getPostnum().split("-");
	String[] address = orderList.get(0).getAddress().split(",");
	int totalPrice = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=id %>님의 주문리스트</title>
<script>
function sameAddr(){
	document.getElementsByName("r_memberName")[0].value = document.getElementsByName("p_memberName")[0].value;
	document.getElementsByName("r_cellphone1")[0].value = document.getElementsByName("p_cellphone1")[0].value;
	document.getElementsByName("r_cellphone2")[0].value = document.getElementsByName("p_cellphone2")[0].value;
	document.getElementsByName("r_cellphone3")[0].value = document.getElementsByName("p_cellphone3")[0].value;
	document.getElementsByName("r_email1")[0].value = document.getElementsByName("p_email1")[0].value;
	document.getElementsByName("r_email2")[0].value = document.getElementsByName("p_email2")[0].value;
	document.getElementsByName("r_postnum1")[0].value = document.getElementsByName("p_postnum1")[0].value;
	document.getElementsByName("r_postnum2")[0].value = document.getElementsByName("p_postnum2")[0].value;
	document.getElementsByName("r_address1")[0].value = document.getElementsByName("p_address1")[0].value;
	document.getElementsByName("r_address2")[0].value = document.getElementsByName("p_address2")[0].value;
}
function newAddr(){
	document.getElementsByName("r_memberName")[0].value = "";
	document.getElementsByName("r_cellphone1")[0].value = "";
	document.getElementsByName("r_cellphone2")[0].value = "";
	document.getElementsByName("r_cellphone3")[0].value = "";
	document.getElementsByName("r_email1")[0].value = "";
	document.getElementsByName("r_email2")[0].value = "";
	document.getElementsByName("r_postnum1")[0].value = "";
	document.getElementsByName("r_postnum2")[0].value = "";
	document.getElementsByName("r_address1")[0].value = "";
	document.getElementsByName("r_address2")[0].value = "";
}
var name = "";
var price = 0;
function pay(){	
	var name = document.getElementsByName("r_memberName")[0].value;
	var cellphone1 = document.getElementsByName("r_cellphone1")[0].value;
	var cellphone2 = document.getElementsByName("r_cellphone2")[0].value;
	var cellphone3 = document.getElementsByName("r_cellphone3")[0].value;
	var email1 = document.getElementsByName("r_email1")[0].value;
	var email2 = document.getElementsByName("r_email2")[0].value;
	var postnum1 = document.getElementsByName("r_postnum1")[0].value;
	var postnum2 = document.getElementsByName("r_postnum2")[0].value;
	var address1 = document.getElementsByName("r_address1")[0].value;
	var address2 = document.getElementsByName("r_address2")[0].value;
	var required = document.getElementsByName("required")[0].value;
		
	if(name.length == 0 || name == ""){
		alert('수령자 이름을 입력하세요');
		return ;
	}
	if(cellphone1.length == 0 || cellphone1 == ""){
		alert('전화번호를 정확히 입력하세요');
		return ;
	}
	if(cellphone2.length == 0 || cellphone2 == ""){
		alert('전화번호를 정확히 입력하세요');
		return ;
	}
	if(cellphone3.length == 0 || cellphone3 == ""){
		alert('전화번호를 정확히 입력하세요');
		return ;
	}
	if(email1.length == 0 || email1 == ""){
		alert('이메일을 정확히 입력하세요');
		return ;
	}
	if(email2.length == 0 || email2 == ""){
		alert('이메일 정확히 입력하세요');
		return ;
	}
	if(postnum1.length == 0 || postnum1 == ""){
		alert('우편번호를 정확히 입력하세요');
		return ;
	}
	if(postnum2.length == 0 || postnum2 == ""){
		alert('우편번호를 정확히 입력하세요');
		return ;
	}
	if(address1.length == 0 || address1 == ""){
		alert('주소를 정확히 입력하세요');
		return ;
	}
	if(address2.length == 0 || address2 == ""){
		alert('주소를 정확히 입력하세요');
		return ;
	}
	return true;
}
function goPay(name, price){
	var p_name = document.getElementsByName("p_memberName")[0].value;
	var p_email = document.getElementsByName("p_email1")[0].value +"@"+ document.getElementsByName("p_email2")[0].value;
	var p_phone = document.getElementsByName("p_cellphone1")[0].value +"-"+document.getElementsByName("p_cellphone2")[0].value+"-"+document.getElementsByName("p_cellphone3")[0].value;
	var r_name = document.getElementsByName("r_memberName")[0].value;
	var r_address = document.getElementsByName("r_address1")[0].value +","+ document.getElementsByName("r_address2")[0].value;
	var r_phone = document.getElementsByName("r_cellphone1")[0].value +"-"+document.getElementsByName("r_cellphone2")[0].value+"-"+document.getElementsByName("r_cellphone3")[0].value;
	var required = document.getElementsByName("required")[0].value;
	
	var url = "./product.pr?method=pay&pName="+name+"&price="+price+"&p_name="+p_name+"&p_email="+p_email+"&p_phone="+p_phone
			+"&r_name="+r_name+"&r_address="+r_address+"&r_phone="+r_phone+"&required="+required;
	
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=350,height=510");
}
</script>
<style>
	a {
		text-decoration : none;
	}
	.orderList {
		width : 927px ;
		margin : auto ;
	}
	.orderListTB{
		text-align : center;
		width : 927px;
		margin : auto;
		border-bottom : 1px solid black;
	}
	.orderListTop {
		text-align : center;
		height : 50px;
		width : 927px;
		border-top : 1px solid black;
		border-bottom : 1px solid black;
	}
	.purchaserInfoTB{
		border-top : 1px solid black;
		border-bottom : 1px solid black;
	}
	.purchaserInfoTB tr{
		height : 40px;
	}
	.receiverInfoTB{
		border-top : 1px solid black;
		border-bottom : 1px solid black;
	}
	.receiverInfoTB tr{
		height : 40px;
	}
	#purchaserInfo {
		width : 927px;
		margin : auto;
	}
	#receiverInfo {
		width : 927px;
		margin : auto;
	}
	#pay {
		width : 927px;
		height : 45px; 
		margin : auto;
	}
	#pay input {
		float : right;
		margin-top : 10px;
	}
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<div class="orderList">
	<h2>주문결제</h2><br><br>
	<h3>주문제품 조회</h3>
	<table border="0" class="orderListTop">
		<tr height="30px">
			<td colspan="2" width="480px">상품명</td><td width="110px">수량</td><td width="112px">판매가</td><td width="112px">적립포인트</td><td width="113px">주문금액</td>
		</tr>
	</table>
	<table border="0" class="orderListTB">
		<c:set var="totalPrice" value="0"/>
		<c:set var="names" value=""/>
		<c:forEach var="order" items="${orderList }">
		<tr height=100>
			<td width="100px"><a href="product.pr?method=getProduct&num=${order.getNum() }"><img src="<%=img_path %>${order.getProductImage() }" width=100px height=100px/></a></td>
			<td width="380px"><a href="product.pr?method=getProduct&num=${order.getNum() }">${order.getProductName() }</a></td>
			<td width="110px">${order.getProductAmount() }</td>
			<td width="112px">${order.getProductPrice() }</td>
			<td width="112px">${order.getTotalPoint() }</td>
			<td width="113px">${order.getTotalPrice() }</td>
			<c:set var="totalPrice" value="${totalPrice + order.getTotalPrice() }"/>
			<c:set var="names" value="${order.getProductName() }"/>
		</tr>
		</c:forEach>
	</table>
</div>
<br><br><br>
<input type="hidden" name="p_memberName" value="${orderList.get(0).getMemberName() }">
<input type="hidden" name="p_cellphone1" value="<%=cellphone[0] %>">
<input type="hidden" name="p_cellphone2" value="<%=cellphone[1] %>">
<input type="hidden" name="p_cellphone3" value="<%=cellphone[2] %>">
<input type="hidden" name="p_email1" value="<%=email[0] %>">
<input type="hidden" name="p_email2" value="<%=email[1] %>">
<input type="hidden" name="p_postnum1" value="<%=postnum[0] %>">
<input type="hidden" name="p_postnum2" value="<%=postnum[1] %>">
<input type="hidden" name="p_address1" value="<%=address[0] %>">
<input type="hidden" name="p_address2" value="<%=address[1] %>">
<div id="purchaserInfo">
	<h3>구매자 정보</h3>
	<table class="purchaserInfoTB">
		<tr>
			<td width="127px">이름</td>
			<td width="800px">${orderList.get(0).getMemberName() }</td>
		</tr>
		<tr>
			<td width="127px">휴대폰</td>
			<td width="800px"><%=cellphone[0] %>-<%=cellphone[1] %>-<%=cellphone[2] %></td>
		</tr>
		<tr>
			<td width="127px">이메일</td>
			<td width="800px"><%=email[0] %>&nbsp;@&nbsp;<%=email[1] %></td>
		</tr>
		<tr>
			<td rowspan="3" width="127px">주소</td>
			<td width="800px"><%=postnum[0] %>&nbsp;-&nbsp;<%=postnum[1] %><br>
				<%=address[0] %>, <%=address[1] %>
			</td>
		</tr>
	</table>
</div>
<br><br><br>
<div id="receiverInfo">
	<h3>수령자 정보</h3>
	<table class="receiverInfoTB">
		<tr>
			<td width="127px">배송지 선택</td>
			<td width="800px">
				<input type="radio" class="sameAddr" name="checkAddr" value="same" onclick="javascript:sameAddr();"/>주문 고객과 동일
				<input type="radio" name="checkAddr" value="new" onclick="javascript:newAddr();"/>신규배송지
			</td>
		</tr>
		<tr>
			<td width="127px">이름</td>
			<td width="800px"><input type="text" name="r_memberName" value=""/></td>
		</tr>
		<tr>
			<td width="127px">휴대폰</td>
			<td width="800px">
				<input type="text" name="r_cellphone1" value="" size=6>&nbsp;-&nbsp;
				<input type="text" name="r_cellphone2" value="" size=7>&nbsp;-&nbsp;
				<input type="text" name="r_cellphone3" value="" size=7>
			</td>			
		</tr>
		<tr>
			<td width="127px">이메일</td>
			<td width="800px">
				<input type="text" name="r_email1" value="" size=12>&nbsp;@&nbsp;
				<input type="text" name="r_email2" value="" size=12>
			</td>
		</tr>
		<tr>
			<td  width="127px">주소</td>
			<td width="800px">
				<input type="text" name="r_postnum1" value="" size=5>&nbsp;-&nbsp;
				<input type="text" name="r_postnum2" value="" size=5><br>
				<input type="text" name="r_address1" value="" size=80><br>
				<input type="text" name="r_address2" value="" size=80>
			</td>
		</tr>
		<tr>
			<td width="127px">배송시 요청사항</td>
			<td width="800px">
				<textarea name="required" cols="79" rows="4"></textarea>
			</td>
		</tr>
	</table>
</div>
<div id="pay">
<input type="image" src="<%=img_path_pay_button %>/pay.jpg" onclick="javascript:if(pay()) { goPay('${names }', ${totalPrice } ) }">
</div>
</body>
</html>