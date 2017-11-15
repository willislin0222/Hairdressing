<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>新增管理員</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">

</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="addAdm" namespace="/adm">

            <div class="form-title-row">
                <h1>新增管理員</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
            <div class="form-row">
                <label>
                    <span>管理員帳號</span>
                    <input type="text" name="admVO.adm_id" placeholder="管理員帳號" value="${admVO.adm_id}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>管理員密碼</span>
                    <input type="textarea" name="admVO.adm_psw" placeholder="管理員密碼" value="${admVO.adm_psw}">
                </label>
            </div>
            <div class="form-row">
          		<input type="hidden" name="admVO.adm_status" value="1">
                <button type="submit" class="btn btn-primary btn-lg">新增管理員</button>  
            </div>

        </s:form>
        </div>

    </div>

</body>

</html>
