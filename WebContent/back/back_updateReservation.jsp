<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>修改預約資料</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">
	<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.timepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/jquery.timepicker.css" />
</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form  action="backupdateReservation" namespace="/reservation">

            <div class="form-title-row">
                <h1>新增預約</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
            <div class="form-row">
                <label>
                    <span>會員編號</span>
                    <input type="text" name="reservationVO.memberVO.mem_no" value="${reservationVO.memberVO.mem_no}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>預約日期</span>
                    <input type="date" name="reservationVO.res_date" value="${reservationVO.res_date}">
                </label>
            </div>
             <div class="form-row">
                <label>
                    <span>預約開始時間</span>
                    <input id="timestart" type="text" name="reservationVO.res_timestart" value="${reservationVO.res_timestart}">
                </label>
            </div>
            <script>
				 $(function() {
				     $('#timestart').timepicker({'timeFormat': 'h:i A'});
				});					 
			</script>	
             <div class="form-row">
                <label>
                    <span>預約結束時間</span>
                    <input id="timeend" type="text" name="reservationVO.res_timeend" value="${reservationVO.res_timeend}">
                </label>
            </div>
            <script>
				 $(function() {
				     $('#timeend').timepicker({'timeFormat': 'h:i A'});
				});					 
			</script>
			<div class="form-row">
                <label>
                    <span>預約項目</span>
                    <input type="text" name="reservationVO.res_content" value="${reservationVO.res_content}">
                </label>
            </div>
            <div class="form-row">
          		<input type="hidden" name="reservationVO.res_no" value="${reservationVO.res_no}">
                <button type="submit" class="btn btn-primary btn-lg">預約</button>  
            </div>

        </s:form>
        </div>

    </div>

</body>

</html>
