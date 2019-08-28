<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%	
	String img_btn = "/shopping/resources/image/product/_button/";
	String img_path = "/shopping/resources/image/product/productImages/"; 
	String banner_path = "/shopping/resources/image/product/banner/";
	String like_path = "/shopping/resources/image/product/like/";
	int cnt = 0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 2자리의 Category를 1자리의 jstl 변수 두개로 나누는 과정 --> 
<!-- category / 10 의 결과값을 정수형 혹은 내림을 할 수 있는 방식을 찾아서 수정 -->
<c:choose>
	<c:when test="${category < 20 }"><fmt:formatNumber var="first" value="1" pattern="0"/></c:when>
	<c:when test="${category < 30 }"><fmt:formatNumber var="first" value="2" pattern="0"/></c:when>
	<c:when test="${category < 40 }"><fmt:formatNumber var="first" value="3" pattern="0"/></c:when>
	<c:when test="${category < 50 }"><fmt:formatNumber var="first" value="4" pattern="0"/></c:when>
	<c:when test="${category < 60 }"><fmt:formatNumber var="first" value="5" pattern="0"/></c:when>
	<c:when test="${category < 70 }"><fmt:formatNumber var="first" value="6" pattern="0"/></c:when>
	<c:when test="${category < 80 }"><fmt:formatNumber var="first" value="7" pattern="0"/></c:when>
	<c:when test="${category < 90 }"><fmt:formatNumber var="first" value="8" pattern="0"/></c:when>
	<c:when test="${category < 100 }"><fmt:formatNumber var="first" value="9" pattern="0"/></c:when>
</c:choose>
<fmt:formatNumber var="second" value="${category - (first * 10) }" pattern="0" minIntegerDigits="0"/>
<c:choose>
	<c:when test="${first eq 1 }">
		<c:set var="top_banner_path" value="top_skinCare.jpg"/>	
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="스킨"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="로션"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="미스트"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="에센스"/>
			</c:when>
			<c:when test="${second eq 5 }">
				<c:set var="categoryTitle" value="크림"/>
			</c:when>
			<c:when test="${second eq 6 }">
				<c:set var="categoryTitle" value="아이크림"/>
			</c:when>
			<c:when test="${second eq 7 }">
				<c:set var="categoryTitle" value="선케어"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 2 }">
		<c:set var="top_banner_path" value="top_cleansing.jpg"/>	
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="클렌징폼"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="클렌징크림/오일"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 3 }">
		<c:set var="top_banner_path" value="top_mask.jpg"/>	
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="시트마스크"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="슬리핑팩"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="워시오프팩/필오프팩"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="마사지"/>
			</c:when>
			<c:when test="${second eq 5 }">
				<c:set var="categoryTitle" value="필링"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 4 }">
		<c:set var="top_banner_path" value="top_faceMakeup.jpg"/>
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="쿠션"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="BB/CC"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="프라이머/베이스"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="파운데이션"/>
			</c:when>
			<c:when test="${second eq 5 }">
				<c:set var="categoryTitle" value="팩터/파우더"/>
			</c:when>
			<c:when test="${second eq 6 }">
				<c:set var="categoryTitle" value="컨실러"/>
			</c:when>
			<c:when test="${second eq 7 }">
				<c:set var="categoryTitle" value="블러셔/하이라이터"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 5 }">
		<c:set var="top_banner_path" value="top_colorMakeup.jpg"/>
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="립스틱"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="립글로스"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="립틴트"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="립라이너"/>
			</c:when>
			<c:when test="${second eq 5 }">
				<c:set var="categoryTitle" value="마스카라"/>
			</c:when>
			<c:when test="${second eq 6 }">
				<c:set var="categoryTitle" value="아이라이너"/>
			</c:when>
			<c:when test="${second eq 7 }">
				<c:set var="categoryTitle" value="아이섀도"/>
			</c:when>
			<c:when test="${second eq 8 }">
				<c:set var="categoryTitle" value="아이브로우"/>
			</c:when>
			<c:when test="${second eq 9 }">
				<c:set var="categoryTitle" value="네일"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 6 }">
		<c:set var="top_banner_path" value="top_body.jpg"/>
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="클렌저/스크럽"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="로션/오일/크림"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="풋/핸드"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="제모/데오"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 7 }">
		<c:set var="top_banner_path" value="top_hair.jpg"/>
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="헤어에센스/미스트"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="헤어스타일링"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="헤어컬러링"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="샴푸"/>
			</c:when>
			<c:when test="${second eq 5 }">
				<c:set var="categoryTitle" value="트리트먼트"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 8 }">
		<c:set var="top_banner_path" value="top_perfume.jpg"/>
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="퍼퓸"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="샤워코롱"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="룸 프래그런스"/>
			</c:when>
		</c:choose>
	</c:when>
	<c:when test="${first eq 9 }">
		<c:set var="top_banner_path" value="top_props.jpg"/>	
		<c:choose>
			<c:when test="${second eq 1 }">
				<c:set var="categoryTitle" value="스킨케어소품"/>
			</c:when>
			<c:when test="${second eq 2 }">
				<c:set var="categoryTitle" value="메이크업소품"/>
			</c:when>
			<c:when test="${second eq 3 }">
				<c:set var="categoryTitle" value="바디&헤어소품"/>
			</c:when>
			<c:when test="${second eq 4 }">
				<c:set var="categoryTitle" value="네일소품"/>
			</c:when>
		</c:choose>
	</c:when>
