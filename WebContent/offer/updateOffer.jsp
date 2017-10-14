<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page  import="com.offer.model.*"%>
<%@ page  import="java.util.*"%>
<%
	OfferVO offerVO =(OfferVO) request.getAttribute("offerVO");
	String off_status = offerVO.getOff_status().toString();	
	
	Map<String, String> offerStatusMap = new LinkedHashMap<String,String>();
	offerStatusMap.put("0", "優惠結束");
	offerStatusMap.put("1", "優惠進行中");
	pageContext.setAttribute("offerStatusMap",offerStatusMap);
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>新增優惠訊息</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/offermain.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
		<script type="text/javascript" src="<%= request.getContextPath()%>/js/ImageView.js"></script>
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
				<form  method="post" action="<%= request.getContextPath()%>/offer/offerServlet.do" enctype="multipart/form-data">
					<div class="addoffer">	
						<H3 class="addoffertitle">修改優惠資訊</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠編號</span>
					 	<input class="form-control" type="text" placeholder="${offerVO.off_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠標題</span>
					 		<input type="text" name="off_title" class="form-control" value="${offerVO.off_title}" aria-describedby="basic-addon1">					  	
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠內容</span>
					    <input type="text" name="off_content" class="form-control" value="${offerVO.off_content}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠圖片</span>
					    <input type="file" name="off_image" class="form-control" value="${offerVO.off_image}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group" id="imageView">
					    <img src="offerImage.do?off_no=${offerVO.off_no}" width="100%">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">開始日期</span>
					    <input type="date" name="off_start" class="form-control" value="${offerVO.off_start}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">結束日期</span>
					    <input type="date" name="off_end" class="form-control" value="${offerVO.off_end}" aria-describedby="basic-addon1">
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">優惠狀態</span>				
						<select class="dropdown-toggle" size="1" name="off_status">
							<option value="0" ${offerVO.off_status=="0"?'selected':''}>優惠結束
							<option value="1" ${offerVO.off_status=="1"?'selected':''}>優惠進行中 
						</select>
					</div>
					<div class="input-group btndiv">
						<input type="hidden" name="off_no" value="${offerVO.off_no}">
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn-primary btn-lg">送出修改</button>  	
					</div>	
				</form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>