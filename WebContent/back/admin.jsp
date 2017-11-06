<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.adm.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>

<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>管理員登入</title>
	<link rel="stylesheet" href="css/login_back_end.css">
	<link rel="stylesheet" href="css/toast.css">
    <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">	
</head>
<body>
	<video id="bgvid" playsinline autoplay muted loop>
	<source src="css/koi.mp4" type="video/webm">
	</video>
	<div class="main-content">
        <s:form class="form-basic" method="post" action="login" namespace="/adm">
            <div class="form-title-row">
                <h1>管理員登入</h1>
            </div>
            <div class="form-row">
                <label>
                    <span>管理員帳號</span>
                    <input type="TEXT" name="adm_id" id="adm_id" value="${param.adm_id}"/>
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
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>管理員密碼</span>
				    <input type="password" name="adm_psw" value="${param.adm_psw}"/>
                    <div class="errMsg">
                    	<c:if test="${errorMsgs.adm_psw != null}">
                    	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    	${errorMsgs.adm_psw}
                    	</c:if>
                    	<c:if test="${errorMsgs.login_error != null}">
                    	<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
                    	${errorMsgs.login_error}
                    </c:if>
                    </div>
                </label>
            </div>
            <div class="form-row-submit">
                <a href="forget_psw.jsp" id="forgetPsw">忘記密碼</a>
                <input type="submit" value="登入" id="btnLogin">
            </div>
        </s:form>
    </div>
</body>

</html>

