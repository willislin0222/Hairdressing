<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>新增產品</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">
	<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/product/ProductImageView.js"></script>
</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="addProduct" namespace="/product" enctype="multipart/form-data" method="POST">

            <div class="form-title-row">
                <h1>輸入商品資訊</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
            <div class="form-row">
                <label>
                    <span>商品名稱</span>
                    <input type="text" name="productVO.pro_name" value="${productVO.pro_name}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>商品描述</span>
               		<textarea class="form-control"  style="width:240px;height:200px;" name="productVO.pro_desc" value="${productVO.pro_desc}"></textarea>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>商品單價</span>
                    <input type="text" name="productVO.pro_price" value="${productVO.pro_price}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>商品圖片1</span>
                    <input type="file" name="fileUpload">
                </label>
            </div>
            <div class="input-group" id="imageView1"></div>	
            <div class="form-row">
                <label>
                    <span>商品圖片2</span>
                    <input type="file" name="fileUpload">
                </label>
            </div>
            <div class="input-group" id="imageView2"></div>	
            <div class="form-row">
                <label>
                    <span>商品圖片3</span>
                    <input type="file" name="fileUpload">
                </label>
            </div>
            <div class="input-group" id="imageView3"></div>	
            <div class="form-row">
                <label>
                    <span>商品圖片4</span>
                    <input type="file" name="fileUpload">
                </label>
            </div>
            <div class="input-group" id="imageView4"></div>	
      		
            <div class="form-row">
                <button type="submit" class="btn btn-primary btn-lg">新增商品</button>  
            </div>
        </s:form>
        </div>

    </div>

</body>

</html>
