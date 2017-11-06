<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page  import="com.news.model.*"%>
<%@ page  import="java.util.*"%>
<%	
	Map<String, String> newsStatusMap = new LinkedHashMap<String,String>();
	newsStatusMap.put("0", "取消發布");
	newsStatusMap.put("1", "正常發布");
	pageContext.setAttribute("newsStatusMap",newsStatusMap);
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改最新消息</title>
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
				<s:form action="updateNews" namespace="/news">
					<div class="news">	
						<H3 class="newstitle">修改最新消息</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">最新消息編號</span>
					 	<input class="form-control" name="newsVO.news_no" type="text" value="${newsVO.news_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">最新消息標題</span>
					 		<input type="text" name="newsVO.news_title" class="form-control" value="${newsVO.news_title}" aria-describedby="basic-addon1">					  	
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">最新消息內容</span>
					    <input type="text" name="newsVO.news_content" class="form-control" value="${newsVO.news_content}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">最新消息建立日期</span>
					    <input type="date" name="newsVO.news_createdate" class="form-control" value="${newsVO.news_createdate}" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">最新消息狀態</span>				
						<select class="dropdown-toggle" size="1" name="newsVO.news_status">
							<option value="0" ${newsVO.news_status=="0"?'selected':''}>取消發布
							<option value="1" ${newsVO.news_status=="1"?'selected':''}>正常發布 
						</select>
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