<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>新增產品</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/product/productmain.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/product/ProductImageView.js"></script>
	</head>
	<body>
	<%-- 錯誤表列 --%>
    <s:fielderror cssStyle="color: red" />
		
			<div class="container">
				<s:form action="addProduct" namespace="/product" enctype="multipart/form-data" method="POST">
					<div class="product">	
						<H3 class="producttitle">編輯商品資訊</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品名稱</span>
					 	<input type="text" name="productVO.pro_name" class="form-control" placeholder="商品名稱" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品描述</span>
					    <input type="text" name="productVO.pro_desc" class="form-control" placeholder="商品描述" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品單價</span>
					    <input type="text" name="productVO.pro_price" class="form-control" placeholder="商品單價" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片1</span>
					    <input type="file" name="fileUpload" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView1"></div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片2</span>
					    <input type="file" name=fileUpload class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView2"></div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片3</span>
					    <input type="file" name="fileUpload" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView3"></div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品圖片4</span>
					    <input type="file" name="fileUpload" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView4"></div>
					<div class="input-group btndiv">
						<input type="hidden" name="productVO.pro_number" value="0">
						<button type="submit" class="btn btn-primary btn-lg">新增商品</button>  	
					</div>	
				</s:form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>