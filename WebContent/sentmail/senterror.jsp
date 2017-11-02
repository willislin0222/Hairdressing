<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="refresh" content="5;url=/Hairdressing/index.jsp">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>郵件寄送失敗</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="<%=request.getContextPath()%>/js/time.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/time.css">
	</head>
	<style type="text/css">
	#modal-id{
	color:blue;
	}
	body{
    background-image: url('https://jointgroup.es/wp-content/uploads/2016/11/joint-network-group.jpg');
	
	</style>
	<!-- 	onLoad="window.setTimeout('getSecs()',1)"為倒數轉址時間用 -->
	<body bgcolor="#ffffff" onLoad="window.setTimeout('getSecs()',1)">
		
		<a href='#modal-id' data-toggle="modal" class="btn btn-primary" id="ddd"></a>
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<strong><h4 class="modal-title">郵件未成功寄到<s:property value="to"/>的信箱</h4></strong>
					</div>
					<div class="modal-body">

					<table class="table table-hover">
						<caption></caption>
						
					
						<h2><form name=form1><input class="time" name=timespent ></form>後自動回到首頁(暫時)</h2>
						<a href="<%= request.getContextPath()%>/index.jsp"><h4>首頁</h4></a>
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