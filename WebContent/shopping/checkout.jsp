<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.product.model.ProductVO"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>訂單明細確認 - Checkout.jsp</title>
</head>
<body bgcolor="#FFFFFF">
<img src="images/tomcat.gif"> <font size="+3">訂單明細確認 - 結帳 </font>
<hr><p><center>

<table border="1" width="720">
	<tr bgcolor="#999999">
		<th width="200">商品名稱</th>
		<th width="100">數量</th>
		<th width="100">單價</th>
		<th width="100">小計</th>
		<th width="120"></th>
	</tr>
	
	<%
		Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");
		String amount =  (String) request.getAttribute("amount");
	%>	
	<%	for (int i = 0; i < buylist.size(); i++) {
			ProductVO order = buylist.get(i);
			String name = order.getPro_name();
			float number = order.getPro_number();
			float price = order.getPro_price();
			float title = order.getPro_number() * order.getPro_price();
	%>
	<tr>
		<td width="200"><div align="center"><b><%=name%></b></div></td>
		<td width="100"><div align="center"><b><%=number%></b></div></td>
		<td width="100"><div align="center"><b><%=price%></b></div></td>
		<td width="100"><div align="center"><b><%=title%></b></div></td>
	</tr>
	<%
		}
	%>
	<tr>
		<td></td>
		<td></td>
		<td></td>
		<td><div align="center"><font color="red"><b>總金額：</b></font></div></td>
		<td></td>
		<td> <font color="red"><b>$<%=amount%></b></font> </td>
		<td></td>
	</tr>
</table>
<s:form action="confirm" namespace="/shopping">
	      <input type="submit" value="確認下單" class="btn btn-success">
</s:form>
</center>
</body>
</html>
