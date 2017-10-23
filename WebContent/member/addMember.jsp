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
		<title>會員註冊</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/member/membermain.css">
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
				<s:form  action="addMember" namespace="/member">
					<div class="member">	
						<H3 class="membertitle">會員註冊基本資料</H3>
					</div>
					<div class="errorMsg">
					<s:fielderror fieldName="memberVO.mem_name" cssStyle="color: red" />
					<s:fielderror fieldName="mem_id" cssStyle="color: red" />
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">姓名</span>
					 	<input type="text" name="memberVO.mem_name" class="form-control" placeholder="中文姓名" aria-describedby="basic-addon1">
					</div>
					<div class="errorMsg">
					<s:fielderror fieldName="memberVO.mem_id" cssStyle="color: red" />
					</div >					
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">帳號</span>
					    <input type="text" name="memberVO.mem_id" class="form-control" placeholder="登入帳號" aria-describedby="basic-addon1">
					</div>
					<div class="errorMsg">
					<s:fielderror fieldName="memberVO.mem_psw" cssStyle="color: red" />
					</div >					
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">密碼</span>
					    <input type="text" name="memberVO.mem_psw" class="form-control"  placeholder="登入密碼" aria-describedby="basic-addon1">
					</div>
					<div class="errorMsg">
					<s:fielderror fieldName="memberVO.mem_birthday" cssStyle="color: red" />		
					</div >	
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">生日</span>
					    <input type="date" name="memberVO.mem_birthday" class="form-control" placeholder="生日" aria-describedby="basic-addon1">
					</div>
					<div class="errorMsg">
					<s:fielderror fieldName="memberVO.mem_email" cssStyle="color: red" />
					</div >
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">電子郵件</span>
					    <input type="email" name="memberVO.mem_email" class="form-control" placeholder="Ex:123@gmail.com" aria-describedby="basic-addon1">
					</div>
					<div class="errorMsg">
					<s:fielderror fieldName="memberVO.mem_mobile" cssStyle="color: red" />
					</div >					
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">行動電話</span>
					    <input type="tel" name="memberVO.mem_mobile" class="form-control" placeholder="0912345678" aria-describedby="basic-addon1">
					</div>		
					<div class="input-group btndiv">
						<button type="submit" class="btn btn-primary btn-lg">註冊會員</button>  	
					</div>	
				</s:form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>