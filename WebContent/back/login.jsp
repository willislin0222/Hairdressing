<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>後端管理員登入</title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">後端管理員登入</div>
      <div class="card-body">
        <s:form class="form-basic" method="post" action="login" namespace="/adm">
          <div class="form-group">
            <label for="exampleInputEmail1">帳號</label>
            <input name="adm_id" class="form-control" id="exampleInputEmail1" type="text" aria-describedby="emailHelp" placeholder="帳號" value="${param.adm_id}">
	          	<div class="errMsg">
	                    <c:if test="${errorMsgs.adm_id != null}">
	                    	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
	                    	${errorMsgs.adm_id}
	                    </c:if>
	                    <c:if test="${errorMsgs.login_error != null}">
	                    	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
	                    	${errorMsgs.login_error}
	                    </c:if>
	            </div>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">密碼</label>
            <input name="adm_psw"class="form-control" id="exampleInputPassword1" type="password" placeholder="Password">
          </div>
          <input class="btn btn-primary btn-block" type="submit" value="登入" id="btnLogin">
        </s:form>
        <div class="text-center">
          <a class="d-block small" href="forgot-password.html">忘記密碼</a>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
