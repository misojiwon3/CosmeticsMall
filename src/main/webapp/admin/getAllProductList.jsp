<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.io.PrintWriter" %>
<%
	String id = (String)session.getAttribute("loginID");
	System.out.println(id);
	if(id == null){
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out1 = response.getWriter();
		out1.println("<script>");
		out1.println("alert('세션이 만료되었습니다')");
		out1.println("location.href='./';");
		out1.println("</script>");
	}
	String img_path = "/shopping/resources/image/product/productImages/";
	String img_btn = "/shopping/resources/image/product/_button/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 물품 목록</title>
<link rel="stylesheet" href="/shopping/resources/css/bootstrap-custom.min.css">
<style>
	#getAllProduct {
		margin : auto;
		width : 800px;
	}
	#allProductlistTop, .AllProductList {
		text-align : center;
	}
	#allProductlistTop {
		border-top : 1px solid #ddd;
		border-bottom : 1px solid #ddd;
	}
	#allProductlistTop tr {
		height : 40px;
	}
	#paging {
		width : 800px;
		height : 50px;
		margin : auto;
		text-align : center;
	}
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<div id="getAllProduct">
<h2>전체 물품 목록</h2>
<ul class="nav nav-tabs" role="tablist">
    <li><a href="member.me?method=getMemberList">회원관리</a></li>
    <li><a href="product.pr?method=getAllProductList">제품관리</a></li>
    <li><a href="product.pr?method=addProductPage">제품등록</a></li>
</ul>
<table id="allProductlistTop">
	<tr>
		<td width=40px>번호</td>
		<td width=480px colspan="2">상품</td>
		<td width=80px>가격</td>
		<td width=70px>좋아요</td>
		<td width=70px>선호도</td>
		<td width=60px>삭제</td>
	</tr>
</table>
<table class="AllProductList">
	<c:forEach var="product" items="${allProductList }">
	<tr height=90px>
		<td width=40px>${product.getNum() }</td>
		<td width=120px>
			<a href="product.pr?method=getProduct&num=${product.getNum() }"><img src="<%=img_path %>${product.getImage() }" width=90px height=90px></a></td>
		<td width=360px>
			<a href="product.pr?method=getProduct&num=${product.getNum() }">${product.getName() }</a></td>
		<td width=80px>${product.getPrice() }</td>
		<td width=70px>${product.getNumoflike() }</td>	
		<c:if test="${product.getReviewCnt() eq 0 }">
			<td width=70px>0</td>
		</c:if>
		<c:if test="${product.getReviewCnt() ne 0 }">
			<td width=70px><fmt:formatNumber value="${product.getTotal_pref() / product.getReviewCnt() }" pattern="0.##"/></td>
		</c:if>
		<td width=60px><a href="product.pr?method=delProduct&num=${product.getNum() }">삭제</a></td>	
	</tr>
	</c:forEach>
</table>
</div>
<!-- 페이징 -->
<div id="paging">
<c:set var="amount" value="7"/>
<c:set var="count" value="${count }"/>
<c:set var="total1" value="${count / amount + 1 }"/>
<fmt:formatNumber var="total2" value="${count / amount + 1 }" pattern="0"/>

<c:if test="${total2 >= total1 }">
	<c:set var="totalPage" value="${total2 - 1 }"/>
</c:if>
<c:if test="${total2 < total1 }">
	<c:set var="totalPage" value="${total2 }"/>
</c:if>
<!-- 이전 화살표 출력 -->
<c:if test="${count > amount*5 }"> <!-- 5페이지 이상일때 화살표 버튼 출력 -->
	<c:choose>
		<c:when test="${curPage eq 1 }">
			<input type="image" src="<%=img_btn %>prevPageButton.jpg">
		</c:when>
		<c:when test="${curPage ne 1 }">
			<a href="product.pr?method=getAllProductList&page=${curPage-1 }"><input type="image" src="<%=img_btn %>prevPageButton.jpg"></a>
		</c:when>
	</c:choose>
</c:if>
<!-- 검색 결과 출력 -->
<c:forEach var="page" begin="1" end="${totalPage }" step="1">
	<a href="product.pr?method=getAllProductList&page=${page }"><c:out value="${page }"/></a>
	<c:if test="${page ne totalPage }">
		<c:out value="  |  "/>
	</c:if>
</c:forEach>
<!-- 다음 화살표 출력 -->
<c:if test="${count > amount*5 }"> <!-- 5페이지 이상일때 화살표 버튼 출력 -->
	<c:choose>
		<c:when test="${curPage eq totalPage }">
			<input type="image" src="<%=img_btn %>nextPageButton.jpg">
		</c:when>
		<c:when test="${curPage ne totalPage }">
			<a href="product.pr?method=getAllProductList&page=${curPage+1 }"><input type="image" src="<%=img_btn %>nextPageButton.jpg"></a>
		</c:when>
	</c:choose>
</c:if>
</div>
<!-- 페이징 -->
</body>
</html>