<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.adm.model.*"%>
<%
	AdmService admSvc = new AdmService();
	List<AdmVO> list = admSvc.getAll();
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
	          <a href="#">管理者管理</a>
	        </li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>管理者編號</th>
						<th>管理者帳號</th>
						<th>管理者密碼</th>
						<th>管理者建立日期</th>
						<th>管理者帳號狀態</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
              </thead>
              <tbody>
             	<c:forEach var="admVO" items="${list}">
					<tr align='center' valign='middle' ${(admVO.adm_no==param.adm_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${admVO.adm_no}</td>
						<td>${admVO.adm_id}</td>
						<td>${admVO.adm_psw}</td>
						<td>${admVO.adm_createdate}</td>		
						<td>${admVO.adm_status}</td>
						<td>
						  <s:form action="getOne_For_Update" namespace="/adm">
						     <input type="submit" value="修改"> 
						     <input type="hidden" name="adm_no" value="${admVO.adm_no}">
						  </s:form>
						</td>
						<td>
						  <s:form action="delete" namespace="/adm">
						    <input type="submit" value="刪除">
						    <input type="hidden" name="adm_no" value="${admVO.adm_no}">
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