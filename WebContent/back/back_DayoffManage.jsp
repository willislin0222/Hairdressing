<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dayoff.model.*"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back/css/newsManage.css">
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
		 <a href="<%=request.getContextPath()%>/dayoff/addDayoff.jsp" role="button" class="btn btn-primary back_btn reg_adm_btn">新增休假日</a>
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
						  <s:form action="getOne_For_Update" namespace="/dayoff">
						     <input type="submit" value="修改"> 
						     <input type="hidden" name="day_no" value="${dayoffVO.day_no}">
						  </s:form>
						</td>
						<td>
						  <s:form action="delete" namespace="/dayoff">
						     <input type="submit" value="刪除"> 
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
</body>
</html>