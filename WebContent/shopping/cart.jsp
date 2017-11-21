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
						   <h1>Shopping Cart<small>購物車</small></h1>
						</div>
						
						
						
						
						<%Vector<ProductVO> buylist = (Vector<ProductVO>) session.getAttribute("shoppingcart");%>
						
						<%if (buylist != null && (buylist.size() > 0)) {%>
						
						
						<table class="table table-hover">
						  	<thead>
								<tr bgcolor="#F5F5F5">
									
									<th width="100">商品名稱</th>
									<th width="100">數量</th>
									<th width="100">單價</th>
									<th width="120">小計</th>
									<th width="120"></th>
								</tr>
							</thead>
						
							<%
							 for (int index = 0; index < buylist.size(); index++) {
								 ProductVO order = buylist.get(index);
							%>
							
							<tbody>
								<tr>
									
									<td width="100"><div><b><%=order.getPro_name()%></b></div></td>
									<td width="100"><div><b><%=order.getPro_number()%></b></div></td>
									<td width="100"><div><b><%=order.getPro_price()%></b></div></td>
									<td width="100"><div><b><%=order.getPro_price() * order.getPro_number()%></b></div></td>
							
									<!-- ******************刪除這項**************************** -->
									<td width="100"><div align="center">
							          <s:form namespace="/shopping" action="deletebuylist">
							              <input type="hidden" name="index" value=<%= index%>></div>
							              <input type="submit" value="刪除"></div>
							        </td></s:form>    
								</tr>	
							<%}%>	
							</tbody>
						</table>
						<!-- *********************結帳(CHECKOUT)************************ -->
						<p>
						     <div class="text-center">
						           <s:form action="checkout" namespace="/shopping">
						              <a href="<%=request.getContextPath()%>/product/productlist.jsp">
						               <button type="button" class="btn btn-success">再去逛逛</button></a>
						              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						               <input type="submit" class="btn btn-success" value="下單">
						           </s:form>
						     </div>
					</div>
<%}%>
				</div>
			</div>
</div>
	<!-- footer -->
		<footer class="footer"><jsp:include page="/footer.jsp" /></footer>



</body>
</html>