<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page  import="com.adm.model.*"%>
<%@ page  import="java.util.*"%>
<%	
	Map<String, String> admStatusMap = new LinkedHashMap<String,String>();
	admStatusMap.put("0", "停用");
	admStatusMap.put("1", "正常");
	pageContext.setAttribute("newsStatusMap",admStatusMap);
	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改管理者</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/back/css/admmain.css">
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
				<s:form action="updateAdm" namespace="/adms">
					<div class="adm">	
						<H3 class="admtitle">修改管理者帳號</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">管理員編號</span>
					 	<input class="form-control" name="admVO.adm_no" type="text" value="${admVO.adm_no}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">管理員帳號</span>
					 		<input type="text" name="admVO.adm_id" class="form-control" value="${admVO.adm_id}" aria-describedby="basic-addon1">					  	
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">管理員密碼</span>
					    <input type="text" name="admVO.adm_psw" class="form-control" value="${admVO.adm_psw}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">管理員建立日期</span>
					    <input type="date" name="admVO.adm_createdate" class="form-control" value="${admVO.adm_createdate}" aria-describedby="basic-addon1" readonly>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">帳號狀態</span>				
						<select class="dropdown-toggle" size="1" name="admVO.adm_status">
							<option value="0" ${admVO.adm_status=="0"?'selected':''}>停用
							<option value="1" ${admVO.adm_status=="1"?'selected':''}>正常 
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