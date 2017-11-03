<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="com.offer.model.*" %>

<%
	OfferVO offerVO = (OfferVO) request.getAttribute("offerVO");
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
		<th>優惠訊息編號</th>
		<th>優惠訊息標題</th>
		<th>優惠訊息內容</th>
		<th>優惠訊息圖片</th>
		<th>優惠開始日期</th>
		<th>優惠結束日期</th>
		<th>優惠狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${offerVO.off_no}</td>
			<td>${offerVO.off_title}</td>
			<td>${offerVO.off_content}</td>
			<td><img src="offerImage.do?off_no=${offerVO.off_no}" width="200px" height="200px"></td>
			<td>${offerVO.off_start}</td>
			<td>${offerVO.off_end}</td>	
			<td>${offerVO.off_status}</td>		
			<td>
			  <s:form action="getOne_For_Update" namespace="/offer">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="off_no" value="${offerVO.off_no}">
			  </s:form>
			</td>
			<td>
			  <s:form action="delete" namespace="/offer">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="off_no" value="${offerVO.off_no}">
			  </s:form>
			</td>
		</tr>
</table>
</body>
</html>