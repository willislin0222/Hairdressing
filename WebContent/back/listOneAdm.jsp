<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="com.adm.model.*" %>

<%
	AdmVO admVO = (AdmVO) request.getAttribute("admVO");
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
		<th>管理者編號</th>
		<th>管理者帳號</th>
		<th>管理者密碼</th>
		<th>管理者建立日期</th>
		<th>管理者帳號狀態</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${admVO.adm_no}</td>
			<td>${admVO.adm_id}</td>
			<td>${admVO.adm_psw}</td>
			<td>${admVO.adm_createdate}</td>		
			<td>${admVO.adm_status}</td>		
			<td>
			  <s:form action="getOne_For_Update" namespace="/adm">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="adm_no" value="${admVO.adm_no}">
			  </s:form>
			</td>
			<td>
			  <s:form action="delete" namespace="/adm">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="adm_no" value="${admVO.adm_no}">
			  </s:form>
			</td>
		</tr>
</table>
</body>
</html>