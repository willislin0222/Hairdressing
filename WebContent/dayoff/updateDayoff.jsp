<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改休假日</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/news/newsmain.css">
	</head>
	<body>
	<c:if test="${not empty errorMsgs}">
		<font color="red">請修正以下錯誤
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach> 
		</font>
	</c:if>	
		
			<div class="container">
				<s:form action="updateDayoff" namespace="/dayoff">
					<div class="news">	
						<H3 class="newstitle">修改休假日</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">休假日編號</span>
					 	<input class="form-control" name="dayoffVO.day_no" type="text" value="${dayoffVO.day_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">休假日標題</span>
					 		<input type="text" name="dayoffVO.day_title" class="form-control" value="${dayoffVO.day_title}" aria-describedby="basic-addon1">					  	
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">休假日期</span>
					    <input type="date" name="dayoffVO.day_date" class="form-control" value="${dayoffVO.day_date}" aria-describedby="basic-addon1" >
					</div>
					<div class="input-group btndiv">
						<button type="submit" class="btn btn-primary btn-lg">送出修改</button>  	
					</div>	
				</s:form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>