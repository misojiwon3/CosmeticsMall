<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
	String img_path = "/shopping/resources/image/product/productImages/";
	String img_btn = "/shopping/resources/image/product/_button/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${word } 검색 결과</title>
<link rel="stylesheet" href="/shopping/resources/css/bootstrap-custom.min.css">
<style>
	#sort a {
		text-decoration : none;
		width : 927px;
		align : center ; 
		margin : auto;
	}
	.container, .productListTBbd {
		width : 927px;
		margin : auto;
	}
	.container {
		border-bottom : 1px solid #ddd;
	}
	.productListTB {
		text-align : center;
		border-bottom : 1px solid #ddd;
	}
	.productListTBbd {
		text-align : center;
		border-bottom : 1px solid #ddd;
	}
	#listHead {
		border-top : 1px solid black;
		border-bottom : 1px solid black;
	}
	.productListTB tr {
		height : 40px;
	}
	#noSearchList {
		height : 50px;
		text-size : 8px;
		text-align : center;
		text-valign : middle;
	}
	#searchedList {
		height : 630px;
	}
	#paging {
		width : 927px;
		height : 50px;
		margin : auto;
		text-align : center;
	}
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<div class="container">     
<h3>[${word }] 검색 결과</h3><br>            
  <ul class="nav nav-tabs" role="tablist">
  	<li><a href="product.pr?method=searchProduct&word=${word }&order=5">선호도순</a></li>
    <li><a href="product.pr?method=searchProduct&word=${word }&order=4">리뷰 많은순</a></li>    
    <li><a href="product.pr?method=searchProduct&word=${word }&order=3">좋아요순</a></li>
    <li><a href="product.pr?method=searchProduct&word=${word }&order=2">낮은 가격순</a></li>
    <li><a href="product.pr?method=searchProduct&word=${word }&order=1">높은 가격순</a></li>
   </ul>
</div>
<div id="searchedList">
<table class="productListTB" width="927" align="center" border="0">
	<tr id="listHead">
		<td width=527px colspan="2">상품 정보</td>
		<td width=100px>상품 가격</td>
		<td width=100px>좋아요</td>
		<td width=100px>리뷰 수</td>
		<td width=100px>선호도</td>
	</tr>
</table>
<table class="productListTBbd">
<c:choose>
	<c:when test="${searchProductList eq '[]' }">
		<div id="noSearchList"><br><font>검색 결과가 없습니다</font></div>
	</c:when>
	<c:when test="${searchProductList ne '[]' }">
		<c:forEach var="product" items="${searchProductList }">
		<tr height=90px>
			<td width=147px>
				<a href="product.pr?method=getProduct&num=${product.getNum() }"><img src="<%=img_path %>${product.getImage() }" width=90px height=90px></a></td>
			<td width=380px>
				<a href="product.pr?method=getProduct&num=${product.getNum() }">${product.getName() }</a></td>
			<td width=100px>${product.getPrice() }</td>
			<td width=100px>${product.getNumoflike() }</td>
			<td width=100px>${product.getReviewCnt() }</td>		
			<c:if test="${product.getReviewCnt() eq 0 }">
				<td width=100px>0</td>
			</c:if>
			<c:if test="${product.getReviewCnt() ne 0 }">
				<td width=100px><fmt:formatNumber value="${product.getTotal_pref() / product.getReviewCnt() }" pattern="0.##"/></td>
			</c:if>		
		</tr>
		</c:forEach>	
	</c:when>
</c:choose>	
</table>
</div>
<!-- 페이징 -->
<div id="paging">
<c:set var="amount" value="6"/>
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
			<a href="product.pr?method=searchProduct&word=${word }&page=${curPage-1 }&order=${order }"><input type="image" src="<%=img_btn %>prevPageButton.jpg"></a>
		</c:when>
	</c:choose>
</c:if>
<!-- 검색 결과 출력 -->
<c:forEach var="page" begin="1" end="${totalPage }" step="1">
	<a href="product.pr?method=searchProduct&word=${word }&page=${page }&order=${order }"><c:out value="${page }"/></a>
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
			<a href="product.pr?method=searchProduct&word=${word }&page=${curPage+1 }&order=${order }"><input type="image" src="<%=img_btn %>nextPageButton.jpg"></a>
		</c:when>
	</c:choose>
</c:if>
</div>
<!-- 페이징 -->
</body>
</html>