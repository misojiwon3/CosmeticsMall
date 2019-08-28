<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String id = (String)session.getAttribute("loginID");
	String img_path = "/shopping/resources/image/menu/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$("#allMenu").click(function(){
		$("#allMenuDown").animate({
			height : 'toggle'
		});
	});
});
</script>
<script>
function search(){
	var searchWord = document.getElementById("homeSearch").value
	location.href="product.pr?method=searchProduct&word="+searchWord+"&order=0";
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
   	a {
		text-decoration : none;	
	}
    * {
    	font-family : 'arita-bold';
    }        
    #topMenu {
        height: 30px;  				/* 메인 메뉴의 높이 */
        width: 927px; 		 		/* 메인 메뉴의 넓이 */
        border-top:1px solid black; 	/* 메뉴 상단 테두리 */
        border-bottom:1px solid black;  /* 메뉴 하단 테두리 */
        margin : auto;
    }
    #topMenu ul {           /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
        list-style-type: none;  /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
        margin: 0px;            /* 메인 메뉴 안의 ul의 margin을 없앰 */
        padding: 0px;           /* 메인 메뉴 안의 ul의 padding을 없앰 */
    }
    #topMenu ul li {            /* ul 태그 안에 있는 li 태그의 스타일 적용(상위 & 하위) */
        background-color: white;    /* 배경 색을 white로 설정 */
        float: left;                /* 왼쪽으로 나열되도록 설정 */
        line-height: 30px;          /* 텍스트 한 줄의 높이를 30px로 설정 */
        vertical-align: middle;     /* 세로 정렬을 가운데로 설정 */
        text-align: center;         /* 텍스트를 가운데로 정렬 */
        position: relative;         /* 해당 li 태그 내부의 top/left 포지션 초기화 */
    }
    .mainMenu, .subMenuLink {           /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
        text-decoration:none;               /* a 태그의 꾸밈 효과 제거 */
        display: block;                     /* a 태그의 클릭 범위를 넓힘 */
        width: 100px;                       /* 기본 넓이를 100px로 설정 */
        font-size: 12px;                    /* 폰트 사이즈를 12px로 설정 */
        font-weight: bold;                  /* 폰트를 굵게 설정 */
        font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
    }
    .mainMenu {     /* 상위 메뉴의 글씨색을 black으로 설정 */
        color: black;
    }
    .topMenuLi:hover .mainMenu {    /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
        color: white;                 /* 글씨 색 빨간색 */
        background-color: black;  /* 배경색을 내가 고른 빨간색으로 설정 */
    }
    .subMenuLink {          /* 하위 메뉴의 a 태그 스타일 설정 */
        color: #2d2d2d;             /* 글씨 색을 RGB(2D2D2D)로 설정 */
        background-color: white;    /* 배경색을 흰색으로 설정 */
        border: solid 1px black;    /* 테두리를 설정 */
        margin-top: -1px;           /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
    }
    .longlink {
    	vertical-align: middle;
    	width : 120px ;		/* 긴 하위메뉴는 조금 더 넓게 표현 */
    }
    .subMenu {              /* 하위 메뉴 스타일 설정 */
        position: absolute;     /* html의 flow에 영향을 미치지 않게 absolute 설정 */
        height: 0px;            /* 초기 높이는 0px로 설정 */
        overflow: hidden;       /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
        transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
        -webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
        -moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
        -o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
    }
    .topMenuLi:hover .subMenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
        height: 300px;           /* 높이를 93px로 설정 */
    }
    .subMenuLink:hover {        /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
        color: black;                 /* 글씨색을 빨간색으로 설정 */
        background-color: #dddddd;  /* 배경을 RGB(DDDDDD)로 설정 */
    }
    .showID {
    	vertical-align: middle;
    }
	#allMenuDown {
	    display: none;
	}
	#center {
		height : 80px;
        margin: auto;
	}
	#homeSearch{
		display: inline-block;
		padding: 4px 6px;
		margin-bottom: 10px;
		font-size: 14px;
		color: #555;
		vertical-align: middle;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		border-radius: 4px
	}
	#allMenuBtn{
		float : left ;
	}
	#userID {
		font-size : 16px;
	}
    </style>
