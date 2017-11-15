<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page  import="java.util.*"%>
<%	
	Map<String, String> admStatusMap = new LinkedHashMap<String,String>();
	admStatusMap.put("0", "停用");
	admStatusMap.put("1", "正常");
	pageContext.setAttribute("newsStatusMap",admStatusMap);
	
%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>修改管理者</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">

</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="updateAdm" namespace="/adm">

            <div class="form-title-row">
                <h1>修改管理者帳號</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
			<div class="form-row">
                <label>
                    <span>管理員帳號</span>
                    <input type="text" name="admVO.adm_no" placeholder="管理員帳號" value="${admVO.adm_no}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>管理員帳號</span>
                    <input type="text" name="admVO.adm_id" placeholder="管理員帳號" value="${admVO.adm_id}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>管理員密碼</span>
                    <input type="textarea" name="admVO.adm_psw" placeholder="管理員密碼" value="${admVO.adm_psw}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>建立日期</span>
                    <input type="date" name="admVO.adm_createdate" value="${admVO.adm_createdate}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>帳號狀態</span>
                    <select class="dropdown-toggle" size="1" name="admVO.adm_status">
						<option value="0" ${admVO.adm_status=="0"?'selected':''}>停用
						<option value="1" ${admVO.adm_status=="1"?'selected':''}>正常 
					</select>
                </label>
            </div>
            <div class="form-row">
                <button type="submit" class="btn btn-primary btn-lg">修改管理員</button>  
            </div>

        </s:form>
        </div>

    </div>

</body>

</html>
