<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page  import="com.orderlist.model.*"%>
<%@ page  import="java.util.*"%>
<%
	OrderListVO orderListVO = (OrderListVO) request.getAttribute("orderListVO");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改訂單明細</title>
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
				<form  method="post" action="<%= request.getContextPath()%>/orderlist/orderListServlet.do">
					<div class="addoffer">	
						<H3 class="addoffertitle">編輯優惠資訊</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂單編號</span>
					 	<input type="text" name="mord_no" class="form-control" value="${orderListVO.morderVO.mord_no}" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">商品編號</span>
					    <input type="text" name="pro_no" class="form-control" value="${orderListVO.productVO.pro_no}" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">訂單數量</span>
					    <input type="text" name="ordl_number" class="form-control" value="${orderListVO.ordl_number}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group btndiv">
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn-primary btn-lg">送出修改</button>  	
					</div>
				</form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>