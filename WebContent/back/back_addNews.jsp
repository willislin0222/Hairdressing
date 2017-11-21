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
	<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>
	<title>新增最新消息</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">

</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="addNews" namespace="/news">

            <div class="form-title-row">
                <h1>新增最新消息</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
            <div class="form-row">
                <label>
                    <span>最新消息標題</span>
                    <input type="text" name="newsVO.news_title" placeholder="最新消息標題">
                </label>
            </div>
            <div class="form-row">
                <label class="label">
                    <span>最新消息內容</span>
                    <textarea class="form-control"  style="width:245px;height:200px;" name="newsVO.news_content" placeholder="最新消息內容"></textarea>
                </label>
            </div>
            <div class="form-row">
          		<input type="hidden" name="newsVO.news_status" value="1">
                <button type="submit" class="btn btn-primary btn-lg">新增最新消息</button>  
            </div>

        </s:form>
        </div>

    </div>
	
</body>

</html>
