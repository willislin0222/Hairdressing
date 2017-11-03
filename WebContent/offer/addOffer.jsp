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
		<title>新增優惠訊息</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/offer/offermain.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/ImageView.js"></script>
	</head>
	<body>
	<%-- 錯誤表列 --%>
    <s:fielderror cssStyle="color: red" />
		
			<div class="container">
				<s:form action="addOffer" namespace="/offer" enctype="multipart/form-data" method="POST">
					<div class="offer">	
						<H3 class="offertitle">新增優惠資訊</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠標題</span>
					 	<input type="text" name="offerVO.off_title" class="form-control" placeholder="優惠標題" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠內容</span>
					    <input type="text" name="offerVO.off_content" class="form-control" placeholder="優惠內容" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠圖片</span>
					    <input type="file" name="fileUpload" class="form-control" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView"></div>			
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">開始日期</span>
					    <input type="date" name="offerVO.off_start" class="form-control" placeholder="開始日期" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">結束日期</span>
					    <input type="date" name="offerVO.off_end" class="form-control" placeholder="開始日期" aria-describedby="basic-addon1">
					</div>	
					<div class="input-group btndiv">
						<input type="hidden" name="offerVO.off_status" value="1">
						<button type="submit" class="btn btn-primary btn-lg">送出新增</button>  	
					</div>
				</s:form>
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>