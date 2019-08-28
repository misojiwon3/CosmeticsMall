<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>필수정보 확인</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Cache-Control" content="no-cache"/> 
<meta http-equiv="Expires" content="0"/> 
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="X-UA-Compatible" content="requiresActiveX=true" />
<!--[if lt IE 8]>
<link rel="stylesheet" type="text/css" href="../css/ie7.css" />
<![endif]--> 
<style>
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
    }      
    .pop {
    	border : 1px solid black ;
    	height : 500px;
    	width : 340px;
    }
    .info_tbl {
    	font-size : 17px;    
    	margin : auto;
    }
    #productInfo, #receiverInfo {
    	height : 140px;
    }
    #purchaserInfo {
    	height : 110px;
    }
    .btn_wrap {
    	width : 127px;
    	margin : auto;
    }
</style>
<script language=javascript src="http://plugin.inicis.com/pay61_uni_cross.js"></script>

<script language=javascript>
StartSmartUpdate();
</script>

<!---------------------------------------------------------------------------------- 
※ 주의 ※
 상단 자바스크립트는 지불페이지를 실제 적용하실때 지불페이지 맨위에 위치시켜 
 적용하여야 만일에 발생할수 있는 플러그인 오류를 미연에 방지할 수 있습니다.
 
  <script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
  <script language=javascript>
  StartSmartUpdate();	// 플러그인 설치(확인)
  </script>
-----------------------------------------------------------------------------------> 


<script language=javascript>

var openwin;

function pay(frm)
{
	// MakePayMessage()를 호출함으로써 플러그인이 화면에 나타나며, Hidden Field
	// 에 값들이 채워지게 됩니다. 일반적인 경우, 플러그인은 결제처리를 직접하는 것이
	// 아니라, 중요한 정보를 암호화 하여 Hidden Field의 값들을 채우고 종료하며,
	// 다음 페이지인 INILiteSecurepay.php로 데이터가 포스트 되어 결제 처리됨을 유의하시기 바랍니다.

	if(document.ini.clickcontrol.value == "enable")
	{
		
		if(document.ini.goodname.value == "")  // 필수항목 체크 (상품명, 상품가격, 구매자명, 구매자 이메일주소, 구매자 전화번호)
		{
			alert("상품명이 빠졌습니다. 필수항목입니다.");
			return false;
		}
		else if(document.ini.price.value == "")
		{
			alert("상품가격이 빠졌습니다. 필수항목입니다.");
			return false;
		}
		else if(document.ini.buyername.value == "")
		{
			alert("구매자명이 빠졌습니다. 필수항목입니다.");
			return false;
		} 
		else if(document.ini.buyeremail.value == "")
		{
			alert("구매자 이메일주소가 빠졌습니다. 필수항목입니다.");
			return false;
		}
		else if(document.ini.buyertel.value == "")
		{
			alert("구매자 전화번호가 빠졌습니다. 필수항목입니다.");
			return false;
		}
		else if( ( navigator.userAgent.indexOf("MSIE") >= 0 || navigator.appName == 'Microsoft Internet Explorer' ) &&  (document.INIpay == null || document.INIpay.object == null) )  // 플러그인 설치유무 체크
		{
		  alert("\n이니페이 플러그인 128이 설치되지 않았습니다. \n\n안전한 결제를 위하여 이니페이 플러그인 128의 설치가 필요합니다. \n\n다시 설치하시려면 Ctrl + F5키를 누르시거나 메뉴의 [보기/새로고침]을 선택하여 주십시오.");
			return false;
		}
		else
		{
			/******
			 * 플러그인이 참조하는 각종 결제옵션을 이곳에서 수행할 수 있습니다.
			 * (자바스크립트를 이용한 동적 옵션처리)
			 */
			
						 
			if (MakePayMessage(frm))
			{
				disable_click();
				openwin = window.open("../childwin.php","childwin","width=299,height=149");
				document.ini.submit();		
				return true;
			}
			else
			{
			  if( IsPluginModule() )     //plugin타입 체크
        {
          alert("결제를 취소하셨습니다.");
				  return false;
				}
			}
		}
	}
	else
	{
		return false;
	}
}


function enable_click()
{
	document.ini.clickcontrol.value = "enable"
}

function disable_click()
{
	document.ini.clickcontrol.value = "disable"
}

function focus_control()
{
	if(document.ini.clickcontrol.value == "disable")
		openwin.focus();
}
</script>


<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<!-----------------------------------------------------------------------------------------------------
※ 주의 ※
 아래의 body TAG의 내용중에 
 onload="javascript:enable_click()" onFocus="javascript:focus_control()" 이 부분은 수정없이 그대로 사용.
 아래의 form TAG내용도 수정없이 그대로 사용.
------------------------------------------------------------------------------------------------------->