</head>
<body>
<div id="center" align="center">
	<table border="0">
		<tr>
			<td width="212px">
				<input type="text" name="homeSearch" id="homeSearch" onKeyPress="if(event.keyCode == 13){search()}"/>
				<input type="image" src="<%=img_path %>homeSearch.jpg" onclick="search();"/>
				<script>
				$("#homeSearch").autocomplete({
					source : function(request, response){
						$.ajax({
							url : "product.pr?method=autoWord&word="+document.getElementById("homeSearch").value,
							type : 'post',
							dataType : 'json',
							minChars : 1,
							data : request,
							success : function(data){
								var result = data;
								response(result);
							},
							error : function(data){
								alert("에러발생")
							}
					 	});
				 	}
				});
				</script>
			</td>
			<td width="380px" align="center">
				<a href="./"><img src="<%=img_path %>homeTitle.jpg"/></a>
			</td>
			<td width="335px">
				<table border="0">
					<%	if(session.getAttribute("loginID") == null){%>
						<tr><td colspan="4">&nbsp;</td></tr>
						<tr>
							<td width="62px" align="center"><a href="member.me?method=joinPage"><img src="<%=img_path %>homeJoin.jpg"/></a></td>
							<td width="86px" align="center"><a href="member.me?method=loginPage"><img src="<%=img_path %>homeLogin.jpg"/></a></td>
							<td width="90px" align="center"><a href="member.me?method=myPage"><img src="<%=img_path %>homeMyPage.jpg"/></a></td>
							<td width="85px" align="center"><a href="cart.ct?method=getCartList"><img src="<%=img_path %>homeBasket.jpg"/></a></td>
						</tr>
					<%	}else{ %>
					<% 		if((session.getAttribute("loginID").equals("admin"))){ %>
						<tr><td>&nbsp;</td><td colspan="3"><img src="<%=img_path %>homeMemberID.jpg"><span id="userID">&nbsp;<b><%=id %></b>님 환영합니다</span></td></tr>
						<tr>
							<td width="62px">&nbsp;</td>
							<td width="86px" align="center"><a href="member.me?method=logout"><img src="<%=img_path %>homeLogout.jpg"/></a></td>
							<td width="90px" align="center"><a href="member.me?method=addProduct"><img src="<%=img_path %>homeAdminMenu.jpg"/></a></td>
							<td width="85px" align="center"><a href="cart.ct?method=getCartList"><img src="<%=img_path %>homeBasket.jpg"/></a></td>
						</tr>
					<%		}else{ %>
						<tr><td>&nbsp;</td><td colspan="3"><img src="<%=img_path %>homeMemberID.jpg"><span id="userID">&nbsp;<b><%=id %></b>님 환영합니다</span></td></tr>
						<tr>
							<td width="62px">&nbsp;</td>
							<td width="86px" align="center"><a href="member.me?method=logout"><img src="<%=img_path %>homeLogout.jpg"/></a></td>
							<td width="90px" align="center"><a href="member.me?method=myPage"><img src="<%=img_path %>homeMyPage.jpg"/></a></td>
							<td width="85px" align="center"><a href="cart.ct?method=getCartList"><img src="<%=img_path %>homeBasket.jpg"/></a></td>
						</tr>
					<%		} %>
					<%	} %>
				</table>
			</td>
		</tr>
	</table>
