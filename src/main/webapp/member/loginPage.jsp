<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String preURL = (String)request.getAttribute("preURL");
	System.out.println("preURL loginPage.jsp : " + preURL);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
window.onload = function(){
	document.getElementById("id").focus();
}
function login(){
	loginForm.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style type="text/css">
	.title {
		width : 600px ;
		margin : auto ; 
	}
	.button {
		width : 600px ;
		margin : auto ; 
	}
	.loginform {
		width : 600px ;
		height : 180px ; 
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		margin : auto ; 
	}
	.form {
		height : 50px;
	
	}
</style>
</head>
<body>
<jsp:include page="../topMenu/homeMenu.jsp"/>
<br>
<div class="title">
<h2>로그인</h2>	
</div>
<div class="loginform">
<form action="member.me?method=login" method="post" name="loginForm">
<input type="hidden" name="preURL" value="<%=preURL %>">
<table align="center" border="0" cellpadding="2" cellspacing="2">
	<tr height="30"><td colspan="3"></td></tr>
	<tr height="60" class="form">
		<td width="100">아이디</td>
		<td rowspan="2" width="200">
			<table border="0">
				<tr><td height="50px" width="200px">
					<input type="text" id="id" name="id" size=25/>
				</td></tr>
				<tr><td height="50px" width="200px">
					<input type="password" id="password" name="password" size=25 onKeyPress="if(event.keyCode == 13){login()}"/>
				</td></tr>
			</table>
		</td>
		<td rowspan="2" width=100><a href="javascript:login();"><img src="/shopping/resources/image/login/loginLoginButton.jpg"></a></td>
	</tr>
	<tr height="60" class="form">
		<td>비밀번호</td>
	</tr>
</table>
</form>

</div>
</body>
</html>