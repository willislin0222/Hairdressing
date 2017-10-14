<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

	<h3>查詢一筆優惠訊息</h3>
	<form method="post" action="<%=request.getContextPath()%>/offer/offerServlet.do">
		<input type="text" name="off_no">
		<input type="submit" value="查詢">
		<input type="hidden" name="action" value="get_one_Offer"></form>
		
	
	
	<h3>查詢一筆會員資料</h3>
	<form method="post" action="<%=request.getContextPath()%>/member/memberServlet.do">
		<input type="text" name="mem_no">
		<input type="submit" value="查詢">
		<input type="hidden" name="action" value="get_one_Member"></form>
		
	
	
	<h3>查詢一筆商品資料</h3>
	<form method="post" action="<%=request.getContextPath()%>/product/productServlet.do">
		<input type="text" name="pro_no">
		<input type="submit" value="查詢">
		<input type="hidden" name="action" value="get_one_Product"></form>
		
	
	
	<h3>查詢一筆訂單資料</h3>
	<form method="post" action="<%=request.getContextPath()%>/morder/morderServlet.do">
	<input type="text" name="mord_no">
	<input type="submit" value="查詢">
	<input type="hidden" name="action" value="get_one_Morder"></form>
		
	
	
	<h3>查詢一筆預約資料</h3>
	<form method="post" action="<%=request.getContextPath()%>/reservation/reservationServlet.do">
	<input type="text" name="res_no">
	<input type="submit" value="查詢">
	<input type="hidden" name="action" value="get_one_Reservation"></form>
	
	<h3>查詢一筆訂單明細資料</h3>
	<form method="post" action="<%=request.getContextPath()%>/orderlist/orderListServlet.do">
	訂單明細編號<input type="text" name="mord_no"><br>
	場品編號<input type="text" name="pro_no">
	<input type="submit" value="查詢">
	<input type="hidden" name="action" value="get_one_orderList"></form>
		
	
</body>
</html>