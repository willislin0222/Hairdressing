<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>\
<%@ page  import="com.product.model.*"%>
<%@ page  import="java.util.*"%>
<%
	ProductVO productVO =(ProductVO) request.getAttribute("productVO");
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改商品</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/product/productmain.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/product/ProductImageView.js"></script>
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
	<c:if test="${not empty errorMsgs}">
		<font color="red">請修正以下錯誤
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach> 
		</font>
	</c:if>	
		
			<div class="container">
				<form  method="post" action="<%= request.getContextPath()%>/product/productServlet.do" enctype="multipart/form-data">
					<div class="product">	
						<H3 class="producttitle">修改商品資訊</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品編號</span>
					 	<input class="form-control" type="text" placeholder="${productVO.pro_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品名稱</span>
					 	<input type="text" name="pro_name" class="form-control" value="${productVO.pro_name}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品描述</span>
					    <input type="text" name="pro_desc" class="form-control" value="${productVO.pro_desc}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品單價</span>
					    <input type="text" name="pro_price" class="form-control" value="${productVO.pro_price}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片1</span>
					    <input type="file" name="pro_image" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView1">
					<img src="productImage.do?imglist=1&pro_no=${productVO.pro_no}" width="100%">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片2</span>
					    <input type="file" name="pro_image" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView2">
					<img src="productImage.do?imglist=2&pro_no=${productVO.pro_no}" width="100%">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片3</span>
					    <input type="file" name="pro_image" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView3">
					<img src="productImage.do?imglist=3&pro_no=${productVO.pro_no}" width="100%">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片4</span>
					    <input type="file" name="pro_image" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView4">
					<img src="productImage.do?imglist=4&pro_no=${productVO.pro_no}" width="100%">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂購人數</span>
					 	<input class="form-control" type="text" placeholder="${productVO.pro_number}" readonly > 
					</div>
					<div class="input-group btndiv">
						<input type="hidden" name="pro_number" value="${productVO.pro_number}">
						<input type="hidden" name="pro_no" value="${productVO.pro_no}">
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn-primary btn-lg">修改商品資訊</button>  	
					</div>	
				</form>	
			</div>

		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>