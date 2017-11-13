<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dayoff.model.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%
	DayoffService dayoffSvc = new DayoffService();
	List<DayoffVO> list = dayoffSvc.getAll();
	request.setAttribute("list", list);	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/breadcrumb.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back/css/dayoffManage.css">
<title>後端管理系統</title>
</head>
<body>
	<%@ include file="back_template/back_template_top.file"%>
	
	<!-- Breadcrumbs-->
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          <a href="#">休息日管理</a>
	        </li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="main-content addbtn">
		 <a  href='<%=request.getContextPath()%>/reservation/fullcalendar.jsp' class="btn btn-primary">前往預約專區</a>
		 <a id="adddayoff" href='#modal-id' data-toggle="modal" class="btn btn-primary">新增休假日</a>
	</div><br>
	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>編號</th>
						<th>標題</th>
						<th>休息日</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
              </thead>
              <tbody>
             	<c:forEach var="dayoffVO" items="${list}">
					<tr align='center' valign='middle'><!--將修改的那一筆加入對比色而已-->
						<td>${dayoffVO.day_no}</td>
						<td>${dayoffVO.day_title}</td>
						<td>${dayoffVO.day_date}</td>
						<td>
							 <a href="#dayoffform${dayoffVO.day_no}" data-toggle="modal" class="btn btn-primary">修改</a>
						</td>
						<td>
						  <s:form action="delete" namespace="/dayoff">
						    <input type="submit"  class="btn btn-primary" value="刪除">
						     <input type="hidden" name="day_no" value="${dayoffVO.day_no}">
						  </s:form>
						</td>
					</tr>
				</c:forEach>
              </tbody>
            </table>
          </div>
        </div>
     </div>	
     
	<%@ include file="back_template/back_template_bottom.file"%>	
	 <!-- 跳出新增休假日視窗 -->
		<div class="modal fade" id="modal-id">
			<div class="modal-dialog">
				<div class="modal-content">
					<s:form action="addDayoff" namespace="/dayoff">
						<div class="modal-header">
							<h4 class="modal-title">新增休假日</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<s:fielderror cssStyle="color: red" />
							<div class="input-group">
							  	<span class="input-group-addon" id="basic-addon1">休假日標題</span>
							 	<input type="text" name="dayoffVO.day_title" class="form-control" value="${dayoffVO.day_title}" aria-describedby="basic-addon1">
							</div>
							<div class="input-group">
							  	<span class="input-group-addon" id="basic-addon1">休假日期</span>
							    <input type="date" name="dayoffVO.day_date" class="form-control" value="${dayoffVO.day_date}" aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
							<button type="submit" type="button" class="btn btn-primary">新增休假日</button>
						</div>
					</s:form>
				</div>
			</div>
		</div>
		
<c:forEach var="dayoffVO" items="${list}">
<!-- 跳出修改休假日內容表單 -->
<div class="modal fade" id="dayoffform${dayoffVO.day_no}">
			<div class="modal-dialog">
				<div class="modal-content">
					<s:form  action="updateDayoff" namespace="/dayoff">
					<div class="modal-header">
						<h4 class="modal-title updatedayofftitle">修改休假日資料</h4>
					</div>	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">編號</span>
					 	<input type="text" name="dayoffVO.day_no" class="form-control inputtext" value="${dayoffVO.day_no}" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">標題</span>
					 	<input type="text" name="dayoffVO.day_title" class="form-control inputtext" value="${dayoffVO.day_title}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">休假日期</span>
					    <input type="date" name="dayoffVO.day_date" class="form-control inputtext" value="${dayoffVO.day_date}" aria-describedby="basic-addon1">
					</div>
					<div class="modal-footer">
						<input type="submit"  class="btn btn-primary" value="修改休假日內容">
						<button type="submit" class="btn btn-primary" data-dismiss="modal">取消</button>
					</div>	
				</s:form>	
				</div>
			</div>
</div>
</c:forEach>
<s:fielderror/>
</body>
</html>