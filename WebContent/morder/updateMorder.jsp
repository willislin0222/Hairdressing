<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.morder.model.*" %>
<%@ page import="java.util.*" %>
<%
	MorderVO morderVO = (MorderVO) request.getAttribute("morderVO");
	Map<String,String> morderstatus = new LinkedHashMap<String,String>();
	morderstatus.put("0","未處理");
	morderstatus.put("1","已處理");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改訂單資料</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/membermain.css">
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
				<form  method="post" action="<%= request.getContextPath()%>/morder/morderServlet.do">
					<div class="addoffer">	
						<H3 class="addoffertitle">修改訂單資料</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂單編號</span>
					 	<input class="form-control" type="text" value="${morderVO.mord_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">會員編號</span>
					 	<input class="form-control" type="text" value="${morderVO.memberVO.mem_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂單金額</span>
					    <input type="text" name="mord_price" class="form-control" value="${morderVO.mord_price}" aria-describedby="basic-addon1">
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂單日期</span>
					    <input type="text" name="mord_createdate" class="form-control" value="${morderVO.mord_createdate}" readonly>
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂單狀態</span>
					    <input type="text" name="mord_status" class="form-control" value="${morderVO.mord_status}" readonly>
					</div>	
					<div class="input-group btndiv">
						<input type="hidden" name="action" value="update">
						<input type="hidden" name="mord_no" value="${morderVO.mord_no}">
						<input type="hidden" name="mem_no" value="${morderVO.memberVO.mem_no}">
						<button type="submit" class="btn btn-primary btn-lg">修改訂單</button>  	
					</div>	
				</form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>