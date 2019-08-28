<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String preURL = (String)request.getAttribute("preURL");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쇼핑몰</title>
<style type="text/css">
	.title {
		width : 780px ;
		margin : auto ; 
	}
	.button {
		width : 780px ;
		margin : auto ; 
	}
	.joinform {
		width : 780px ;
		border-top : 1px solid black;
		border-bottom : 1px solid black;
		margin : auto ;
	}
	.form tr {
		height : 30px;
	}
</style>
<script>
var checkID = 0;

function check(){
	var joinform = document.getElementById("joinform");
	
	if((joinform.name.value=="")||(joinform.name.value.length == 0)){
		alert("이름을 입력해 주세요.");
		joinform.name.focus();
		return false;
	}
	if(!(joinform.gender.value == "남" || joinform.gender.value == "여")){
		alert("성별을 체크해 주세요");
		return ;
	}
	if(joinform.id.value.length == 0){
		alert("아이디를 입력하세요.");
		joinform.id.focus();
		return ;
	}
	if(checkID = 0){
		alert("아이디 중복검사를 해주세요");
		joinform.id.fofus();
		return ;
	}
	if(joinform.password.value.length == 0){
		alert("비밀번호를 입력하세요.");
		joinform.MEMBER_PW.focus();
		return ;
	}
	if(joinform.password.value != joinform.password2.value){
		alert("비밀번호가 일치하지 않습니다.");
		joinform.password.value="";
		joinform.password2.value="";
		joinform.password.focus();
		return ;
	}
	if(joinform.email1.value.length == 0 || joinform.email2.value.length == 0){
		alert("이메일을 제대로 입력하세요.");
		joinform.email1.focus();
		return ;
	}
	if(joinform.cellphone1.value.length == 0 || joinform.cellphone2.value.length == 0 || joinform.cellphone3.value.length == 0){
		alert("휴대폰 번호를 입력하세요.");
		joinform.cellphone1.focus();
		return ;
	}
	if((joinform.ZIPCODE1.value=="")||(joinform.ZIPCODE1.value.length < 3)){
		alert("우편번호 앞의 3자리 입력해 주세요.");
		joinform.ZIPCODE1.focus();
		return ;
	}
	if((joinform.ZIPCODE2.value=="")||(joinform.ZIPCODE2.value.length < 3)){
		alert("우편번호 뒤의 3자리 입력해 주세요.");
		joinform.ZIPCODE2.focus();
		return ;
	}
	if(joinform.address1.value.length == 0){
		alert("집 주소를 입력하세요.");
		joinform.address1.focus();
		return ;
	}
	if(joinform.address2.value.length == 0){
		alert("상세 주소를 입력하세요.");
		joinform.address2.focus();
		return ;
	}
	joinform.submit();
}

function openConfirmId(joinform){
	var url="./member.me?method=checkId&id="+joinform.id.value;
	if(joinform.id.value.length == 0){
		alert("아이디를 입력하세요.");
		joinform.id.focus();
		return false;
	}
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=150");
	checkID = 1;
}
function openZipcode(joinform){
	var url="./member.me?method=zipcode"
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbar=yes, resizable=no,width=410,height=400");
}
function gNumCheck(){
	if(event.keyCode >=48 && event.keyCode <=57){
		return true;
	}else{
		event.returnValue = false;
	}
}
function submit(){
	document.getElementById("postnum").value = document.getElementById("ZIPCODE1").value +"-"+document.getElementById("ZIPCODE2").value;
	document.getElementById("joinform").submit();
}
</script>
</head>
<body>
<jsp:include page="../topMenu/homeMenu.jsp"/>
<br>
<div class="title">
<h2>회원가입</h2>	
</div>
<div class="joinform">
<table width="780px" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td colspan="2">
		<!-- 회원 가입 -->
		<form id="joinform" name="joinform" action="member.me?method=join" method="post">
			<p align="center">
			<table class="form" border="0" width="800px" height="80%">		
			<tr>
				<td width="17%" bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;이름</font>
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="name" size="20"/>
				</td>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;성별</font>
				</td>
				<td>
					&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="남" checked/>남
					<input type="radio" name="gender" value="여"/>여
				</td>
			</tr>
			<tr>
				<td width="17%" bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;생년월일</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<select name="birth_year" size="1">
						<option value="2015" selected>2015</option>
						<c:set var="startYear" value="2014"/>
						<c:forEach var="year" begin="0" end="100" step="1">
						<option value="${startYear - year }">${startYear - year }</option>
						</c:forEach>						
					</select>년&nbsp;
					<select name="birth_month" size="1">
						<option value="1" selected>1</option>
						<c:forEach var="month" begin="2" end="12" step="1">
						<option value="${month }">${month }</option>
						</c:forEach>						
					</select>월&nbsp;
					<select name="birth_day" size="1">
						<option value="1" selected>1</option>
						<c:forEach var="day" begin="2" end="31" step="1">
						<option value="${day }">${day }</option>
						</c:forEach>						
					</select>일
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;아이디</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="id" size="10" maxlength="15"/>
					<input type="button" name="confirm_id" value="중복확인" onclick="openConfirmId(this.form)" />
					<font size="2">아이디는 띄어쓰기 없이 영문/숫자 조합으로</font>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="password" name="password" size="15"/>
					<font size="2">비밀번호는 띄어쓰기 없이 영문/숫자 조합으로</font>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 확인</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="password" name="password2" size="15"/>
					<font size="2">비밀번호는 띄어쓰기 없이 영문/숫자 조합으로 안틀리게</font>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;이메일 주소</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="email1" size="13"/>&nbsp;@&nbsp;
					<input type="text" name="email2" size="13"/>
					<!-- 
					<select name="emailSelecter" id="emailSelecter" size="1"">
						<option value="" selected>직접 입력</option>
						<option value="dreamwiz.com">dreamwiz.com</option>
						<option value="empal.com">empal.com</option>
						<option value="freechal.com">freechal.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="hotmail.com">hotmail.com</option>
						<option value="korea.com">korea.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="chol.com">chol.com</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
						<option value="paran.com">paran.com</option>
						<option value="unitel.co.kr">unitel.co.kr</option>
						<option value="yahoo.co.kr">yahoo.co.kr</option>
					</select>
					 -->
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;휴대폰</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<select name="cellphone1" size="1">
						<option value="010" selected>010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
						<option value="070">070</option>
					</select>&nbsp;-&nbsp;
					<input type="text" name="cellphone2" size=7>&nbsp;-&nbsp;
					<input type="text" name="cellphone3" size=7>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;우편번호</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="ZIPCODE1" size="6" onkeypress="gNumCheck()" maxlength="3"/>-
					<input type="text" name="ZIPCODE2" size="6" onkeypress="gNumCheck()" maxlength="3"/>&nbsp;&nbsp;
					<input type="button" value="우편번호 검색" onclick="openZipcode(this.form)"/>
					<input type="hidden" name="postnum"/>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;집주소</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="address1" size="50"/>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;상세 주소</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="address2" size="50"/>
				</td>
			</tr>
			</table>
		</form>
		<!-- 회원가입 -->
		</td>
	</tr>
</table>
</div>
	<table class="button">
		<tr>
			<td align="center"><br />
			<input type="button" value="확인" onclick="check();" /></td>
		</tr>
	</table>
</body>
</html>