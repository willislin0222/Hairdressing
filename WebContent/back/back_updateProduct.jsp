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

	<title>修改商品資訊</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">
	<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/product/updateProductImageView.js"></script>
</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="updateProduct" namespace="/product" enctype="multipart/form-data" method="POST">

            <div class="form-title-row">
                <h1>修改商品資訊</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
			<div class="form-row">
                <label>
                    <span>商品編號</span>
                    <input type="text" name="productVO.pro_no" value="${productVO.pro_no}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>商品名稱</span>
                    <input type="text" name="productVO.pro_name" value="${productVO.pro_name}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>商品描述</span>
                    <input type="text" name="productVO.pro_desc" value="${productVO.pro_desc}">
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
                    <input id="pro_image1" type="file" name="pro_image1">
                </label>
            </div>
            <div class="input-group" id="imageView1">
			<img class="showimage" src="productImage.do?imglist=1&pro_no=${productVO.pro_no}" width="100%">
			</div>
            <div class="form-row">
                <label>
                    <span>商品圖片2</span>
                    <input id="pro_image2" type="file" name="pro_image2">
                </label>
            </div>
            <div class="input-group" id="imageView2">
			<img class="showimage" src="productImage.do?imglist=2&pro_no=${productVO.pro_no}" width="100%">
			</div>
            <div class="form-row">
                <label>
                    <span>商品圖片3</span>
                    <input id="pro_image3" type="file" name="pro_image3">
                </label>
            </div>
            <div class="input-group" id="imageView3">
			<img class="showimage" src="productImage.do?imglist=3&pro_no=${productVO.pro_no}" width="100%">
			</div>
            <div class="form-row">
                <label>
                    <span>商品圖片4</span>
                    <input id="pro_image4" type="file" name="pro_image4">
                </label>
            </div>
            <div class="input-group" id="imageView4">
			<img class="showimage" src="productImage.do?imglist=4&pro_no=${productVO.pro_no}" width="100%">
			</div>
      		<div class="form-row">
                <label>
                    <span>訂購人數</span>
                    <input type="text" name="productVO.pro_number" value="${productVO.pro_number}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>建立日期</span>
                    <input type="date" name="productVO.pro_createdate" value="${productVO.pro_createdate}">
                </label>
            </div>
            <div class="form-row">
            	<input type="hidden" name="productVO.pro_status" value="${productVO.pro_status}">
                <button type="submit" class="btn btn-primary btn-lg">修改商品資訊</button>  
            </div>
        </s:form>
        </div>

    </div>

</body>

</html>
