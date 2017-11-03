<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.reservation.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<%
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");	
	MemberService memberSvc = new MemberService();
	Set<ReservationVO> set = memberSvc.getReservationsByMemno(memberVO.getMem_no());
	List<ReservationVO> list = new LinkedList<ReservationVO>();
	list.addAll(set);
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有預約資料 - listAllReservation.jsp</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/reservation/reservationmain.css">
</head>
<body bgcolor='white'>
<table border='1' bordercolor='#CCCCFF' width='100%'>
	<tr align='center'>
		<th>預約編號</th>
		<th>會員名稱</th>
		<th>預約日期</th>
		<th>預約開始時間</th>
		<th>預約結束時間</th>
		<th>預約項目</th>
		<th>修改</th>
	</tr>
	<%@ include file="/pages/page1.file" %>   
	<c:forEach var="reservationVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(reservationVO.res_no==param.res_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${reservationVO.res_no}</td>
			<td>${reservationVO.memberVO.mem_name}</td>
			<td>${reservationVO.res_date}</td>
			<td>${reservationVO.res_timestart}</td>
			<td>${reservationVO.res_timeend}</td>
			<td>${reservationVO.res_content}</td>
			<td>
			  	 <a href="#resupdateform${reservationVO.res_no}" data-toggle="modal" class="btn btn-primary">修改</a>
			</td>
		</tr>	
		
	</c:forEach>
</table>
<%@ include file="/pages/page3.file" %>

<c:forEach var="reservationVO" items="${list}">
<!-- 跳出修改預約內容表單 -->
<div class="modal fade" id="resupdateform${reservationVO.res_no}">
			<div class="modal-dialog">
				<div class="modal-content">
					<s:form  action="updateReservation" namespace="/reservation">
					<div class="modal-header">
						<h4 class="modal-title">修改預約資料</h4>
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約編號</span>
					 	<input type="text" name="reservationVO.res_no" class="form-control" value="${reservationVO.res_no}" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約日期</span>
					    <input  type="date" name="reservationVO.res_date" class="form-control" value="${reservationVO.res_date}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約開始時間</span>
					    <input id="timestartupdate${reservationVO.res_no}" type="text" name="reservationVO.res_timestart" class="form-control" value="${reservationVO.res_timestart}" aria-describedby="basic-addon1">
					</div>
					<script>
					 $(function() {
					     $('#timestartupdate${reservationVO.res_no}').timepicker({'timeFormat': 'h:i A'});
					});					 
					</script>	
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon1">預約結束時間</span>
						<input id="timeendupdate${reservationVO.res_no}" type="text" name="reservationVO.res_timeend" class="form-control" value="${reservationVO.res_timeend}" aria-describedby="basic-addon1">
					</div>
					<script>
					 $(function() {
					     $('#timeendupdate${reservationVO.res_no}').timepicker({'timeFormat': 'h:i A'});
					});					 
					</script>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">預約項目</span>
					 	<input type="text" name="reservationVO.res_content" class="form-control" value="${reservationVO.res_content}" aria-describedby="basic-addon1">
					</div>				
					<div class="modal-footer">
					    <input type="hidden" name="reservationVO.memberVO.mem_no" value="${memberVO.mem_no}">
						<input type="submit"  class="btn btn-primary" value="修改預約內容">
						<button type="submit" class="btn btn-primary" data-dismiss="modal">取消</button>
					</div>	
				</s:form>	
				</div>
			</div>
</div>
</c:forEach>
</body>
</html>
