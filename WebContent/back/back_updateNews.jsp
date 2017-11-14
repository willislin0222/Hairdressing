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
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>修改最新消息</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">

</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="updateNews" namespace="/news">

            <div class="form-title-row">
                <h1>修改最新消息</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
			<div class="form-row">
                <label>
                    <span>最新消息編號</span>
                    <input type="text" name="newsVO.news_no" value="${newsVO.news_no}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>最新消息標題</span>
                    <input type="text" name="newsVO.news_title" value="${newsVO.news_title}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>最新消息內容</span>
                    <input type="textarea" name="newsVO.news_content" value="${newsVO.news_content}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>建立日期</span>
                    <input type="date" name="newsVO.news_createdate" value="${newsVO.news_createdate}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>最新消息狀態</span>
                    <select class="dropdown-toggle" size="1" name="newsVO.news_status">
						<option value="0" ${newsVO.news_status=="0"?'selected':''}>取消發布
						<option value="1" ${newsVO.news_status=="1"?'selected':''}>正常發布 
					</select>
                </label>
            </div>
            <div class="form-row">
                <button type="submit" class="btn btn-primary btn-lg">送出修改</button>  
            </div>

        </s:form>
        </div>

    </div>

</body>

</html>
