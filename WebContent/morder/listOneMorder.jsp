<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.morder.model.*" %>

<%
	MorderVO morderVO = (MorderVO) request.getAttribute("morderVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>訂單金額</th>
		<th>訂單建立日期</th>
		<th>訂單狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${morderVO.mord_no}</td>
			<td>${morderVO.memberVO.mem_no}</td>
			<td>${morderVO.mord_price}</td>
			<td>${morderVO.mord_createdate}</td>
			<td>${morderVO.mord_status}</td>			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/morder/morderServlet.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="mord_no" value="${morderVO.mord_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/morder/morderServlet.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="mord_no" value="${morderVO.mord_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
</table>
</body>
</html>