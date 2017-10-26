<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset='utf-8' />
<link href='<%= request.getContextPath()%>/css/fullcalendar/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath()%>/css/fullcalendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='<%= request.getContextPath()%>/js/fullcalendar/moment.min.js'></script>
<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
<script src='<%= request.getContextPath()%>/js/fullcalendar/fullcalendar.min.js'></script>
<link href='<%= request.getContextPath()%>/css/fullcalendar/calendar.css' rel='stylesheet' />
<script src="<%= request.getContextPath()%>/js/fullcalendar/calendar.js"></script>
</head>
<body>
	<div id='calendar'></div>
</body>
</html>