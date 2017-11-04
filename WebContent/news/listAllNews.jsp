<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	NewsService newsSvc =new NewsService(); 
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有最新消息 - listAllNews.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有員工資料 - ListAllNews.jsp</h3>
		<a href="<%=request.getContextPath()%>/news/listAllNews.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>


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
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(newsVO.news_no==param.news_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
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
	</c:forEach>
</table>
<%@ include file="/pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
