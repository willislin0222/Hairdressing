<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.product.model.ProductVO" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>Mode II 範例程式  - Cart.jsp</title>
</head>
<body bgcolor="#FFFFFF">

<%Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");%>
<%if (buylist != null && (buylist.size() > 0)) {%>

<img src="images/tomcat.gif"> <font size="+3">目前您購物車的內容如下：</font><p>

<table border="1" width="740">
	<tr bgcolor="#999999">
		<th width="200">商品名稱</th><th width="100">數量</th><th width="100">單價</th><th width="100">小計</th>
		<th width="120"></th>
	</tr>
	
	<%
	 for (int index = 0; index < buylist.size(); index++) {
		 ProductVO order = buylist.get(index);
	%>
	<tr>
		<td width="100"><div align="center"><b><%=order.getPro_name()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getPro_number()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getPro_price()%></b></div></td>
		<td width="100"><div align="center"><b><%=order.getPro_price() * order.getPro_number()%></b></div></td>
		
		<td width="100"><div align="center">
          <s:form namespace="/shopping" action="deletebuylist">
              <input type="hidden" name="index" value=<%= index%>></div>
              <input type="submit" value="刪除"></div>
        </td></s:form>
	</tr>
	<%}%>
</table>
<p>
          <s:form action="checkout" namespace="/shopping">
              <input type="submit" value="確認訂單">
          </s:form>
          
          <a href="<%=request.getContextPath()%>/product/productlist.jsp">繼續購物</a>
<%}%>
</body>
</html>