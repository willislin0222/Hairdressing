<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ProductService productSvc = new ProductService();
	List<ProductVO> list = productSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>


<table border='1' bordercolor='#CCCCFF' width='800'>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>商品描述</th>
		<th>商品單價</th>
		<th>商品圖片1</th>
		<th>商品圖片2</th>
		<th>商品圖片3</th>
		<th>商品圖片4</th>
		<th>訂購人數</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(productVO.pro_no==param.pro_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${productVO.pro_no}</td>
			<td>${productVO.pro_name}</td>
			<td>${productVO.pro_desc}</td>
			<td>${productVO.pro_price}</td>
			<td><img src="productImage.do?imglist=1&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>
			<td><img src="productImage.do?imglist=2&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>
			<td><img src="productImage.do?imglist=3&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>
			<td><img src="productImage.do?imglist=4&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>			
			<td>${productVO.pro_number}</td>		
			<td>
			  <s:form method="post" action="getOne_For_Update" namespace="/product">
			     <input type="submit" value="修改"> 
			     <input type="hidden" name="pro_no" value="${productVO.pro_no}">
			  </s:form>
			</td>
			<td>
			  <s:form method="post" action="delete" namespace="/product">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="pro_no" value="${productVO.pro_no}">
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
