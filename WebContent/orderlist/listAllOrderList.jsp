<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orderlist.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	OrderListService orderlistSvc = new OrderListService();
	List<OrderListVO> list = orderlistSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有員工資料 - listAllEmp.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有員工資料 - ListAllEmp.jsp</h3>
		<a href="<%=request.getContextPath()%>/offer/listAllOffer.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>


<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>訂單編號</th>
		<th>商品編號</th>
		<th>訂購數量</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="orderlistVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(orderlistVO.morderVO.mord_no==param.mord_no && orderlistVO.productVO.pro_no==param.pro_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${orderlistVO.morderVO.mord_no}</td>
			<td>${orderlistVO.productVO.pro_no}</td>
			<td>${orderlistVO.ordl_number}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orderlist/orderListServlet.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="mord_no" value="${orderlistVO.morderVO.mord_no}">
			     <input type="hidden" name="pro_no" value="${orderlistVO.productVO.pro_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orderlist/orderListServlet.do">
			    <input type="submit" value="刪除">
			      <input type="hidden" name="mord_no" value="${orderlistVO.morderVO.mord_no}">
			     <input type="hidden" name="pro_no" value="${orderlistVO.productVO.pro_no}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			    <input type="hidden" name="action"value="delete"></FORM>
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
