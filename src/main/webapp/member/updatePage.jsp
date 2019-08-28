<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보 수정</title>
<style type="text/css">
	.title {
		width : 780px ;
		margin : auto ; 
	}
	.button {
		width : 780px ;
		margin : auto ; 
	}
	.updateform {
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
function check(){
	var updateform = document.getElementById("updateform");
	
	if(updateform.password.value.length == 0){
		alert("비밀번호를 입력하세요.");
		updateform.password.focus();
		return ;
	}
	if(updateform.password.value != updateform.password2.value){
		alert("비밀번호가 일치하지 않습니다.");
		updateform.password.value="";
		updateform.password2.value="";
		updateform.password.focus();
		return ;
	}
	if(updateform.email1.value.length == 0 || updateform.email2.value.length == 0){
		alert("이메일을 제대로 입력하세요.");
		updateform.email1.focus();
		return ;
	}
	if((updateform.ZIPCODE1.value=="")||(updateform.ZIPCODE1.value.length<3)){
		alert("우편번호 앞의 3자리 입력해 주세요.");
		updateform.ZIPCODE1.focus();
		return ;
	}
	if((updateform.ZIPCODE2.value=="")||(updateform.ZIPCODE2.value.length<3)){
		alert("우편번호 뒤의 3자리 입력해 주세요.");
		updateform.ZIPCODE2.focus();
		return ;
	}
	if(updateform.cellphone1.value.length == 0 || updateform.cellphone2.value.length == 0 || updateform.cellphone3.value.length == 0){
		alert("휴대폰 번호를 입력하세요.");
		updateform.cellphone.focus();
		return ;
	}
	if(updateform.address1.value.length == 0){
		alert("집 주소를 입력하세요.");
		updateform.address1.focus();
		return ;
	}
	if(updateform.address1.value.length == 0){
		alert("상세 주소를 입력하세요.");
		updateform.address2.focus();
		return ;
	}
	updateform.submit();
}

function openConfirmId(updateform){
	var url="./member.me?method=checkId&id="+updateform.id.value;
	if(updateform.id.value.length == 0){
		alert("아이디를 입력하세요.");
		updateform.id.focus();
		return false;
	}
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400,height=150");
	checkIdFlag = 1;
}
function openZipcode(updateform){
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
	document.getElementById("updateform").submit();
}
</script>
</head>
<body>
<jsp:include page="../topMenu/homeMenu.jsp"/>
<br>
<div class="title">
<h2>회원정보 수정</h2>	
</div>
<div class="updateForm">
<table width="780px" cellpadding="0" cellspacing="0" border="0" align="center">
	<tr>
		<td colspan="2">
		<!-- 회원 정보 수정 -->
		<form id="updateform" name="updateform" action="member.me?method=update" method="post">
			<p align="center">
			<table class="form" border="0" width="800px" height="80%">		
			<tr>
				<td width="17%" bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;이름</font></td>
				<td>
					&nbsp;&nbsp;&nbsp;
						${memberVO.getName() }</td>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;성별</font></td>
				<td>&nbsp;&nbsp;&nbsp;
					${memberVO.getGender() }
				</td>
			</tr>
			<tr>
				<td width="17%" bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;생년월일</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					${memberVO.getBirth_year() }년 ${memberVO.getBirth_month() }월 ${memberVO.getBirth_day() }일
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;아이디</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					${memberVO.getId() }
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
					<input type="text" name="email1" size="13" value="${memberVO.getEmail1() }"/>&nbsp;@&nbsp;
					<input type="text" name="email2" size="13" value="${memberVO.getEmail2() }"/>
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
					<input type="text" name="cellphone2" size=7 value="${memberVO.getCellphone2() }">&nbsp;-&nbsp;
					<input type="text" name="cellphone3" size=7 value="${memberVO.getCellphone3() }">
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;우편번호</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="ZIPCODE1" size="6" onkeypress="gNumCheck()" maxlength="3" value="${postnum1 }"/>-
					<input type="text" name="ZIPCODE2" size="6" onkeypress="gNumCheck()" maxlength="3" value="${postnum2 }"/>&nbsp;&nbsp;
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
					<input type="text" name="address1" size="50" value="${memberVO.getAddress1() }"/>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5">
					<font size="2">&nbsp;&nbsp;&nbsp;&nbsp;상세 주소</font>
				</td>
				<td colspan="3">
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="address2" size="50" value="${memberVO.getAddress2() }"/>
				</td>
			</tr>
			</table>
		</form>
		<!-- 회원정보수정 -->
		</td>
	</tr>
</table>
</div>
	<table class="button">
		<tr>
			<td align="center"><br />
			<input type="button" value="수정" onclick="check();" /></td>
		</tr>
	</table>
</body>
</html>