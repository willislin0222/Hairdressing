<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="com.news.model.*" %>

<%
	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
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
		<th>最新消息編號</th>
		<th>最新消息標題</th>
		<th>最新消息內容</th>
		<th>最新消息建立日期</th>
		<th>最新消息狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${newsVO.news_no}</td>
			<td>${newsVO.news_title}</td>
			<td>${newsVO.news_content}</td>
			<td>${newsVO.news_createdate}</td>		
			<td>${newsVO.news_status}</td>			
			<td>
			  <s:form action="getOne_For_Update" namespace="/news">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="news_no" value="${newsVO.news_no}">
			  </s:form>
			</td>
			<td>
			  <s:form action="delete" namespace="/news">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="news_no" value="${newsVO.news_no}">
			  </s:form>
			</td>
		</tr>
</table>
</body>
</html>