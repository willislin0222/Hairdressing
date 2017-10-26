<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>新增預約資料</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/reservation/reservationmain.css">
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.timepicker.js"></script>
	    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/jquery.timepicker.css" />
	    <script type="text/javascript" src="<%= request.getContextPath()%>/js/site.js"></script>
	    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/site.css" />
	</head>
	<body>
	<%-- 錯誤表列 --%>
    <s:fielderror cssStyle="color: red" />
		
			<div class="container">
				<s:form  action="addReservation" namespace="/reservation">
					<div class="reservation">	
						<H3 class="reservationtitle">新增預約資料</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">會員編號</span>
					 	<input type="text" name="reservationVO.memberVO.mem_no" class="form-control" value="${memberVO.mem_no}" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約日期</span>
					    <input  type="date" name="reservationVO.res_date" class="form-control" placeholder="預約日期" aria-describedby="basic-addon1">
					</div>
					<script>
					</script>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約開始時間</span>
					    <input id="timestart" type="text" name="reservationVO.res_timestart" class="form-control" placeholder="優惠內容" aria-describedby="basic-addon1">
					</div>
					<script>
					 $(function() {
					     $('#timestart').timepicker();
					});					 
					</script>	
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">預約結束時間</span>
						<input id="timeend" type="text" name="reservationVO.res_timeend" class="form-control" placeholder="優惠內容" aria-describedby="basic-addon1">
					</div>
					<script>
					 $(function() {
					     $('#timeend').timepicker();
					});					 
					</script>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約項目</span>
					 	<input type="text" name="reservationVO.res_content" class="form-control" placeholder="預約項目" aria-describedby="basic-addon1">
					</div>			
					<div class="input-group btndiv">
						<button type="submit" class="btn btn-primary btn-lg">預約</button>  	
					</div>	
				</s:form>	
			</div>

		
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>