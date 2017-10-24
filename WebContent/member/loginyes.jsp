<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>會員登入成功</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<style type="text/css">
	#modal-id{
	color:blue;
	}
	body{
    background-image: url('https://jointgroup.es/wp-content/uploads/2016/11/joint-network-group.jpg');
	
	</style>
	<body>
		
		<a href='#modal-id' data-toggle="modal" class="btn btn-primary" id="ddd"></a>
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<strong><h4 class="modal-title">會員註冊成功</h4></strong>
					</div>
					<div class="modal-body">

					<table class="table table-hover">
						<caption></caption>
						
					
						<h2>請至登入頁面登入您的帳號</h2>
						<a href="<%= request.getContextPath()%>/member/login.jsp"><h4>登入頁面</h4></a>
						</table>



					</div>
					
				</div>
			</div>
		</div>
		

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
				<script>
			$('#ddd').click();
		</script>
	</body>
</html>