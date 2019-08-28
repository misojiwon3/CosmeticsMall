<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%	
	String id = "";
	if(!((String)session.getAttribute("loginID") == null)){
		id = (String)session.getAttribute("loginID");
	}	
	String img_path = "/shopping/resources/image/product/productImages/";
	String like_path = "/shopping/resources/image/product/like/productLike.jpg";
	String pref_img_path = "/shopping/resources/image/review/";
	String loginID = (String)session.getAttribute("loginID");
	System.out.println("id(getProduct.jsp 상단) : " + loginID);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
var amount = 1;

function changeAmount(b){
	amount = document.getElementById("inputAmount").value;
	if(b == 1){
		amount++;
	}else if(b == -1){
		if(amount> 1) amount--;
	}
	document.getElementById("inputAmount").value = amount;
}
function writeReview(){
	var contentCheck = document.getElementsByName("content")[0].value;
	if(contentCheck == null || contentCheck == ""){
		alert('내용을 입력하세요');
		return ;
	}	
	var pref = 0;
	if(document.getElementsByName("pref")[0].checked){
		pref = 20;
	}else if(document.getElementsByName("pref")[1].checked){
		pref = 40;
	}else if(document.getElementsByName("pref")[2].checked){
		pref = 60;
	}else if(document.getElementsByName("pref")[3].checked){
		pref = 80;
	}else if(document.getElementsByName("pref")[4].checked){
		pref = 100;
	}
	location.href = "review.re?method=review&num=${vo.getNum() }&pref="
			+pref+"&content="+document.getElementsByName("content")[0].value;
}
function writeQNA(){
	var type = 0;
	if(document.getElementsByName("qnatype")[0].checked){
		type = "기타";
	}else if(document.getElementsByName("qnatype")[1].checked){
		type = "교환/변경";
	}else if(document.getElementsByName("qnatype")[2].checked){
		type = "반품/환불/취소";
	}else if(document.getElementsByName("qnatype")[3].checked){
		type = "배송";
	}else if(document.getElementsByName("qnatype")[4].checked){
		type = "상품";
	}
	var content2 = document.getElementsByName("content")[1].value;
	var title = document.getElementsByName("title")[0].value;
	location.href = "qna.qa?method=qna&num=${vo.getNum() }&type="
		+type+"&title="+title+"&content="+content2;
}
function writeQNARe(QNAnum){
	var qnaRe = document.getElementsByName("qnaRe"+QNAnum)[0].value;
	location.href = "qna.qa?method=qnaRe&QNAnum="+QNAnum+"&qnaRe="+qnaRe;
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${vo.getName() }</title>
<link rel="stylesheet" href="/shopping/resources/css/bootstrap-custom.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/shopping/resources/js/jquery.js"></script>
<script>
$(document).ready(function(){
	$(".modal").hide();
});
</script>
<style type="text/css">
	.productInfo { border-top : 1px solid black ; border-bottom : 1px solid black ; background-color : #f8f8f8 ; }
	.productInfo .table1 { height : 400px;}
	#productInfoImg { valign : middle; }
	#productInfoText { valign : middle; }
	#inputAmount { width : 60px ; height : 22px ;  padding : 0px; border : 1px solid #e4e4e4; text-align : center;
		font-weight : bold ; font-size : 11px; line-height : 22px; vertical-align : top; }	
	.minus { border : 1px solid #e4e4e4; }
	.plus { border : 1px solid #e4e4e4; } 
	.totalPrice1 { font-size : 25px; }
	.totalPrice2 { font-size : 25px; color : #f60b7d ; }
	.productDesc { align : center ; width : 927px ; margin : auto ; }
	.productDesc img { align : center ; width : 927px ; }
	.productDetail { align : center ; width : 927px ; margin : auto ; }
	.productDetail table { border-top : 1px solid #9a9a9a ; border-bottom : 1px solid #9a9a9a ; font-family : 'arita-light' ;
		font-size : 15px ; }
	.productDetail table tr { height : 40px ; }
	.type { text-align : center ; background-color : #fafafa; }
	.productReview table, .productQnA table{ text-align : center ; }
	.reviewTableFirst { border-bottom : 1px solid #9a9a9a; }
	.bottom { width : 100% ; height : 100px; margin-top : 40px; background-color : black ; color : white ; }
	.copyright { valign : bottom ; text-align : right ; }
	#reviewBtn, #qnaBtn { width : 109px; float : right; }
	#reviewTop, #qnaTop { border-top : 1px solid #ddd; border-bottom : 1px solid #ddd; }
	#reviewTop tr , #qnaTop tr{ height : 40px; }
	#reviewBody tr, #qnaBody tr { height : 30px; }
	#reviewBody, #qnaBody { border-bottom : 1px solid #ddd; }
	#reviewBtn { background-image : url('./resources/image/product/_button/writeReviewButton.jpg'); }
	#review, #qna { width : 927px; margin : auto; }
</style>
</head>
<body>
<jsp:include page="/topMenu/homeMenu.jsp"/><br>
<!-- 상품 정보 -->
<table width=927 align="center">
	<tr><td><h2>${vo.getName() }</h2></td></tr>
	<tr><td>${vo.getBrief() }&nbsp;&nbsp;<a href="product.pr?method=like&num=${vo.getNum() }"><img src="<%=like_path %>"></a>${vo.getNumoflike() }</td></tr>
	<tr><td>
		<div class="productInfo">	<!-- 상품 이미지, 가격, 포인트, 용량, 수량 등 출력시키는 div -->
			<table class="table1">
				<tr>
					<td width=400 id="productInfoImg">	<!-- 이미지 -->
						<img src="<%=img_path %>${vo.getImage() }" width=380 height=380>
					</td>
					<td width=500 id="productInfoText">	<!-- 상품 정보 -->						
						<table>
							<tr>
								<td width=150 height=30><b>판매 가격</b></td>
								<td width=300>${vo.getPrice() }원</td>
							</tr>
							<tr>
								<td height=30><b>적립 포인트</b></td>
								<td>${vo.getPoint() }P</td>
							</tr>
							<tr>
								<td height=30><b>용량</b></td>
								<td>${vo.getCapacity() }</td>
							</tr>
							<tr>
								<td height=30><b>제조일</b></td>
								<td>${vo.getMfd() }</td>
							</tr>
							<tr>
								<td height=30><b>제품 선호도</b></td>
									<c:if test="${vo.getReviewCnt() eq 0 }">
										<fmt:formatNumber var="pref" value="0" pattern="0"/>
									</c:if>
									<c:if test="${vo.getReviewCnt() ne 0 }">
										<fmt:formatNumber var="pref" value="${vo.getTotal_pref() / vo.getReviewCnt() }" pattern="0"/>
									</c:if>
								<td>${pref } / 100</td>
							</tr>
							<tr>
								<td height=30><b>수량</b></td>
								<td>									
									<span class="selectAmount">
										<input type="image" class="minus" src="/shopping/resources/image/product/_button/minus.jpg" onclick="changeAmount(-1);">
										<input name="amount" id="inputAmount" type="text" value="1">
										<input type="image" class="plus" src="/shopping/resources/image/product/_button/plus.jpg" onclick="changeAmount(1);">
									</span>
								</td>								
							</tr>
							<tr valign="middle">
								<td height=50><b><font class="totalPrice1">합계금액</font></b></td>
								<td><font class="totalPrice2">${vo.getPrice() }원</font></td>
							</tr>
							<tr>
								<td colspan="2"><br>
									<a href="#" onclick="location.href='order.or?method=orderNow&num=${vo.getNum() }&amount='+amount;return false;"><img src="/shopping/resources/image/product/_button/buynowButton.jpg"/></a>&nbsp;<a 
									href="#" onclick="location.href='cart.ct?method=addCart&num=${vo.getNum() }&amount='+amount;return false;"><img src="/shopping/resources/image/product/_button/basketButton.jpg"/></a>&nbsp;<a 
									href="#"><img src="/shopping/resources/image/product/_button/wishlistButton.jpg"/>&nbsp;</a>
								</td>
							</tr>
						</table>
					</td>
			</table>
		</div>
</table>
<div class="productDesc">
<h2>상품정보</h2><hr>
<c:choose>
	<c:when test="${check eq 10 }">
		<c:forEach var="img" items="${descImgList }">
			<img src="<%=img_path %>${img }">
		</c:forEach>
	</c:when>
	<c:when test="${check eq 1 }">
		<table>
		<c:forEach var="text" items="${descTextList }">
			<tr><td>- ${text }</td></tr>
		</c:forEach>
		</table>
	</c:when>
	<c:when test="${check eq 11 }">
		<c:forEach var="img" items="${descImgList }">
			<img src="<%=img_path %>${img }">
		</c:forEach>
		<hr>
		<table>
		<c:forEach var="text" items="${descTextList }">
			<tr><td>- ${text }</td></tr>
		</c:forEach>
		</table>
	</c:when>
</c:choose>
<hr>
</div>
<!-- 상품정보 끝 -->


<!-- 상세정보 -->
<div class="productDetail">
<h2>상세정보</h2>
<table width=927 align="center">
	<tr>
		<td class="type" width=160>용량 및 중량</td>
		<td width=767>&nbsp;&nbsp;${detailList.get(0) }</td>
	</tr>
	<tr>
		<td class="type">피부 타입</td>
		<td>&nbsp;&nbsp;${detailList.get(1) }</td>
	</tr>
	<tr>
		<td class="type">보관 기간(사용기한)</td>
		<td>&nbsp;&nbsp;${detailList.get(2) }</td>
	</tr>
	<tr>
		<td class="type">개봉 후 사용기한</td>
		<td>&nbsp;&nbsp;${detailList.get(3) }</td>
	</tr>
	<tr>
		<td class="type">사용 방법</td>
		<td>&nbsp;&nbsp;${detailList.get(4) }</td>
	</tr>
	<tr>
		<td class="type">제조국</td>
		<td>&nbsp;&nbsp;${detailList.get(5) }</td>
	</tr>
	<tr>
		<td class="type">주요 성분</td>
		<td>&nbsp;&nbsp;${detailList.get(6) }</td>
	</tr>
	<tr>
		<td class="type">기능성 화장품의 경우 화장품법에 따른 식품의약품 안전처 심사 필 유무</td>
		<td>&nbsp;&nbsp;${detailList.get(7) }</td>
	</tr>
	<tr>
		<td class="type">사용할 때 주의사항</td>
		<td>&nbsp;&nbsp;${detailList.get(8) }</td>
	</tr>
</table>
</div>
<!-- 상세정보 끝 -->


<!-- 구매 후기 -->
<div id="review">
<div class="productReview">
<h2>구매후기</h2>
<%if(id.equals("admin")){ %>
<table id="reviewTop" border="0">
	<tr class="reviewTableFirst">
		<td width=127px>제품만족도</td><td width=520px>상품평</td><td width=200px>작성자</td><td width="80px">&nbsp;</td>
	</tr>
</table>
<table id="reviewBody">
	<c:forEach var="review" items="${reviewList }">
		<tr>
			<td width=127px>
				<c:choose>
					<c:when test="${review.getPref() eq 20 }">
						<img src="<%=pref_img_path %>pref1.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 40 }">
						<img src="<%=pref_img_path %>pref2.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 60 }">
						<img src="<%=pref_img_path %>pref3.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 80 }">
						<img src="<%=pref_img_path %>pref4.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 100 }">
						<img src="<%=pref_img_path %>pref5.jpg">
					</c:when>
				</c:choose>
			</td>
			<td width=520px>${review.getContent() }</td>
			<td width=200px>${review.getName() }</td>
			<td width=80px><a href="review.re?method=deleteReview&num=${vo.getNum() }&reviewNum=${review.getReviewNum() }&pref=${review.getPref() }">삭제</a></td>
		</tr>
	</c:forEach>
</table>
<%}else{ %>
<table id="reviewTop" border="0">
	<tr class="reviewTableFirst">
		<td width=127px>제품만족도</td><td width=600px>상품평</td><td width=200px>작성자</td>
	</tr>
</table>
<table id="reviewBody">
	<c:forEach var="review" items="${reviewList }">
		<tr>
			<td width=127px>
				<c:choose>
					<c:when test="${review.getPref() eq 20 }">
						<img src="<%=pref_img_path %>pref1.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 40 }">
						<img src="<%=pref_img_path %>pref2.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 60 }">
						<img src="<%=pref_img_path %>pref3.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 80 }">
						<img src="<%=pref_img_path %>pref4.jpg">
					</c:when>
					<c:when test="${review.getPref() eq 100 }">
						<img src="<%=pref_img_path %>pref5.jpg">
					</c:when>
				</c:choose>
			</td>
			<td width=600px>${review.getContent() }</td>
			<td width=200px>${review.getName() }</td>
		</tr>
	</c:forEach>
</table>
<%} %>
<br>
</div>
<div id="reviewBtn">
<input type="image" src="./resources/image/product/_button/writeReviewButton.jpg" data-toggle="modal" data-target="#myModal">
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        
        <h4 class="modal-title">리뷰 작성</h4>
      </div>
      <div class="modal-body">
      	<table align="center" border="0" cellpadding="0" cellspacing="0">
			<tr height="80px">
				<td colspan="2" align="center">
					<input type="radio" name="pref" value="20"/>
						<img src="<%=pref_img_path %>pref1.jpg">
					<input type="radio" name="pref" value="40"/>
						<img src="<%=pref_img_path %>pref2.jpg">
					<input type="radio" name="pref" value="60"/>
						<img src="<%=pref_img_path %>pref3.jpg">
					<input type="radio" name="pref" value="80"/>
						<img src="<%=pref_img_path %>pref4.jpg">
					<input type="radio" name="pref" value="100" checked/>
						<img src="<%=pref_img_path %>pref5.jpg">
				</td>
			</tr>
			<tr>
				<td width=100px align="center">내용</td>
				<td width=300px><textarea name="content" cols="50" rows="5"></textarea></td>
			</tr>
		</table>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="javascript:writeReview();">등록</button>
      </div>
    </div>    
  </div>
</div>
</div>
</div>
<br><br>
<!-- 구매 후기 끝 -->



<!-- QNA -->
<div id="qna">
<%if(id.equals("admin")){ %>
<div class="productQnA">
<h2>상품QNA</h2>
<table id="qnaTop" border="0">
	<tr class="reviewTableFirst">
		<td width=130px>문의유형</td>
		<td width=400px>제목</td>
		<td width=90px>진행상태</td>
		<td width=90px>작성자</td>
		<td width=137px>등록일</td>
		<td width=80px>관리자</td>
	</tr>
</table>
<div class="accordion" id="accordion2">
<table id="qnaBody" border="0">
	<c:forEach var="qna" items="${qnaList }">
		<tr>
			<td>
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${qna.getQNAnum() }">
			        		<table>
			        			<tr>
			        				<td width=130px>${qna.getType() }</td>
									<td width=400px>${qna.getTitle() }</td>
									<td width=90px>${qna.getState() }</td>
									<td width=90px>${qna.getName() }</td>
									<td width=137px>${qna.getRegdate() }</td>
									<td width=80px><a href="" data-toggle="modal" data-target="#myModal${qna.getQNAnum() }${qna.getQNAnum() }">답글</a></td>
			        			</tr>
			        		</table>
			      		</a>
			    	</div>
				   	<div id="collapse${qna.getQNAnum() }" class="accordion-body collapse">
			    	 	<c:choose>
			    	 		<c:when test="${qna.getQnaRe() eq ' ' }">
			    	 			<div class="accordion-inner">
					        		${qna.getContent() }
				      			</div>
			    	 		</c:when>	
			    	 		<c:when test="${qna.getQnaRe() ne ' ' }">
			    	 			<div class="accordion-inner">
			    	 				[원글]&nbsp;${qna.getContent() }<br><br>
			    	 				[답글]&nbsp;${qna.getQnaRe() }
				    	 		</div>
			    	 		</c:when>
			    	 	</c:choose>
			    	</div>
				</div>
			</td>
		</tr>
	</c:forEach>
</table><br>
</div>	
</div>
<c:forEach var="qna" items="${qnaList }">
	<!-- Modal -->
	<div class="modal fade" id="myModal${qna.getQNAnum() }${qna.getQNAnum() }" role="dialog">
	  <div class="modal-dialog">  
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">        
	        <h4 class="modal-title">QNA</h4>
	      </div>
	      <div class="modal-body">
	      	<table align="center" border="0" cellpadding="0" cellspacing="0">
				<tr height="80px">
					<td width=100px align="center">답글</td>
					<td width=300px><textarea name="qnaRe${qna.getQNAnum() }" cols="50" rows="10"></textarea></td>
				</tr>
			</table>
		  </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" onclick="javascript:writeQNARe(${qna.getQNAnum() });">등록</button>
	      </div>
	    </div>    
	  </div>
	</div>
</c:forEach>
<!-- 일반 사용자 -->
<%}else{ %>
<div class="productQnA">
<h2>상품QNA</h2>
<table id="qnaTop" border="0">
	<tr class="reviewTableFirst">
		<td width=130px>문의유형</td>
		<td width=480px>제목</td>
		<td width=90px>진행상태</td>
		<td width=90px>작성자</td>
		<td width=137px>등록일</td>
	</tr>
</table>
<div class="accordion" id="accordion2">
<table id="qnaBody" border="0">
	<c:forEach var="qna" items="${qnaList }">
		<tr>
			<td>
				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${qna.getQNAnum() }">
			        		<table>
			        			<tr>
			        				<td width=130px>${qna.getType() }</td>
									<td width=480px>${qna.getTitle() }</td>
									<td width=90px>${qna.getState() }</td>
									<td width=90px>${qna.getName() }</td>
									<td width=137px>${qna.getRegdate() }</td>
			        			</tr>
			        		</table>
			      		</a>
			    	</div>
				   	<div id="collapse${qna.getQNAnum() }" class="accordion-body collapse">
			    	 	<div class="accordion-inner">
			        		${qna.getContent() }
			      		</div>
			    	</div>
				</div>
			</td>
		</tr>
	</c:forEach>
</table><br>
</div>	
</div>
<div id="qnaBtn">
<input type="image" src="./resources/image/product/_button/writeReviewButton.jpg" data-toggle="modal" data-target="#myModal2"></div>

<!-- Modal -->
<div class="modal fade" id="myModal2" role="dialog">
  <div class="modal-dialog">  
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title">QNA</h4>
      </div>
      <div class="modal-body">
      	<table align="center" border="0" cellpadding="0" cellspacing="0">
			<tr height="80px">
				<td colspan="2" align="center">
					<input type="radio" name="qnatype" value="기타" checked/>기타
					<input type="radio" name="qnatype" value="교환/변경"/>교환/변경
					<input type="radio" name="qnatype" value="반품/환불/취소"/>반품/환불/취소
					<input type="radio" name="qnatype" value="배송"/>배송
					<input type="radio" name="qnatype" value="상품"/>상품
				</td>
			</tr>
			<tr>
				<td width=100px align="center">제목</td>
				<td width=300px><input name="title" type="text" size="51px"></td>
			</tr>
			<tr>
				<td width=100px align="center">내용</td>
				<td width=300px><textarea name="content" cols="50" rows="10"></textarea></td>
			</tr>
		</table>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="javascript:writeQNA();">등록</button>
      </div>
    </div>    
  </div>
</div>
<%} %>
</div>
<!-- QNA 끝 -->

<div class="bottom">
<table width="100%" class="copyright">
<tr><td>Copyright 2015 이한승. All rights reserved</td></tr>
</table>
</div>
</body>
</html>