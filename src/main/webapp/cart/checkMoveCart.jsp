<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
var moveCheck = confirm('��ǰ�� �߰��Ǿ����ϴ�. ��ٱ��Ϸ� �̵��ϱ�ý��ϴ�?');
if(moveCheck == true){
	location.href="./cart.ct?method=getCartList";
}else{
	history.go(-1);
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>