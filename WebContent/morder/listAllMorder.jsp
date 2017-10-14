<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.morder.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MorderService morderSvc = new MorderService();
	List<MorderVO> list = morderSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>


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
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="morderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(morderVO.mord_no==param.mord_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
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
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/morder/morderServlet.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="mord_no" value="${morderVO.mord_no}">
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
