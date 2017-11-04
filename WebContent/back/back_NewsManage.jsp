<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.news.model.*"%>
<%
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	request.setAttribute("list", list);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/breadcrumb.css" rel="stylesheet"/>
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
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>最新消息編號</th>
						<th>最新消息標題</th>
						<th>最新消息內容</th>
						<th>最新消息建立日期</th>
						<th>最新消息狀態</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
              </thead>
              <tbody>
             	<c:forEach var="newsVO" items="${list}">
					<tr align='center' valign='middle' ${(newsVO.news_no==param.news_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${newsVO.news_no}</td>
						<td>${newsVO.news_title}</td>
						<td>${newsVO.news_content}</td>
						<td>${newsVO.news_createdate}</td>		
						<td>${newsVO.news_status}</td>		
						<td>
						  <s:form action="getOne_For_Update" namespace="/news">
						     <input type="submit" value="修改"> 
						     <input type="hidden" name="news_no" value="${newsVO.news_no}">
						  </s:form>
						</td>
						<td>
						  <s:form action="delete" namespace="/news">
						    <input type="submit" value="刪除">
						    <input type="hidden" name="news_no" value="${newsVO.news_no}">
						    <input type="hidden" name="news_status" value="1">
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