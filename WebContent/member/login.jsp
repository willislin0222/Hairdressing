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
		<title>登入會員</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/member/membermain.css">
	</head>
	<body>
		
			<div class="container">
				<s:form  action="login" namespace="/member">
					<div class="member">	
						<H3 class="membertitle">會員登入</H3>
					</div>
					<s:fielderror fieldName="errorMsg" cssStyle="color: red" />
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">帳號</span>
					    <input type="text" name="mem_id" class="form-control" placeholder="登入帳號" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">密碼</span>
					    <input type="text" name="mem_psw" class="form-control"  placeholder="登入密碼" aria-describedby="basic-addon1">
					</div>		
					<div class="input-group btndiv">
						<button type="submit" class="btn btn-primary btn-lg">登入</button>&nbsp;&nbsp;&nbsp;  	
						<a href="<%= request.getContextPath()%>/member/addMember.jsp" class="btn btn-primary btn-lg" role="button">會員註冊</a>
					</div>	
				</s:form>	
			</div>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>