<body class="pop" bgcolor="#FFFFFF" text="#242424" leftmargin=0 topmargin=15 marginwidth=0 marginheight=0 bottommargin=0 rightmargin=0 onload="javascript:enable_click()" onFocus="javascript:focus_control()">

	<div id="pop_wrapper"> 
		<h2>필수정보 확인</h2>
	
		<div id="pop_container">
			<div class="pop_cont">
			
			
				<form name=ini method=post action="Demo_INILiteSecurepay_result.php" onSubmit="return pay(this)"> 
					<div id="productInfo">
					<table border="1" class="info_tbl mb30" summary="INILite 결제데모실행 상품정보 입력 테이블 입니다. 상품명, 가격으로 구성.">
						<caption>상품 정보</caption>
						<colgroup>
							<col width="90px">
							<col width="210px">
						</colgroup>
						<tbody>
							<tr>
				        		<th class="td01"><p style="width:90px">결제방법</p></th>
				        		<td class="td02 td03"><p><select name=gopaymethod >
				                          <option value="">[ 결제방법을 선택하세요. ] 
				                          <option value="Card">신용카드 결제
				                          <option value="DirectBank">실시간 은행계좌이체 
				                          <option value="HPP">핸드폰 결제
				                          <option value="PhoneBill">받는전화결제 
				                          <option value="Ars1588Bill">1588 전화 결제 
				                          <option value="VBank">무통장 입금 
				                          <option value="OCBPoint">OK 캐쉬백포인트 결제
				                          <option value="Culture">문화상품권 결제
				                          </select></p></td>
				            </tr>
							<tr>
								<th scope="row"><label for="INIpay01">상품명</label></th>
								<td>
									<input type="text" id="INIpay01" name="goodname" class="textInput" style="width: 200px;" value="${productName }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay02">가격</label></th>
								<td>
									<input type="text" id="INIpay02" name="price" class="textInput" style="width: 200px;" value="${price }">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
						
			
			
					<div id="purchaserInfo">
					<table border="1" class="info_tbl mb30" summary="INILite 결제데모실행 구매자 정보 입력 테이블 입니다. 성명, E-mail, 핸드폰번호으로 구성."> <!-- //1122 : 수정 -->
						<caption>구매자 정보</caption> <!-- //1122 : 수정 --> 
						<colgroup>
							<col width="90px">
							<col width="210px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="INIpay03">성명</label></th>
								<td>
									<input type="text" id="INIpay03" name="buyername" class="textInput" style="width: 200px;" value="${p_name }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay04">E-mail</label></th>
								<td>
									<input type="text" id="INIpay04" name="buyeremail" class="textInput" style="width: 200px;" value="${p_email }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay05">휴대폰</label></th>
								<td>
									<input type="text" id="INIpay05" name="buyertel" class="textInput" style="width: 200px;" value="${p_phone }">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
						
					
					<div id="receiverInfo">
					<table border="1" class="info_tbl mb30" summary="INILite 결제데모실행 수취인 정보 입력 테이블 입니다. 성명, 핸드폰번호, 주소, 전달메시지로 구성.">
						<caption>수령자 정보</caption>
						<colgroup>
							<col width="90px">
							<col width="210px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="INIpay06">성명</label></th>
								<td>
									<input type="text" id="INIpay06" name="recvname" class="textInput" style="width: 200px;" value="${r_name }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay07">핸드폰번호</label></th>
								<td>
									<input type="text" id="INIpay07" name="recvtel" class="textInput" style="width: 200px;" value="${r_phone }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay08">주소</label></th>
								<td>
									<input type="text" id="INIpay08" name="recvaddr" class="textInput" style="width: 200px;" value="${r_address }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay09">전달메시지</label></th>
								<td>
									<input type="text" id="INIpay09" name="recvmsg" class="textInput" style="width: 200px;" value="${required }">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
				                     
				                  
                
                    
             <!-----------------------------------------------------------------------------------------------------
			※ 주의 ※
			보호자 이메일 주소입력 받는 필드는 소액결제(핸드폰 , 전화결제)
			중에  14세 미만의 고객 결제시에 부모 이메일로 결제 내용통보하라는 정통부 권고 사항입니다. 
			다른 결제 수단을 이용시에는 해당 필드(parentemail)삭제 하셔도 문제없습니다.
		  ------------------------------------------------------------------------------------------------------->  
<!--<input type="submit" value="PAY" />-->
		  			<div class="btn_wrap ac">
			        	<input type="image" id="payBtn" src="/shopping/resources/image/pay/_button/pay.jpg" onclick="return pay(document.ini)">
			        </div>

