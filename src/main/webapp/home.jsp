<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	String img_path="/shopping/resources/image/home";
	String best_img_path = "/shopping/resources/image/product/productImages/";
%>
<%@ page session="false" %>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" href="/shopping/resources/css/bootstrap-custom.min.css">
<script src="/shopping/resources/js/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
	a {
		text-decoration : none;	
		font-size : 18px;
	}
	#bestItem {
		width : 927px;
		margin : auto;
		color : black;
	}
	.left, .right {
		background-color : none;
		opacity: 0.5;		
	}
	.carousel-control.left,
	.carousel-control.right {
		background-image:none;
	}
	#homeSearch {
		size : 20px;
	}
</style>
</head>
<body>
<jsp:include page="./topMenu/homeMenu.jsp"/><br><br><br>
<table align="center">
<tr>
<td><img id="main" src="./resources/image/home/k.jpg" height=300px></td>
<td><img id="main" src="./resources/image/home/k.jpg" height=300px></td>
<td><img id="main" src="./resources/image/home/k.jpg" height=300px></td>
<td><img id="main" src="./resources/image/home/k.jpg" height=300px></td>
<tr>
</table>
<div id="bestItem">
<h2>Best Item</h2>
	<br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
      <table>
	      <tr>
	      	<td><div>	      		
	      		<a href="product.pr?method=getProduct&num=${bestList.get(0).getNum() }">
	      		<img class="img1" src="<%=best_img_path %>${bestList.get(0).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=14px>1st</font></td>
	      			<td align="center">${bestList.get(0).getName() }<br>
	      			${bestList.get(0).getPrice() }<br></td> 	
	      			</tr></table>		
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(1).getNum() }">
	      		<img class="img2" src="<%=best_img_path %>${bestList.get(1).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=14px>2nd</font></td>
	      			<td align="center">${bestList.get(1).getName() }<br>
	      			${bestList.get(1).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(2).getNum() }">
	      		<img class="img3" src="<%=best_img_path %>${bestList.get(2).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=14px>3th</font></td>
	      			<td align="center">${bestList.get(2).getName() }<br>
	      			${bestList.get(2).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(3).getNum() }">
	      		<img class="img4" src="<%=best_img_path %>${bestList.get(3).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=14px>4th</font></td>
	      			<td align="center">${bestList.get(3).getName() }<br>
	      			${bestList.get(3).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
	      </tr>
      </table>        
      </div>

      <div class="item">
      <table>
	      <tr>
	      	<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(4).getNum() }">
	      		<img class="img1" src="<%=best_img_path %>${bestList.get(4).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>5th</font></td>
	      			<td align="center">${bestList.get(4).getName() }<br>
	      			${bestList.get(4).getPrice() }<br></td> 	
	      			</tr></table>	
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(5).getNum() }">
	      		<img class="img2" src="<%=best_img_path %>${bestList.get(5).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>6th</font></td>
	      			<td align="center">${bestList.get(5).getName() }<br>
	      			${bestList.get(5).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(6).getNum() }">
	      		<img class="img3" src="<%=best_img_path %>${bestList.get(6).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>7th</font></td>
	      			<td align="center">${bestList.get(6).getName() }<br>
	      			${bestList.get(6).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(7).getNum() }">
	      		<img class="img4" src="<%=best_img_path %>${bestList.get(7).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>8th</font></td>
	      			<td align="center">${bestList.get(7).getName() }<br>
	      			${bestList.get(7).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
	      </tr>
      </table>
      </div>
    
      <div class="item">
      <table>
	      <tr>
	      	<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(8).getNum() }">
	      		<img class="img1" src="<%=best_img_path %>${bestList.get(8).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>9th</font></td>
	      			<td align="center">${bestList.get(8).getName() }<br>
	      			${bestList.get(8).getPrice() }<br></td> 	
	      			</tr></table>	
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(9).getNum() }">
	      		<img class="img2" src="<%=best_img_path %>${bestList.get(9).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>10th</font></td>
	      			<td align="center">${bestList.get(9).getName() }<br>
	      			${bestList.get(9).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(10).getNum() }">
	      		<img class="img3" src="<%=best_img_path %>${bestList.get(10).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>11th</font></td>
	      			<td align="center">${bestList.get(10).getName() }<br>
	      			${bestList.get(10).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
     		<td><div align="center">
	      		<a href="product.pr?method=getProduct&num=${bestList.get(11).getNum() }">
	      		<img class="img4" src="<%=best_img_path %>${bestList.get(11).getImage() }" width="230" height="230">	      			
	      			<table align="center"><tr>
	      			<td rowspan="2"><font size=16px>12th</font></td>
	      			<td align="center">${bestList.get(11).getName() }<br>
	      			${bestList.get(11).getPrice() }<br></td> 	
	      			</tr></table>
     			</a></div></td>
	      </tr>
      </table>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
  </div>
</div>

</body>
</html>