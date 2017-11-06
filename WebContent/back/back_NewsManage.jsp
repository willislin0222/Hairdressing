<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.news.model.*"%>
<%
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	request.setAttribute("list", list);	
	
	List<String> newsstatus = new ArrayList<>();
	newsstatus.add("停止");
	newsstatus.add("公告中");
    request.setAttribute("newsstatus", newsstatus);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/breadcrumb.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back/css/newsManage.css">
<title>後端管理系統</title>
</head>
<body>
	<%@ include file="back_template/back_template_top.file"%>
	
	<!-- Breadcrumbs-->
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          <a href="#">最新消息管理</a>
	        </li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="main-content addbtn">
		 <a href="<%=request.getContextPath()%>/back/back_addNews.jsp" role="button" class="btn btn-primary back_btn reg_adm_btn">新增最新公告</a>
	</div><br>
	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>編號</th>
						<th>標題</th>
						<th>內容</th>
						<th>建立日期</th>
						<th>狀態</th>
						<th>修改</th>
						<th>停止發布</th>
					</tr>
              </thead>
              <tbody>
             	<c:forEach var="newsVO" items="${list}">
					<tr align='center' valign='middle' ${(newsVO.news_no==param.news_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${newsVO.news_no}</td>
						<td>${newsVO.news_title}</td>
						<td>${newsVO.news_content}</td>
						<td>${newsVO.news_createdate}</td>		
						<td>${newsstatus[newsVO.news_status]}</td>		
						<td>
						  <s:form action="getOne_For_Update" namespace="/news">
						     <input type="submit" value="修改"> 
						     <input type="hidden" name="news_no" value="${newsVO.news_no}">
						  </s:form>
						</td>
						<td>
						  <s:form action="end" namespace="/news">
						     <input type="submit" value="停止公告"> 
						     <input type="hidden" name="news_no" value="${newsVO.news_no}">
						  </s:form>
						</td>
					</tr>
				</c:forEach>
              </tbody>
            </table>
          </div>
        </div>
     </div>	
     
	<%@ include file="back_template/back_template_bottom.file"%>	
</body>
</html>