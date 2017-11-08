<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<% 
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	Vector<ProductVO> buylist =(Vector<ProductVO>) session.getAttribute("shoppingcart");
	if(buylist != null){
		System.out.println(buylist.size());
	 	int buylistcount = buylist.size();
	 	pageContext.setAttribute("buylistcount", buylistcount);
	}
	
%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/css/modern-business.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">LOGO</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
         	<c:if test="${memberVO == null}">
	            <li class="nav-item">
	              <a class="nav-link" href="<%= request.getContextPath()%>/member/login.jsp">會員登入</a>
	            </li>
	        </c:if>
            <c:if test="${memberVO != null}">
		        <li class="nav-item"><a class="nav-link" href="#">${memberVO.mem_name}歡迎您</a></li>
		        <li><a class="nav-link" href="<%=request.getContextPath()%>/member/memberManager.jsp">會員專區</a></li>
		        <li><a class="nav-link" href="<%=request.getContextPath()%>/member/logout.jsp">登出</a></li>
			</c:if>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/reservation/fullcalendar.action">預約專區</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/product/productlist.jsp">美髮商城</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/shopping/cart.jsp">購物車<span style="font-size:16px;" class="badge">${buylistcount}</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/contact.jsp">聯絡我</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  </body>

</html>
