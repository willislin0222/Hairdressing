<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	MemberService memberSvc = new MemberService();
	List<MemberVO> list = memberSvc.getAll();
	pageContext.setAttribute("list",list); 
%>


<html>
<head>
<title>所有員工資料 - listAllMember.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>



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
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="memberVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(memberVO.mem_no==param.mem_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${memberVO.mem_no}</td>
			<td>${memberVO.mem_name}</td>
			<td>${memberVO.mem_id}</td>
			<td>${memberVO.mem_psw}</td>
			<td>${memberVO.mem_birthday}</td>
			<td>${memberVO.mem_email}</td>
			<td>${memberVO.mem_mobile}</td>	
			<td>${memberVO.mem_joindate}</td>		
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/memberServlet.do">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="mem_no" value="${memberVO.mem_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/memberServlet.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="mem_no" value="${memberVO.mem_no}">
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
