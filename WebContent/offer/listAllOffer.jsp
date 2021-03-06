<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.offer.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	OfferService offerSvc = new OfferService();
	List<OfferVO> list = offerSvc.getAll();
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
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="offerVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(offerVO.off_no==param.off_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
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
	</c:forEach>
</table>
<%@ include file="/pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
