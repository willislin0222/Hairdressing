<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>修改會員資料</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/member/membermain.css">
	</head>
	<body>
		
			<div class="container">
				<s:form  action="updateMember">
					<div class="member">	
						<H3 class="membertitle">修改會員資料</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">姓名</span>
					 		<input type="text" name="memberVO.mem_name" class="form-control" value="${memberVO.mem_name}" aria-describedby="basic-addon1">					  	
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">帳號</span>
					    <input class="form-control" name="memberVO.mem_id" type="text" value="${memberVO.mem_id}" readonly > 
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">密碼</span>
					    <input type="text" name="memberVO.mem_psw" class="form-control" value="${memberVO.mem_psw}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">生日</span>
					    <input type="date" name="memberVO.mem_birthday" class="form-control" value="${memberVO.mem_birthday}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">電子郵件</span>
					    <input type="email" name="memberVO.mem_email" class="form-control" value="${memberVO.mem_email}" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">行動電話</span>
					    <input type="tel" name="memberVO.mem_mobile" class="form-control" value="${memberVO.mem_mobile}" aria-describedby="basic-addon1">
					</div>
			
					<div class="input-group btndiv">
						<input type="hidden" name="memberVO.mem_no" value="${memberVO.mem_no}">
						<input type="hidden" name="memberVO.mem_joindate" value="${memberVO.mem_joindate}">
						<button type="submit" class="btn btn-primary btn-lg">送出修改</button>  	
					</div>	
				</s:form>	
			</div>

		
		
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>