<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>
	<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>會員編號</th>
		<th>會員姓名</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員生日</th>
		<th>會員電子郵件</th>
		<th>會員電話</th>
		<th>會員加入日期</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${memberVO.mem_no}</td>
			<td>${memberVO.mem_name}</td>
			<td>${memberVO.mem_id}</td>
			<td>${memberVO.mem_psw}</td>
			<td>${memberVO.mem_birthday}</td>
			<td>${memberVO.mem_email}</td>	
			<td>${memberVO.mem_mobile}</td>		
			<td>${memberVO.mem_joindate}</td>		
			<td>
			  <s:form action="getOne_For_Update" namespace="/member">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="memberVO.mem_no" value="${memberVO.mem_no}"></s:form>
			</td>
			<td>
			  <s:form action="delete" namespace="/member">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="memberVO.mem_no" value="${memberVO.mem_no}"></s:form>
			</td>
		</tr>
</table>
</body>
</html>