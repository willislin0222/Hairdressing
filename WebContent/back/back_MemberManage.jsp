<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>
<%
	MemberService memberSvc = new MemberService();
	List<MemberVO> list = memberSvc.getAll();
	request.setAttribute("list", list);	

	List<String> memstatus = new ArrayList<>();
	memstatus.add("停用");
	memstatus.add("正常");
    request.setAttribute("memstatus", memstatus);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>後端管理系統</title>
</head>
<body>
	<%@ include file="back_template/back_template_top.file"%>
	
	<!-- Breadcrumbs-->
	      <ol class="breadcrumb">
	        <li class="breadcrumb-item">
	          <a href="#">會員管理</a>
	        </li>
	        <li class="breadcrumb-item active">所有會員清單</li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>會員編號</th>
						<th>會員姓名</th>
						<th>會員帳號</th>
						<th>會員密碼</th>
						<th>會員生日</th>
						<th>會員電子郵件</th>
						<th>會員電話</th>
						<th>會員加入日期</th>
						<th>會員狀態</th>
						<th>停用</th>
						<th>刪除</th> 
					</tr>
              </thead>
              <tbody>
             	 <c:forEach var="memberVO" items="${list}">
					<tr align='center' valign='middle' ${(memberVO.mem_no==param.mem_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${memberVO.mem_no}</td>
						<td>${memberVO.mem_name}</td>
						<td>${memberVO.mem_id}</td>
						<td>${memberVO.mem_psw}</td>
						<td>${memberVO.mem_birthday}</td>
						<td>${memberVO.mem_email}</td>
						<td>${memberVO.mem_mobile}</td>	
						<td>${memberVO.mem_joindate}</td>		
						<td>${memstatus[memberVO.mem_status]}</td>		
						<td>
							  <s:form action="end" namespace="/member" >
							    <input type="submit"  class="btn btn-primary" value="停用">
							    <input type="hidden" name="mem_no" value="${memberVO.mem_no}">
							  </s:form>
						</td>
						<td>
						  <s:form action="delete" namespace="/member" >
						    <input type="submit"  class="btn btn-primary" value="刪除">
						    <input type="hidden" name="mem_no" value="${memberVO.mem_no}">
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