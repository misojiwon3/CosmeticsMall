<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>쇼핑몰</title>
<script>
function windowclose(){
	self.close();
}
</script>
<style type="text/css">
	 @font-face {
    	font-family : 'arita-bold' ;
    	src : url('/shopping/resources/font/arita-SemiBold.ttf') ;
    }
    @font-face {
    	font-family : 'arita-light' ;
    	src : url('/shopping/resources/font/Light.ttf') ;
    }
	* {
		font-family : 'arita-bold';
		font-size : 15px;
		text-align : center;
	}
</style>
</head>
<body>
<c:choose>
<c:when test="${check eq 1}">
	

<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr align="center">
		<td height="30">
			<font size="2">${id }는 이미 사용중인 아이디입니다</font>
		</td>
	</tr>
</table>
<form action="./member.me?method=checkId" method="post" name="checkForm">
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<font size="2">다른 아이디를 입력하세요</font><p>
			<input type="text" size="10" maxlength="12" name="id"/>
			<input type="submit" value="중복확인"/>
		</td>
	</tr>
</table>
</form>
</c:when>
<c:otherwise>
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		<font size="2">입력하신 ${id }는 사용할 수 있는 아이디입니다</font>
		<br/><br/>
			<input type="button" value="닫기" onclick="windowclose()"/>
		</td>
	</tr>
</table>
</c:otherwise>
</c:choose>
</body>
</html>