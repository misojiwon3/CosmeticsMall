<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�ʼ����� Ȯ��</title>
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
�� ���� ��
 ��� �ڹٽ�ũ��Ʈ�� ������������ ���� �����ϽǶ� ���������� ������ ��ġ���� 
 �����Ͽ��� ���Ͽ� �߻��Ҽ� �ִ� �÷����� ������ �̿��� ������ �� �ֽ��ϴ�.
 
  <script language=javascript src="http://plugin.inicis.com/pay40.js"></script>
  <script language=javascript>
  StartSmartUpdate();	// �÷����� ��ġ(Ȯ��)
  </script>
-----------------------------------------------------------------------------------> 


<script language=javascript>

var openwin;

function pay(frm)
{
	// MakePayMessage()�� ȣ�������ν� �÷������� ȭ�鿡 ��Ÿ����, Hidden Field
	// �� ������ ä������ �˴ϴ�. �Ϲ����� ���, �÷������� ����ó���� �����ϴ� ����
	// �ƴ϶�, �߿��� ������ ��ȣȭ �Ͽ� Hidden Field�� ������ ä��� �����ϸ�,
	// ���� �������� INILiteSecurepay.php�� �����Ͱ� ����Ʈ �Ǿ� ���� ó������ �����Ͻñ� �ٶ��ϴ�.

	if(document.ini.clickcontrol.value == "enable")
	{
		
		if(document.ini.goodname.value == "")  // �ʼ��׸� üũ (��ǰ��, ��ǰ����, �����ڸ�, ������ �̸����ּ�, ������ ��ȭ��ȣ)
		{
			alert("��ǰ���� �������ϴ�. �ʼ��׸��Դϴ�.");
			return false;
		}
		else if(document.ini.price.value == "")
		{
			alert("��ǰ������ �������ϴ�. �ʼ��׸��Դϴ�.");
			return false;
		}
		else if(document.ini.buyername.value == "")
		{
			alert("�����ڸ��� �������ϴ�. �ʼ��׸��Դϴ�.");
			return false;
		} 
		else if(document.ini.buyeremail.value == "")
		{
			alert("������ �̸����ּҰ� �������ϴ�. �ʼ��׸��Դϴ�.");
			return false;
		}
		else if(document.ini.buyertel.value == "")
		{
			alert("������ ��ȭ��ȣ�� �������ϴ�. �ʼ��׸��Դϴ�.");
			return false;
		}
		else if( ( navigator.userAgent.indexOf("MSIE") >= 0 || navigator.appName == 'Microsoft Internet Explorer' ) &&  (document.INIpay == null || document.INIpay.object == null) )  // �÷����� ��ġ���� üũ
		{
		  alert("\n�̴����� �÷����� 128�� ��ġ���� �ʾҽ��ϴ�. \n\n������ ������ ���Ͽ� �̴����� �÷����� 128�� ��ġ�� �ʿ��մϴ�. \n\n�ٽ� ��ġ�Ͻ÷��� Ctrl + F5Ű�� �����ðų� �޴��� [����/���ΰ�ħ]�� �����Ͽ� �ֽʽÿ�.");
			return false;
		}
		else
		{
			/******
			 * �÷������� �����ϴ� ���� �����ɼ��� �̰����� ������ �� �ֽ��ϴ�.
			 * (�ڹٽ�ũ��Ʈ�� �̿��� ���� �ɼ�ó��)
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
			  if( IsPluginModule() )     //pluginŸ�� üũ
        {
          alert("������ ����ϼ̽��ϴ�.");
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
�� ���� ��
 �Ʒ��� body TAG�� �����߿� 
 onload="javascript:enable_click()" onFocus="javascript:focus_control()" �� �κ��� �������� �״�� ���.
 �Ʒ��� form TAG���뵵 �������� �״�� ���.
------------------------------------------------------------------------------------------------------->

<body class="pop" bgcolor="#FFFFFF" text="#242424" leftmargin=0 topmargin=15 marginwidth=0 marginheight=0 bottommargin=0 rightmargin=0 onload="javascript:enable_click()" onFocus="javascript:focus_control()">

	<div id="pop_wrapper"> 
		<h2>�ʼ����� Ȯ��</h2>
	
		<div id="pop_container">
			<div class="pop_cont">
			
			
				<form name=ini method=post action="Demo_INILiteSecurepay_result.php" onSubmit="return pay(this)"> 
					<div id="productInfo">
					<table border="1" class="info_tbl mb30" summary="INILite ����������� ��ǰ���� �Է� ���̺� �Դϴ�. ��ǰ��, �������� ����.">
						<caption>��ǰ ����</caption>
						<colgroup>
							<col width="90px">
							<col width="210px">
						</colgroup>
						<tbody>
							<tr>
				        		<th class="td01"><p style="width:90px">�������</p></th>
				        		<td class="td02 td03"><p><select name=gopaymethod >
				                          <option value="">[ ��������� �����ϼ���. ] 
				                          <option value="Card">�ſ�ī�� ����
				                          <option value="DirectBank">�ǽð� ���������ü 
				                          <option value="HPP">�ڵ��� ����
				                          <option value="PhoneBill">�޴���ȭ���� 
				                          <option value="Ars1588Bill">1588 ��ȭ ���� 
				                          <option value="VBank">������ �Ա� 
				                          <option value="OCBPoint">OK ĳ��������Ʈ ����
				                          <option value="Culture">��ȭ��ǰ�� ����
				                          </select></p></td>
				            </tr>
							<tr>
								<th scope="row"><label for="INIpay01">��ǰ��</label></th>
								<td>
									<input type="text" id="INIpay01" name="goodname" class="textInput" style="width: 200px;" value="${productName }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay02">����</label></th>
								<td>
									<input type="text" id="INIpay02" name="price" class="textInput" style="width: 200px;" value="${price }">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
						
			
			
					<div id="purchaserInfo">
					<table border="1" class="info_tbl mb30" summary="INILite ����������� ������ ���� �Է� ���̺� �Դϴ�. ����, E-mail, �ڵ�����ȣ���� ����."> <!-- //1122 : ���� -->
						<caption>������ ����</caption> <!-- //1122 : ���� --> 
						<colgroup>
							<col width="90px">
							<col width="210px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="INIpay03">����</label></th>
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
								<th scope="row"><label for="INIpay05">�޴���</label></th>
								<td>
									<input type="text" id="INIpay05" name="buyertel" class="textInput" style="width: 200px;" value="${p_phone }">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
						
					
					<div id="receiverInfo">
					<table border="1" class="info_tbl mb30" summary="INILite ����������� ������ ���� �Է� ���̺� �Դϴ�. ����, �ڵ�����ȣ, �ּ�, ���޸޽����� ����.">
						<caption>������ ����</caption>
						<colgroup>
							<col width="90px">
							<col width="210px">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="INIpay06">����</label></th>
								<td>
									<input type="text" id="INIpay06" name="recvname" class="textInput" style="width: 200px;" value="${r_name }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay07">�ڵ�����ȣ</label></th>
								<td>
									<input type="text" id="INIpay07" name="recvtel" class="textInput" style="width: 200px;" value="${r_phone }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay08">�ּ�</label></th>
								<td>
									<input type="text" id="INIpay08" name="recvaddr" class="textInput" style="width: 200px;" value="${r_address }">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="INIpay09">���޸޽���</label></th>
								<td>
									<input type="text" id="INIpay09" name="recvmsg" class="textInput" style="width: 200px;" value="${required }">
								</td>
							</tr>
						</tbody>
					</table>
					</div>
				                     
				                  
                
                    
             <!-----------------------------------------------------------------------------------------------------
			�� ���� ��
			��ȣ�� �̸��� �ּ��Է� �޴� �ʵ�� �Ҿװ���(�ڵ��� , ��ȭ����)
			�߿�  14�� �̸��� �� �����ÿ� �θ� �̸��Ϸ� ���� �����뺸�϶�� ����� �ǰ� �����Դϴ�. 
			�ٸ� ���� ������ �̿�ÿ��� �ش� �ʵ�(parentemail)���� �ϼŵ� ���������ϴ�.
		  ------------------------------------------------------------------------------------------------------->  
<!--<input type="submit" value="PAY" />-->
		  			<div class="btn_wrap ac">
			        	<input type="image" id="payBtn" src="/shopping/resources/image/pay/_button/pay.jpg" onclick="return pay(document.ini)">
			        </div>

<!-----------PAY--------------BUTTON-------------------------------------------------->				
					<!-- 
					�������̵�.
					�׽�Ʈ�� ��ģ ��, �߱޹��� ���̵�� �ٲپ� �ֽʽÿ�.
					-->
					<input type=hidden name=mid value=INIpayTest>
					
					<!--
					ȭ�����
					��ȭ : WON
					��ȭ : USD 
					���� : ��ȭ������ ���� ����� �ʿ��մϴ�.
					-->
					<input type=hidden name=currency value="WON">
					
					
					<!--
					������ �Һ�
					�����ڷ� �Һθ� ���� : yes
					�������Һδ� ���� ����� �ʿ��մϴ�.
					ī��纰,�Һΰ������� �������Һ� ������ �Ʒ��� ī���ҺαⰣ�� ���� �Ͻʽÿ�.
					�������Һ� �ɼ� ������ �ݵ�� �Ŵ����� �����Ͽ� �ֽʽÿ�.
					-->
					<input type=hidden name=nointerest value="yes">
					
					
					<!--
					ī���ҺαⰣ
					�� ī��纰�� �����ϴ� �������� �ٸ��Ƿ� �����Ͻñ� �ٶ��ϴ�.
					
					value�� ������ �κп� ī����ڵ�� �ҺαⰣ�� �Է��ϸ� �ش� ī����� �ش�
					�Һΰ����� �������Һη� ó���˴ϴ� (�Ŵ��� ����).
					-->
					<input type=hidden name=quotabase value="����:����:�Ͻú�:2����:3����:4����:5����:6����(11-3,12-3:6)">
					
					
					<!-- ��Ÿ���� -->
					<!--
					SKIN : �÷����� ��Ų Į�� ���� ��� - 6���� Į��(ORIGINAL, GREEN, ORANGE, BLUE, KAKKI, GRAY)
					HPP : ������ �Ǵ� �ǹ� ���� ���ο� ���� HPP(1)�� HPP(2)�� ���� ����(HPP(1):������, HPP(2):�ǹ�).
					Card(0): �ſ�ī�� ���ҽÿ� �̴Ͻý� ��ǥ �������� ��쿡 �ʼ������� ���� �ʿ� ( ��ü �������� ��쿡�� ī����� ��࿡ ���� ����) - �ڼ��� ������ �޴���  ����.
					OCB : OK CASH BAG ���������� �ſ�ī�� �����ÿ� OK CASH BAG ������ �����Ͻñ� ���Ͻø� "OCB" ���� �ʿ� �� �ܿ� ��쿡�� �����ؾ� �������� ���� �̷����.
					no_receipt : ���������ü�� ���ݿ����� ���࿩�� üũ�ڽ� ��Ȱ��ȭ (���ݿ����� �߱� ����� �Ǿ� �־�� ��밡��)
					-->
					<input type=hidden name=acceptmethod value="SKIN(ORIGINAL):HPP(1):OCB">
					
					
					<!--
					���� �ֹ���ȣ : �������Ա� ����(������� ��ü),��ȭ���� ���� �ʼ��ʵ�� �ݵ�� ������ �ֹ���ȣ�� �������� �߰��ؾ� �մϴ�.
					�������� �߿� ���� ������ü �̿� �ÿ��� �ֹ� ��ȣ�� ��������� ��ȸ�ϴ� ���� �ʵ尡 �˴ϴ�.
					���� �ֹ���ȣ�� �ִ� 40 BYTE �����Դϴ�.
					"MALLTEST"�� ���������ü�� ��ȭ���� �׽�Ʈ�� �ֹ���ȣ�� �׽�Ʈ�� �������� �ݵ�� �����Ͻñ� �ٶ��ϴ�.
					-->
					<input type=hidden name=oid size=40 value="sample_oid">
					
					
					<!--
					�÷����� ���� ��� ���� �ΰ� �̹��� ���
					�̹����� ũ�� : 90 X 34 pixels
					�÷����� ���� ��ܿ� ���� �ΰ� �̹����� ����Ͻ� �� ������,
					�ּ��� Ǯ�� �̹����� �ִ� URL�� �Է��Ͻø� �÷����� ��� �κп� ���� �̹����� �����Ҽ� �ֽ��ϴ�.
					-->
					<input type=hidden name=ini_logoimage_url  value="http://img.naver.net/static/www/u/2013/0731/nmms_224940510.gif">
					
					<!--
					���� �����޴� ��ġ�� �̹��� �߰�
					�̹����� ũ�� : ���� ���� ���� - 91 X 148 pixels, �ſ�ī��/ISP/������ü/������� - 91 X 96 pixels
					���� �����޴� ��ġ�� �̹����� �߰��Ͻ� ���ؼ��� ��� ������ǥ���� ��뿩�� ����� �Ͻ� ��
					�ּ��� Ǯ�� �̹����� �ִ� URL�� �Է��Ͻø� �÷����� ���� �����޴� �κп� �̹����� �����Ҽ� �ֽ��ϴ�.
					-->
					<!--input type=hidden name=ini_menuarea_url value="http://[����� �̹����ּ�]"-->
					
					<!--
					�÷����ο� ���ؼ� ���� ä�����ų�, �÷������� �����ϴ� �ʵ��
					����/���� �Ұ�
					uid �ʵ忡 ����� ������ ���� ���� �ʵ��� �Ͻñ� �ٶ��ϴ�.
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