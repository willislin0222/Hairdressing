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
		<title>新增管理員</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/back/css/admmain.css">
	</head>
	<body>
	<%-- 錯誤表列 --%>
    <s:fielderror cssStyle="color: red" />
		
			<div class="container">
				<s:form action="addAdm" namespace="/adm">
					<div class="adm">	
						<H3 class="admtitle">新增管理員</H3>
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">管理員帳號</span>
					 	<input type="text" name="admVO.adm_id" class="form-control" placeholder="管理員帳號" aria-describedby="basic-addon1">
					</div>
					<div class="input-group">
					  	<span class="input-group-addon" id="basic-addon1">管理員密碼</span>
					    <input type="text" name="admVO.adm_psw" class="form-control" placeholder="管理員密碼" aria-describedby="basic-addon1">
					</div>
					<div class="input-group btndiv">
						<input type="hidden" name="admVO.adm_status" value="1">
						<button type="submit" class="btn btn-primary btn-lg">新增管理員</button>  	
					</div>
				</s:form>
			</div>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</body>
</html>