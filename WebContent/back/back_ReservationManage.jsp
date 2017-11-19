<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.reservation.model.*"%>
<%
	ReservationService reservationSvc = new ReservationService();
	List<ReservationVO> list = reservationSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back/css/reservationManage.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css"> -->
<title>後端管理系統</title>
</head>
<body>
	<%@ include file="back_template/back_template_top.file"%>
	<!-- Breadcrumbs-->
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          <a href="#">預約管理</a>
	        </li>
	        <li class="breadcrumb-item active">所有預約明細</li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="main-content addbtn">
		 <a href="<%=request.getContextPath()%>/reservation/fullcalendar.jsp" role="button" class="btn btn-primary back_btn reg_adm_btn">預約行事曆</a>
		 <a href="<%=request.getContextPath()%>/back/back_addReservation.jsp" role="button" class="btn btn-primary back_btn reg_adm_btn">新增預約</a>
	</div><br>
	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
					<th>預約編號</th>
					<th>會員名稱</th>
					<th>預約日期</th>
					<th>預約開始時間</th>
					<th>預約結束時間</th>
					<th>預約項目</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
              </thead>
              <tbody>
               <c:forEach var="reservationVO" items="${list}">
					<tr align='center' valign='middle' ${(reservationVO.res_no==param.res_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${reservationVO.res_no}</td>
						<td>${reservationVO.memberVO.mem_name}</td>
						<td>${reservationVO.res_date}</td>
						<td>${reservationVO.res_timestart}</td>
						<td>${reservationVO.res_timeend}</td>
						<td>${reservationVO.res_content}</td>
						<td>
						  <s:form action="backgetOne_For_Update" namespace="/reservation">
						     <input type="submit"  class="btn btn-primary" value="修改"> 
						     <input type="hidden" name="res_no" value="${reservationVO.res_no}">
						  </s:form>
						</td>
						<td>
						  <s:form action="backdelete" namespace="/reservation">
						    <input type="submit"  class="btn btn-primary" value="刪除">
						    <input type="hidden" name="res_no" value="${reservationVO.res_no}">
						  </s:form>
						</td>
					</tr>
				</c:forEach>
              </tbody>
            </table>
          </div>
        </div>
     </div>

<%-- <%@ include file="/pages/page3.file" %> --%>
	<%@ include file="back_template/back_template_bottom.file"%>	
</body>
</html>