</c:choose>
<!--------- 카테고리 번호 나누기 끝 -------------------------------->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${categoryTitle }</title>
<style>
	a {
		text-decoration : none;	
		font-size : 18px;
	}
	.productName {
		font-size : 15px;
	}
	.productPrice {
		font-size : 13px;
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
<table width=927px height=610px align="center" border="0">
<tr>
<!-- 왼쪽 메뉴 -->
	<td valign="top" width="207">
		<h2>${categoryTitle }</h2>		
		<hr>
		<c:choose>
			<c:when test="${first eq 1}">
				<a href="category.ca?method=getProductList&category=11">스킨</a><br>
		        <a href="category.ca?method=getProductList&category=12">로션</a><br>
		        <a href="category.ca?method=getProductList&category=13">미스트</a><br>
		        <a href="category.ca?method=getProductList&category=14">에센스</a><br>
		        <a href="category.ca?method=getProductList&category=15">크림</a><br>
		        <a href="category.ca?method=getProductList&category=16">아이크림</a><br>
		        <a href="category.ca?method=getProductList&category=17">선케어</a><hr>
	        </c:when>
	        <c:when test="${first eq 2}">
				<a href="category.ca?method=getProductList&category=21">클렌징폼</a><br>
		        <a href="category.ca?method=getProductList&category=22">클렌징크림/오일</a><br><hr>
	        </c:when>
	        <c:when test="${first eq 3}">
				<a href="category.ca?method=getProductList&category=31">시트마스크</a><br>
		        <a href="category.ca?method=getProductList&category=32">슬리핑팩</a><br>
		        <a href="category.ca?method=getProductList&category=33">워시오프팩/필오프팩</a><br>
		        <a href="category.ca?method=getProductList&category=34">마사지</a><br>
		        <a href="category.ca?method=getProductList&category=35">필링</a><br><hr>
	        </c:when>
	        <c:when test="${first eq 4}">
				<a href="category.ca?method=getProductList&category=41">쿠션</a><br>
		        <a href="category.ca?method=getProductList&category=42">BB/CC</a><br>
		        <a href="category.ca?method=getProductList&category=43">프라이머/베이스</a><br>
		        <a href="category.ca?method=getProductList&category=44">파운데이션</a><br>
		        <a href="category.ca?method=getProductList&category=45">팩터/파우더</a><br>
		        <a href="category.ca?method=getProductList&category=46">컨실러</a><br>
		        <a href="category.ca?method=getProductList&category=47">블러셔/하이라이터</a><hr>
	        </c:when>
	        <c:when test="${first eq 5}">
				<a href="category.ca?method=getProductList&category=51">립스틱</a><br>
		        <a href="category.ca?method=getProductList&category=52">립글로스</a><br>
		        <a href="category.ca?method=getProductList&category=53">립틴트</a><br>
		        <a href="category.ca?method=getProductList&category=54">립라이너</a><br>
		        <a href="category.ca?method=getProductList&category=55">마스카라</a><br>
		        <a href="category.ca?method=getProductList&category=56">아이라이너</a><br>
		        <a href="category.ca?method=getProductList&category=57">아이섀도</a><br>
		        <a href="category.ca?method=getProductList&category=58">아이브로</a><br>
		        <a href="category.ca?method=getProductList&category=59">네일</a><br><hr>
	        </c:when>
	        <c:when test="${first eq 6}">
				<a href="category.ca?method=getProductList&category=61">클렌저/스크럽</a><br>
		        <a href="category.ca?method=getProductList&category=62">로션/오일/크림</a><br>
		        <a href="category.ca?method=getProductList&category=63">풋/핸드</a><br>
		        <a href="category.ca?method=getProductList&category=64">제모/데오</a><br><hr>
	        </c:when>
	        <c:when test="${first eq 7}">
				<a href="category.ca?method=getProductList&category=71">헤어에센스/미스트</a><br>
		        <a href="category.ca?method=getProductList&category=72">헤어스타일링</a><br>
		        <a href="category.ca?method=getProductList&category=73">헤어컬러링</a><br>
		        <a href="category.ca?method=getProductList&category=74">샴푸</a><br>
		        <a href="category.ca?method=getProductList&category=75">트리트먼트</a><br><hr>
	        </c:when>
	        <c:when test="${first eq 8}">
				<a href="category.ca?method=getProductList&category=81">퍼퓸</a><br>
		        <a href="category.ca?method=getProductList&category=82">샤워코롱</a><br>
		        <a href="category.ca?method=getProductList&category=83">룸 프래그런스</a><br><hr>
	        </c:when>
	        <c:when test="${first eq 9}">
				<a href="category.ca?method=getProductList&category=91">스킨케어소품</a><br>
		        <a href="category.ca?method=getProductList&category=92">메이크업소품</a><br>
		        <a href="category.ca?method=getProductList&category=93">바디/헤어소품</a><br>
		        <a href="category.ca?method=getProductList&category=94">네일소품</a><br><hr>
	        </c:when>
        </c:choose>
	</td>
<!-- 오른쪽 상품 리스트 -->
	<td valign="top" width="720">		
		<table>
			<tr>
				<td width=720 height=93 colspan="4"><img src="<%=banner_path %>${top_banner_path }"></td>
			</tr>
			<tr>
				<c:forEach var="product" items="${productList }">			
					<td width="180" valign="top" >
					<img src="<%=like_path %>productLike.jpg">&nbsp;${product.getNumoflike() }
						<div align="center">
							<a href="product.pr?method=getProduct&num=${product.getNum() }">
								<img src="<%=img_path %>${product.getImage() }" width=180 height=180></a><br>
							<span class="productName">${product.getName() }</span><br>
							<span class="productPrice">${product.getPrice() }원</span>
						</div>
					</td>
		<%			cnt++;
					if(cnt % 4 == 0){ %> 
						</tr><tr> 				
		<%			} %>	
				</c:forEach>
			</tr>
		</table>				
	</td>
</tr>
</table>
<!-- 페이징 -->
<div id="paging">
<br>
<c:set var="amount" value="8"/>
<c:set var="count" value="${count }"/>
<c:set var="total1" value="${count / amount + 1 }"/>
<fmt:formatNumber var="total2" value="${count / amount + 1 }" pattern="0"/>
<c:if test="${total2 >= total1 }">
	<c:set var="totalPage" value="${total2 - 1 }"/>
</c:if>
<c:if test="${total2 < total1 }">
	<c:set var="totalPage" value="${total2 }"/>
</c:if>
<c:if test="${count > amount*5 }"> <!-- 5페이지 이상일때 화살표 버튼 출력 -->
	<input type="image" src="<%=img_btn %>prevPageButton.jpg">
</c:if>
<c:forEach var="page" begin="1" end="${totalPage }" step="1">
	<a href="category.ca?method=getProductList&category=${category }&page=${page }"><c:out value="${page }"/></a>
	<c:if test="${page ne totalPage }">
		<c:out value="  |  "/>
	</c:if>
</c:forEach>
<c:if test="${count > amount*5 }"> <!-- 5페이지 이상일때 화살표 버튼 출력 -->
	<input type="image" src="<%=img_btn %>nextPageButton.jpg">
</c:if>
</div>
<!-- 페이징 -->
</body>
</html>