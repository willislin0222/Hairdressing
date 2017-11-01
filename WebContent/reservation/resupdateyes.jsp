<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<meta http-equiv="refresh" content="5;url=/Hairdressing/reservation/fullcalendar.jsp">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>預約員資料修改成功</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="<%=request.getContextPath()%>/js/time.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/time.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/reservation/resupdateyes.css">
	</head>
	<style type="text/css">
	#modal-id{
	color:blue;
	}
	body{
    background-image: url('https://jointgroup.es/wp-content/uploads/2016/11/joint-network-group.jpg');
	
	</style>
<!-- 	onLoad="window.setTimeout('getSecs()',1)"為倒數轉址時間用 -->
	<body  bgcolor="#ffffff" onLoad="window.setTimeout('getSecs()',1)">
	
		
		<a href='#modal-id' data-toggle="modal" class="btn btn-primary" id="ddd"></a>
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<strong><h4 class="modal-title">預約資料修改成功</h4></strong>
					</div>
					<div class="modal-body">
					
					
				<div class="container">
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約編號</span>
					 	<input type="text" size="1" name="reservationVO.res_no" class="form-control" value="${reservationVO.res_no}" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約日期</span>
					    <input  type="date" name="reservationVO.res_date" class="form-control" value="${reservationVO.res_date}" aria-describedby="basic-addon1" readonly>
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約開始時間</span>
					    <input id="timestart" type="text" name="reservationVO.res_timestart" class="form-control" value="${reservationVO.res_timestart}" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">預約結束時間</span>
						<input id="timeend" type="text" name="reservationVO.res_timeend" class="form-control" value="${reservationVO.res_timeend}" aria-describedby="basic-addon1" readonly>
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約項目</span>
					 	<input type="text" name="reservationVO.res_content" class="form-control" value="${reservationVO.res_content}" aria-describedby="basic-addon1" readonly>
					</div>				
			</div>
					
					
					
					<table class="table table-hover">
						<caption></caption>
							
						
						<h2><form name=form1><input class="time" name=timespent ></form>後自動回到預約頁面</h2>
						<a href="<%= request.getContextPath()%>/reservation/fullcalendar.jsp"><h4>返回預約頁面</h4></a>
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