<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adm.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	AdmService admSvc =new AdmService(); 
	List<AdmVO> list = admSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有管理員 - listAllAdm.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有員工資料 - ListAllNews.jsp</h3>
		<a href="<%=request.getContextPath()%>/back/listAllAdm.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>


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
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="admVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(admVO.adm_no==param.adm_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
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
	</c:forEach>
</table>
<%@ include file="/pages/page2.file" %>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%= request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%= request.getRequestURI()%> </b>
</body>
</html>