</div>
<div id="topMenu" align="center">
	<div id="allMenuBtn">
		<img id="allMenu" onmouseover="javascript:showImage();" width="27px" height="27px" src="<%=img_path %>showAllMenu.jpg"/><br>
	</div>	
	<ul>		
		<!-- 해당 카테고리의 번호를 전달하여 그 카테고리의 상품 리스트를 불러오는 작업을 수행하도록 함 -->
		<li class="topMenuLi">
               <a class="mainMenu" href="#">스킨케어</a>
               <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=11" class="subMenuLink">스킨</a></li>
                   <li><a href="category.ca?method=getProductList&category=12" class="subMenuLink">로션</a></li>
                   <li><a href="category.ca?method=getProductList&category=13" class="subMenuLink">미스트</a></li>
                   <li><a href="category.ca?method=getProductList&category=14" class="subMenuLink">에센스</a></li>
                   <li><a href="category.ca?method=getProductList&category=15" class="subMenuLink">크림</a></li>
                   <li><a href="category.ca?method=getProductList&category=16" class="subMenuLink">아이크림</a></li>
                   <li><a href="category.ca?method=getProductList&category=17" class="subMenuLink">선케어</a></li>
               </ul>
           </li>
           <li class="topMenuLi">
               <a class="mainMenu" href="#">클렌징</a>
               <ul class="subMenu">
               	<li><a href="category.ca?method=getProductList&category=21" class="subMenuLink">클렌징폼</a></li>
               	<li><a href="category.ca?method=getProductList&category=22" class="subMenuLink">클렌징크림/오일</a></li>
               </ul>
           </li>
           <li class="topMenuLi">
               <a class="mainMenu" href="#">팩/마스크</a>
               <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=31" class="subMenuLink longlink">시트마스크</a></li>
                   <li><a href="category.ca?method=getProductList&category=32" class="subMenuLink longlink">슬리핑팩</a></li>
                   <li><a href="category.ca?method=getProductList&category=33" class="subMenuLink longlink">워시오프팩/필오프팩</a></li>
                   <li><a href="category.ca?method=getProductList&category=34" class="subMenuLink longlink">마사지</a></li>
                   <li><a href="category.ca?method=getProductList&category=35" class="subMenuLink longlink">필링</a></li>
                   
               </ul>
           </li>
           <li class="topMenuLi">
               <a class="mainMenu" href="#">페이스메이크업</a>
               <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=41" class="subMenuLink longlink">쿠션</a></li>
                   <li><a href="category.ca?method=getProductList&category=42" class="subMenuLink longlink">BB/CC</a></li>
                   <li><a href="category.ca?method=getProductList&category=43" class="subMenuLink longlink">프라이머/베이스</a></li>
                   <li><a href="category.ca?method=getProductList&category=44" class="subMenuLink longlink">파운데이션</a></li>
                   <li><a href="category.ca?method=getProductList&category=45" class="subMenuLink longlink">팩터/파우더</a></li>
                   <li><a href="category.ca?method=getProductList&category=46" class="subMenuLink longlink">컨실러</a></li>
                   <li><a href="category.ca?method=getProductList&category=47" class="subMenuLink longlink">블러셔/하이라이터</a></li>
               </ul>
           </li>
           <li class="topMenuLi">
               <a class="mainMenu" href="#">컬러메이크업</a>
                <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=51" class="subMenuLink">립스틱</a></li>
                   <li><a href="category.ca?method=getProductList&category=52" class="subMenuLink">립글로스</a></li>
                   <li><a href="category.ca?method=getProductList&category=53" class="subMenuLink">립틴트</a></li>
                   <li><a href="category.ca?method=getProductList&category=54" class="subMenuLink">립라이너</a></li>
                   <li><a href="category.ca?method=getProductList&category=55" class="subMenuLink">마스카라</a></li>
                   <li><a href="category.ca?method=getProductList&category=56" class="subMenuLink">아이라니어</a></li>
                   <li><a href="category.ca?method=getProductList&category=57" class="subMenuLink">아이섀도</a></li>
                   <li><a href="category.ca?method=getProductList&category=58" class="subMenuLink">아이브로우</a></li>
                   <li><a href="category.ca?method=getProductList&category=59" class="subMenuLink">네일</a></li>
               </ul>
           </li>
            <li class="topMenuLi">
               <a class="mainMenu" href="#">바디</a>
                <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=61" class="subMenuLink">클렌저/스크럽</a></li>
                   <li><a href="category.ca?method=getProductList&category=62" class="subMenuLink">로션/오일/크림</a></li>
                   <li><a href="category.ca?method=getProductList&category=63" class="subMenuLink">풋/핸드</a></li>
                   <li><a href="category.ca?method=getProductList&category=64" class="subMenuLink">제모/데오</a></li>
               </ul>
           </li>
            <li class="topMenuLi">
               <a class="mainMenu" href="#">헤어</a>
                <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=71" class="subMenuLink longlink">헤어에센스/미스트</a></li>
                   <li><a href="category.ca?method=getProductList&category=72" class="subMenuLink longlink">헤어스타일링</a></li>
                   <li><a href="category.ca?method=getProductList&category=73" class="subMenuLink longlink">헤어컬러링</a></li>
                   <li><a href="category.ca?method=getProductList&category=74" class="subMenuLink longlink">샴푸</a></li>
                   <li><a href="category.ca?method=getProductList&category=75" class="subMenuLink longlink">트리트먼트</a></li>
               </ul>
           </li>
            <li class="topMenuLi">
               <a class="mainMenu" href="#">향수</a>
                <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=81" class="subMenuLink">퍼퓸</a></li>
                   <li><a href="category.ca?method=getProductList&category=82" class="subMenuLink">샤워코롱</a></li>
                   <li><a href="category.ca?method=getProductList&category=83" class="subMenuLink">룸 프래그런스</a></li>
               </ul>
           </li>
            <li class="topMenuLi">
               <a class="mainMenu" href="#">소품</a>
                <ul class="subMenu">
                   <li><a href="category.ca?method=getProductList&category=91" class="subMenuLink">스킨케어소품</a></li>
                   <li><a href="category.ca?method=getProductList&category=92" class="subMenuLink">메이크업소품</a></li>
                   <li><a href="category.ca?method=getProductList&category=93" class="subMenuLink">바디/헤어소품</a></li>
                   <li><a href="category.ca?method=getProductList&category=94" class="subMenuLink">네일소품</a></li>
               </ul>
           </li>
	</ul>
</div>

</body>
</html>