<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.reservation.model.*" %>

<%
	ReservationVO reservationVO = (ReservationVO) request.getAttribute("reservationVO");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>預約編號</th>
		<th>會員編號</th>
		<th>預約日期</th>
		<th>預約開始時間</th>
		<th>預約結束時間</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${reservationVO.res_no}</td>
			<td>${reservationVO.mem_no}</td>
			<td>${reservationVO.res_date}</td>
			<td>${reservationVO.res_timestart}</td>
			<td>${reservationVO.res_timeend}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/reservationServlet.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reservation/reservationServlet.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
</table>
</body>
</html>