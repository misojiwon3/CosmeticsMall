<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/shopping/resources/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" href="/shopping/resources/css/bootstrap-custom.min.css">
<script>
	$(document).ready(function(){
		
		$("#memberListBody tr:odd").css("background", "#fafafa");
		
		$("#memberListTop").css("height", "50px").css("background", "#eeeeee");
		
		$("#memberListBody tr td").css("height", "40px");
		
		$("#back").click(function(){
			history.back();
		});
		
		$("input[type=button]").css("align", "center");
		
	});
</script>
<style>
	table tr {
		height : 25px;
	}
	#memberList {
		width : 800px;
		margin : auto;
	}
	#back {
		float : right;
	}
	#memberListTop, #memberListBody {
		width : 800px;
		text-align : center;
		border-bottom : 1px solid #ddd;
	}
	#memberListBody tr td table tr td:nth-child(0){
		background-color : #eee;
	}
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<div id="memberList">
<h2>회원 목록</h2>
<ul class="nav nav-tabs" role="tablist">
    <li><a href="member.me?method=getMemberList">회원관리</a></li>
    <li><a href="product.pr?method=getAllProductList">제품관리</a></li>
    <li><a href="product.pr?method=addProductPage">제품등록</a></li>
</ul>
<table id="memberListTop" align="center">
	<tr>
		<td width="110px">아이디</td>
		<td width="110px">이름</td>
		<td width="70px">성별</td>
		<td width="130px">생년월일</td>
		<td width="210px">이메일</td>
		<td width="170px">휴대전화</td>
	</tr>
</table>
<table id="memberListBody" align="center" border="0">
	<c:forEach var="member" items="${memberList }">
	<tr>
		<td width="110px">${member.getId() }</td>
		<td width="110px">${member.getName() }</td>
		<td width="70px">${member.getGender() }</td>
		<td width="130px">${member.getBirth_year() }/${member.getBirth_month() }/${member.getBirth_day() }</td>
		<td width="210px">${member.getEmail1() }@${member.getEmail1() }</td>
		<td width="170px">${member.getCellphone1() }-${member.getCellphone2() }-${member.getCellphone3() }</td>
	</tr>
	</c:forEach>
</table>
<input type="button" id="back" value="뒤로">
</div>
</body>
</html>