<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
			<title>orderSuccessfully</title>
			 <link rel="stylesheet" href="<%= request.getContextPath()%>/css/shoppingcar/shoppingcar.css">
			<style type="text/css">
				.jumbotron{
					background: #fcc url('<%=request.getContextPath()%>/images/board.jpg') no-repeat center top;
					background-size: cover;
				}
			</style>
</head>
<body>

<jsp:include page="/header.jsp" flush="true" />



	
			<div class="jumbotron">
			  <div class="container">
				 <br><br><br><br><br><br><br><br>
			  </div>
			</div>
<center>
			<div class="container">
				<div class="row">
				<!-- 控制版面大小 -->
					<div class="col-xs-12 col-sm-3"></div>
					<div class="col-xs-12 col-sm-6">
						<div class="page-header">
						  <h1>Order Confirmation<small>訂單成立</small></h1>
						</div>
			  
						  <table class="table table-hover">
						  	<thead>
						  		<tr>
						  			<th></th>					  									  
						  		</tr>
						  	</thead>
						  	<tbody>
					
						  		<tr>
						  			謝謝您的惠顧<br>我們已經收到您的訂單<br>
						  			您可以到會員專區查看訂單紀錄	
						  		</tr>
						  	</tbody>
						  </table>
						<br>
						<div class="text-center">
						<a href="<%=request.getContextPath()%>/index.jsp">
						<button type="button" class="btn btn-success">回首頁</button>
						</a>	
						</div>
						
						
						
<br><br><br><br><br><br><br><br><br><br>

					</div>
					
					</div>



					
				</div>
			</div>
			



<br><br><br><br><br>
</center>
<jsp:include page="/footer.jsp" flush="true" />
</body>
</html>