<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page  import="com.offer.model.*"%>
<%@ page  import="java.util.*"%>
<%	
	Map<String, String> offerStatusMap = new LinkedHashMap<String,String>();
	offerStatusMap.put("0", "優惠結束");
	offerStatusMap.put("1", "優惠進行中");
	pageContext.setAttribute("offerStatusMap",offerStatusMap);
	
%>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>修改優惠資訊</title>

	<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/news/form-basic.css">
	<script src='<%= request.getContextPath()%>/js/fullcalendar/jquery.min.js'></script>
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/jquery.timepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/jquery.timepicker.css" />
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/imgView.css">
	<script type="text/javascript" src="<%= request.getContextPath()%>/js/ImageView.js"></script>
</head>
<body>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
		<div class="form-basic">
        <s:form action="updateOffer" namespace="/offer" enctype="multipart/form-data" method="POST">

            <div class="form-title-row">
                <h1>修改優惠資訊</h1>
            </div>
			<s:fielderror cssStyle="color: red" />
			<div class="form-row">
                <label>
                    <span>優惠編號</span>
                    <input type="text" name="offerVO.off_no" value="${offerVO.off_no}" readonly>
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>優惠標題</span>
                    <input type="text" name="offerVO.off_title" value="${offerVO.off_title}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>優惠內容</span>
                    <input type="text" name="offerVO.off_content" value="${offerVO.off_content}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>優惠圖片</span>
                    <input type="file" name="fileUpload">
                </label>
            </div>
            <div class="input-group" id="imageView">
			    <img src="offerImage.do?off_no=${offerVO.off_no}" width="100%">
			</div>	
            <div class="form-row">
                <label>
                    <span>開始日期</span>
                    <input type="date" name="offerVO.off_start" placeholder="開始日期" value="${offerVO.off_start}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>結束日期</span>
                    <input type="date" name="offerVO.off_end" placeholder="結束日期" value="${offerVO.off_end}">
                </label>
            </div>
            <div class="form-row">
                <label>
                    <span>優惠狀態</span>
                    <select class="dropdown-toggle" size="1" name="offerVO.off_status">
						<option value="0" ${offerVO.off_status=="0"?'selected':''}>優惠結束
						<option value="1" ${offerVO.off_status=="1"?'selected':''}>優惠進行中 
					</select>
                </label>
            </div>
            <div class="form-row">
                <button type="submit" class="btn btn-primary btn-lg">修改優惠訊息</button>  
            </div>
        </s:form>
        </div>

    </div>

</body>

</html>
