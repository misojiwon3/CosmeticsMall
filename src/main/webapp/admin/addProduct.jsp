<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/shopping/resources/js/jquery.js" type="text/javascript"></script>
<link rel="stylesheet" href="/shopping/resources/css/bootstrap-custom.min.css">
<script>
	$(document).ready(function(){
		
		$(".addProduct tr:even").css("background", "#fafafa");
		
		$("#hiddenTB").hide();		
		
		var i = 0;
		
		$("#addBtn").click(function(){
			$.trClone = $("#hiddenTB tr:eq(0)").clone().html();
			$.newTr = $("<tr>"+$.trClone+"</tr>");
			
			$("#addProduct").append($.newTr);
			
			$(".added:eq("+i+")").prop("name", "desc_image"+i++);
		});		
		
	});
</script>
<script>
function submit(){
	addProductForm.submit();
}
</script>
<style>
	.title {
		margin : auto;
		width : 800px;
		
	}
	.addProduct {
		margin : auto ;
		width : 800px;
	}
	.addProduct table tr {
		height : 40px;
	}
	#addProduct {
		border-bottom : 1px solid #eee;
		border-top : 1px solid #eee;
	}
	#addBtn {
		float : right;
	}
	#delBtn {
		float : right;
	}
	.enroll {
		margin : auto;
		width : 800px;
	}
	.enroll tr td input {
		float : right;
	}
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<div class="title">
<h2>제품 등록</h2>
</div>
<div class="addProduct">
<ul class="nav nav-tabs" role="tablist">
    <li><a href="member.me?method=getMemberList">회원관리</a></li>
    <li><a href="product.pr?method=getAllProductList">제품관리</a></li>
    <li><a href="product.pr?method=addProductPage">제품등록</a></li>
</ul>
<form name="addProductForm" action="product.pr?method=addProduct" method="post" enctype="multipart/form-data">
<div id="addProduct">
<table id="addProduct" border="0">
	<tr>
		<td width="160px">카테고리</td>
		<td width="640px"><input type="text" name="category" size="24"></td>
	</tr>
	<tr>
		<td>제품 번호</td>
		<td><input type="text" name="num" size="24"></td>
	</tr>
	<tr>
		<td>제품 이름</td>
		<td><input type="text" name="name" size="24"></td>
	</tr>
	<tr>
		<td>제품 간단 설명</td>
		<td><input type="text" name="brief" size="100"></td>
	</tr>
	<tr>
		<td>제품 가격</td>
		<td><input type="text" name="price" size="24"></td>
	</tr>
	<tr>
		<td>제품 용량</td>
		<td><input type="text" name="capacity" size="24"></td>
	</tr>
	<tr>
		<td>제품 제조일</td>
		<td><input type="text" name="mfd" size="24"></td>
	</tr>
	<tr>
		<td>제품 상세 설명</td>
		<td><input type="text" name="detail1" size="24" placeholder="용량 및 중량"></td>
	</tr>
	<tr><td></td><td><input type="text" name="detail2" size="24" placeholder="피부타입"></td></tr>
	<tr><td></td><td><input type="text" name="detail3" size="24" placeholder="보관기간"></td></tr>
	<tr><td></td><td><input type="text" name="detail4" size="24" placeholder="개봉 후 사용기한"></td></tr>
	<tr><td></td><td><input type="text" name="detail5" size="24" placeholder="사용방법"></td></tr>
	<tr><td></td><td><input type="text" name="detail6" size="24" placeholder="제조국"></td></tr>
	<tr><td></td><td><input type="text" name="detail7" size="24" placeholder="주요성분"></td></tr>
	<tr><td></td><td><input type="text" name="detail8" size="24" placeholder="심사 필 유무"></td></tr>
	<tr><td></td><td><input type="text" name="detail9" size="24" placeholder="사용할 때 주의사항"></td></tr>
	<tr>
		<td>제품 설명(Text)</td>
		<td><textarea name="desc_text" cols=100px rows=4>none</textarea></td>
	</tr>
	<tr>
		<td>제품 이미지</td>
		<td><input type="file" name="image"></td>
	</tr>
	<tr id="desc_image">
		<td>제품 설명(Image)</td>
		<td><input type="file" name="desc_image">
			<input type="button" id="addBtn" value="추가"></td>
	</tr>
</table>
</div>
</form>
</div>
<table class="enroll">
	<tr>
		<td colspan="2"><input type="button" value="등록" onclick="javascript:submit();"></td>
	</tr>
</table>
<table id="hiddenTB">
	<tr>
		<td>제품 설명(Image)</td>
		<td><input type="file" class="added">
			<input type="button" id="delBtn" value="삭제"></td>
	</tr>
</table>
</body>
</html>