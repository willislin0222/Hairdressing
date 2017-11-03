<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.offer.model.*"%>
<%
	OfferService offerSvc = new OfferService();
	List<OfferVO> list = offerSvc.getAll();
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
	          <a href="#">會員管理</a>
	        </li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>優惠訊息編號</th>
						<th>優惠訊息標題</th>
						<th>優惠訊息內容</th>
						<th>優惠訊息圖片</th>
						<th>優惠開始日期</th>
						<th>優惠結束日期</th>
						<th>優惠狀態</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
              </thead>
              <tbody>
             	<c:forEach var="offerVO" items="${list}">
					<tr align='center' valign='middle' ${(offerVO.off_no==param.off_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${offerVO.off_no}</td>
						<td>${offerVO.off_title}</td>
						<td>${offerVO.off_content}</td>
						<td><img src="offerImage.do?off_no=${offerVO.off_no}" width="200px" height="200px"></td>
						<td>${offerVO.off_start}</td>
						<td>${offerVO.off_end}</td>	
						<td>${offerVO.off_status}</td>		
						<td>
						  <s:form action="getOne_For_Update" namespace="/offer">
						     <input type="submit" value="修改"> 
						     <input type="hidden" name="off_no" value="${offerVO.off_no}">
						  </s:form>
						</td>
						<td>
						  <s:form action="delete" namespace="/offer">
						    <input type="submit" value="刪除">
						    <input type="hidden" name="off_no" value="${offerVO.off_no}">
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