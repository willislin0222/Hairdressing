<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>預約編號</th>
		<th>會員姓名</th>
		<th>預約日期</th>
		<th>預約開始時間</th>
		<th>預約結束時間</th>
		<th>預約項目</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
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
</table>
</body>
</html>