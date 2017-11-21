<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.* , com.product.model.ProductVO" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>


<html>
<head>

 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
 <link rel="stylesheet" href="<%= request.getContextPath()%>/css/shoppingcar/shoppingcar.css">
 <title>購物車</title>

			<style type="text/css">
				.jumbotron{
				    margin-top: -4px;
					background: #fcc url('<%=request.getContextPath()%>/images/board.jpg') no-repeat center top;
					background-size: cover;
				}
			</style>
 

</head>
<body>
<jsp:include page="/header.jsp" flush="true" />

<div class="content">

			<div class="jumbotron">
			  <div class="container">
			  <br><br><br><br><br><br><br><br>				
			  </div>
			</div>


			<div class="container">
				<div class="row">
				

				<!-- 控制版面大小 -->
					<div class="col-xs-12 col-sm-11">

						<div class="page-header">
						   <h1>訂單明細確認 </small></h1>
						</div>
								
						<table class="table table-hover">
						  	<thead>
								<tr bgcolor="#F5F5F5">
									
									<th width="100">商品名稱</th>
									<th width="100">數量</th>
									<th width="100">單價</th>
									<th width="120">小計</th>
								</tr>
							</thead>
						
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
							
							<tbody>
								<tr>
									
									<td width="100"><div><b><%=name%></b></div></td>
									<td width="100"><div><b><%=number%></b></div></td>
									<td width="100"><div><b><%=price%></b></div></td>
									<td width="100"><div><b><%=title%></b></div></td>
							
								</tr>	
							<%}%>	
							</tbody>
							<tbody>
								<tr>
									
									<td width="100"></td>
									<td width="100"></td>
									<td width="100"><font color="red"><b>總金額：</b></font></div></td>
									<td width="100"><div><font color="red"><b>$<%=amount%></b></font></td>
							
								</tr>	
							</tbody>
								
						</table>
						<!-- *********************結帳(CHECKOUT)************************ -->
						<p>
						     <div class="text-center">
						           <s:form action="confirm" namespace="/shopping">
						              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						               <input type="submit" class="btn btn-success" value="確認下單">
						           </s:form>
						     </div>
					</div>
				</div>
			</div>
</div>
	<!-- footer -->
		<footer class="footer"><jsp:include page="/footer.jsp" /></footer>



</body>
</html>