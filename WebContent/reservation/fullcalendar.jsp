<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>預約專區</title>
<meta charset='utf-8' />
<link href='<%= request.getContextPath()%>/css/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath()%>/css/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='<%= request.getContextPath()%>/js/fullcalendar/moment.min.js'></script>
<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
<script src='<%= request.getContextPath()%>/js/fullcalendar/fullcalendar.min.js'></script>
<script src='<%= request.getContextPath()%>/js/bootstrap.min.js'></script>
<link href='<%= request.getContextPath()%>/css/fullcalendar/calendar.css' rel='stylesheet' />
<script src="<%= request.getContextPath()%>/js/fullcalendar/calendar.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/bootstrap.min.css"> --%>
<!-- 彈跳出預約輸入視窗用 -->
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/reservation/fullcalendar.css">
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/jquery.timepicker.css" />
<script type="text/javascript" src="<%= request.getContextPath()%>/js/site.js"></script>
<%-- <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/site.css" /> --%>

		
</head>
<body>
<!-- header -->
    	<jsp:include page="/header.jsp" />
<div class="container">
	<div id="title">預約專區</div>
	<div id="title"><a href="<%= request.getContextPath()%>/member/GetReservationDataByMemAction.action" class="btn btn-primary">前往個人預約清單</a></div>
	<div id='calendar'></div>
	
	
	<!-- 使用JQUERY onclick跳出預約視窗內容 -->
	<a href="#modal-id" id="resdata" role="button" class="modal fade" data-toggle="modal"></a>
	<!-- 跳出的預約視窗內容 -->
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<s:form  action="addReservation" namespace="/reservation">
							<div class="modal-header">
								<h4 class="modal-title">請輸入預約資料</h4>
							</div>			
							<div class="input-group">
							  	<span class="input-group-addon" id="basic-addon1">會員編號</span>
							 	<input id="memno" type="text" name="reservationVO.memberVO.mem_no" class="form-control" value="${memberVO.mem_no}" readonly>
							</div>
							<div class="input-group">
							  	<span class="input-group-addon" id="basic-addon1">預約日期</span>
							    <input  id="resdate" type="date" name="reservationVO.res_date" class="form-control" placeholder="預約日期" aria-describedby="basic-addon1" readonly>
							</div>
							<div class="input-group">
							  	<span class="input-group-addon" id="basic-addon1">預約開始時間</span>
							    <input id="timestart" type="text" name="reservationVO.res_timestart" class="form-control" placeholder="開始時間" aria-describedby="basic-addon1">
							</div>
							<script>
							 $(function() {
							     $('#timestart').timepicker({'timeFormat': 'h:i A'});
							});					 
							</script>	
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">預約結束時間</span>
								<input id="timeend" type="text" name="reservationVO.res_timeend" class="form-control" placeholder="結束時間" aria-describedby="basic-addon1">
							</div>
							<script>
							 $(function() {
							     $('#timeend').timepicker({'timeFormat': 'h:i A'});
							});					 
							</script>	
							<div class="input-group">
							  	<span class="input-group-addon" id="basic-addon1">預約項目</span>
							 	<input type="text" name="reservationVO.res_content" class="form-control" placeholder="預約項目" aria-describedby="basic-addon1">
							</div>	
							<div class="modal-footer">
								<input type="submit"  class="btn btn-primary" value="預約">
								<button type="submit" class="btn btn-primary" data-dismiss="modal">取消</button>
							</div>
					</s:form>
				</div>
			</div>
		</div>	
</div>		
 <!-- Footer -->
    	<jsp:include page="/footer.jsp" /> 	
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/reservation/fullcalendar.css">
</body>
</html>