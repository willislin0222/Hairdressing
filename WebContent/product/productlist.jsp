<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
	ProductService productSvc = new ProductService();
	List<ProductVO> list = productSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

  </head>

  <body>

    <!-- header -->
    	<jsp:include page="/header.jsp" />

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">商品列表
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">首頁</a>
        </li>
        <li class="breadcrumb-item active">商品列表</li> 
      </ol>

      <div class="row">
      <%@ include file="/pages/productpage.file" %>
      <c:forEach var="productVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">        
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img height="400px" class="card-img-top" src="productImage.do?imglist=1&pro_no=${productVO.pro_no}" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                	<a href="productdetail.jsp">${productVO.pro_name}</a>
              </h4>
            	 <h5>$<span class="card-text">${productVO.pro_price}</span></h5>
            	   商品介紹:<span class="card-text">${productVO.pro_desc}</span>
            </div>
          </div>
        </div>
</c:forEach>       
       
        
        
    
      </div>
<%@ include file="/pages/page4.file" %>
   
    </div>
    <!-- /.container -->

   <!-- Footer -->
    <jsp:include page="/footer.jsp" />

  </body>

</html>
