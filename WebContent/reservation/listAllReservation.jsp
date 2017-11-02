<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reservation.model.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ReservationService reservationSvc = new ReservationService();
	List<ReservationVO> list = reservationSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有預約資料 - listAllReservation.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>


<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>預約編號</th>
		<th>會員名稱</th>
		<th>預約日期</th>
		<th>預約開始時間</th>
		<th>預約結束時間</th>
		<th>預約項目</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="reservationVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(reservationVO.res_no==param.res_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${reservationVO.res_no}</td>
			<td>${reservationVO.memberVO.mem_name}</td>
			<td>${reservationVO.res_date}</td>
			<td>${reservationVO.res_timestart}</td>
			<td>${reservationVO.res_timeend}</td>
			<td>${reservationVO.res_content}</td>
			<td>
			  <s:form action="getOne_For_Update" namespace="/reservation">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			  </s:form>
			</td>
			<td>
			  <s:form action="delete" namespace="/reservation">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="res_no" value="${reservationVO.res_no}">
			  </s:form>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="/pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
