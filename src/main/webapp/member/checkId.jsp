<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���θ�</title>
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
			<font size="2">${id }�� �̹� ������� ���̵��Դϴ�</font>
		</td>
	</tr>
</table>
<form action="./member.me?method=checkId" method="post" name="checkForm">
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
			<font size="2">�ٸ� ���̵� �Է��ϼ���</font><p>
			<input type="text" size="10" maxlength="12" name="id"/>
			<input type="submit" value="�ߺ�Ȯ��"/>
		</td>
	</tr>
</table>
</form>
</c:when>
<c:otherwise>
<table width="360" border="0" cellspacing="0" cellpadding="5">
	<tr>
		<td align="center">
		<font size="2">�Է��Ͻ� ${id }�� ����� �� �ִ� ���̵��Դϴ�</font>
		<br/><br/>
			<input type="button" value="�ݱ�" onclick="windowclose()"/>
		</td>
	</tr>
</table>
</c:otherwise>
</c:choose>
</body>
</html>