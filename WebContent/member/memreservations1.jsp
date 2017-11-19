<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>



<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath()%>/css/member/memreservations.css"">


<meta charset='utf-8' />
<script src='<%= request.getContextPath()%>/js/fullcalendar/moment.min.js'></script>
<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
<script src='<%= request.getContextPath()%>/js/bootstrap.min.js'></script>
<!-- 彈跳出預約輸入視窗用 -->
<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.timepicker.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/jquery.timepicker.css" />
</head>
<body bgcolor='white'>
<!-- header -->
    	<jsp:include page="/header.jsp" />
    	<div class="container">
	    	<div id="title">${memberVO.mem_name}的預約清單</div>
	  		
	  		<jsp:include page="/reservation/listReservationsByMemno.jsp" />
		</div>
	
		<jsp:include page="/footer.jsp" />

</body>
</html>