<!-----------PAY--------------BUTTON-------------------------------------------------->				
					<!-- 
					상점아이디.
					테스트를 마친 후, 발급받은 아이디로 바꾸어 주십시오.
					-->
					<input type=hidden name=mid value=INIpayTest>
					
					<!--
					화폐단위
					원화 : WON
					미화 : USD 
					주의 : 미화승인은 별도 계약이 필요합니다.
					-->
					<input type=hidden name=currency value="WON">
					
					
					<!--
					무이자 할부
					무이자로 할부를 제공 : yes
					무이자할부는 별도 계약이 필요합니다.
					카드사별,할부개월수별 무이자할부 적용은 아래의 카드할부기간을 참조 하십시오.
					무이자할부 옵션 적용은 반드시 매뉴얼을 참조하여 주십시오.
					-->
					<input type=hidden name=nointerest value="yes">
					
					
					<!--
					카드할부기간
					각 카드사별로 지원하는 개월수가 다르므로 유의하시기 바랍니다.
					
					value의 마지막 부분에 카드사코드와 할부기간을 입력하면 해당 카드사의 해당
					할부개월만 무이자할부로 처리됩니다 (매뉴얼 참조).
					-->
					<input type=hidden name=quotabase value="선택:선택:일시불:2개월:3개월:4개월:5개월:6개월(11-3,12-3:6)">
					
					
					<!-- 기타설정 -->
					<!--
					SKIN : 플러그인 스킨 칼라 변경 기능 - 6가지 칼라(ORIGINAL, GREEN, ORANGE, BLUE, KAKKI, GRAY)
					HPP : 컨텐츠 또는 실물 결제 여부에 따라 HPP(1)과 HPP(2)중 선택 적용(HPP(1):컨텐츠, HPP(2):실물).
					Card(0): 신용카드 지불시에 이니시스 대표 가맹점인 경우에 필수적으로 세팅 필요 ( 자체 가맹점인 경우에는 카드사의 계약에 따라 설정) - 자세한 내용은 메뉴얼  참조.
					OCB : OK CASH BAG 가맹점으로 신용카드 결제시에 OK CASH BAG 적립을 적용하시기 원하시면 "OCB" 세팅 필요 그 외에 경우에는 삭제해야 정상적인 결제 이루어짐.
					no_receipt : 은행계좌이체시 현금영수증 발행여부 체크박스 비활성화 (현금영수증 발급 계약이 되어 있어야 사용가능)
					-->
					<input type=hidden name=acceptmethod value="SKIN(ORIGINAL):HPP(1):OCB">
					
					
					<!--
					상점 주문번호 : 무통장입금 예약(가상계좌 이체),전화결재 관련 필수필드로 반드시 상점의 주문번호를 페이지에 추가해야 합니다.
					결제수단 중에 은행 계좌이체 이용 시에는 주문 번호가 결제결과를 조회하는 기준 필드가 됩니다.
					상점 주문번호는 최대 40 BYTE 길이입니다.
					"MALLTEST"는 은행계좌이체와 전화결제 테스트용 주문번호로 테스트가 끝나신후 반드시 변경하시기 바랍니다.
					-->
					<input type=hidden name=oid size=40 value="sample_oid">
					
					
					<!--
					플러그인 좌측 상단 상점 로고 이미지 사용
					이미지의 크기 : 90 X 34 pixels
					플러그인 좌측 상단에 상점 로고 이미지를 사용하실 수 있으며,
					주석을 풀고 이미지가 있는 URL을 입력하시면 플러그인 상단 부분에 상점 이미지를 삽입할수 있습니다.
					-->
					<input type=hidden name=ini_logoimage_url  value="http://img.naver.net/static/www/u/2013/0731/nmms_224940510.gif">
					
					<!--
					좌측 결제메뉴 위치에 이미지 추가
					이미지의 크기 : 단일 결제 수단 - 91 X 148 pixels, 신용카드/ISP/계좌이체/가상계좌 - 91 X 96 pixels
					좌측 결제메뉴 위치에 미미지를 추가하시 위해서는 담당 영업대표에게 사용여부 계약을 하신 후
					주석을 풀고 이미지가 있는 URL을 입력하시면 플러그인 좌측 결제메뉴 부분에 이미지를 삽입할수 있습니다.
					-->
					<!--input type=hidden name=ini_menuarea_url value="http://[사용할 이미지주소]"-->
					
					<!--
					플러그인에 의해서 값이 채워지거나, 플러그인이 참조하는 필드들
					삭제/수정 불가
					uid 필드에 절대로 임의의 값을 넣지 않도록 하시기 바랍니다.
					-->
					<input type=hidden name=quotainterest value="">
					<input type=hidden name=paymethod value="">
					<input type=hidden name=cardcode value="">
					<input type=hidden name=cardquota value="">
					<input type=hidden name=rbankcode value="">
					<input type=hidden name=reqsign value="DONE">
					<input type=hidden name=encrypted value="">
					<input type=hidden name=sessionkey value="">
					<input type=hidden name=uid value=""> 
					<input type=hidden name=sid value="">
					<input type=hidden name=version value=4000>
					<input type=hidden name=clickcontrol value="">
				</form>
			</div>
		</div>
	</div>
</body>
</html>


</body>
</html>