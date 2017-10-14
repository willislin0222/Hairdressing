<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.orderlist.model.*" %>


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
		<th>商品編號</th>
		<th>訂購數量</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
		<tr align='center' valign='middle'>
			<td>${orderListVO.morderVO.mord_no}</td>
			<td>${orderListVO.productVO.pro_no}</td>
			<td>${orderListVO.ordl_number}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orderlist/orderListServlet.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="mord_no" value="${orderListVO.morderVO.mord_no}">
			     <input type="hidden" name="pro_no" value="${orderListVO.productVO.pro_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orderlist/orderListServlet.do">
			    <input type="submit" value="刪除">
			      <input type="hidden" name="mord_no" value="${orderListVO.morderVO.mord_no}">
			     <input type="hidden" name="pro_no" value="${orderListVO.productVO.pro_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
</table>
</body>
</html>