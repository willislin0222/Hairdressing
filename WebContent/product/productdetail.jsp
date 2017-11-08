<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/css/product/productmain.css">
    <title>Modern Business - Start Bootstrap Template</title>


  </head>

  <body>

     <!-- header -->
    	<jsp:include page="/header.jsp" />

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Portfolio Item
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.html">首頁</a>
        </li>
        <li class="breadcrumb-item active">商品詳情${productVO.pro_no}</li>
      </ol>
<s:form action="addbuylist" namespace="/shopping">
      <!-- Portfolio Item Row -->
      <div class="row">

        <div class="col-md-7">
          <img class="img-fluid1" src="<%=request.getContextPath()%>/product/productImage.do?imglist=1&pro_no=${productVO.pro_no}" alt="">
        </div>

        <div class="col-md-5">
          <font style="color:red"><h3 class="my-3">${productVO.pro_name}</h3></font>
          <h6 class="my-3">${productVO.pro_desc}</h6>
       	  <h1 class="my-3">${productVO.pro_price}</h1>
       	  <input class="btn btn-primary btn-lg" type="hidden" name="productVO.pro_no" value="${productVO.pro_no}">
       	  <input class="btn btn-primary btn-lg" type="hidden" name="productVO.pro_name" value="${productVO.pro_name}">
       	  <input class="btn btn-primary btn-lg" type="hidden" name="productVO.pro_price" value="${productVO.pro_price}">
       	  <input type="text" name="productVO.pro_number" value="1">
       	  <input class="btn btn-primary btn-lg" type="submit" name="Submit" value="加入購物車">
        </div>
        

      </div>
      <!-- /.row -->

      <!-- Related Projects Row -->
      <h3 class="my-4">商品照片</h3>

      <div class="row">
	        <div class="col-md-4 col-sm-6 mb-4 productimage2">
	          <a href="#">
	            <img class="img-fluid2" src="<%=request.getContextPath()%>/productproductImage.do?imglist=2&pro_no=${productVO.pro_no}" alt="">
	          </a>
	        </div>
	        <div class="col-md-4 col-sm-6 mb-4">
	          <a href="#">
	            <img class="img-fluid2" src="<%=request.getContextPath()%>/productproductImage.do?imglist=3&pro_no=${productVO.pro_no}" alt="">
	          </a>
	        </div>

	        <div class="col-md-4 col-sm-6 mb-4">
	          <a href="#">
	            <img class="img-fluid2" src="<%=request.getContextPath()%>/productproductImage.do?imglist=4&pro_no=${productVO.pro_no}" alt="">
	          </a>
	        </div>

      </div>
      <!-- /.row -->
</s:form>
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <jsp:include page="/footer.jsp" />

  </body>

</html>
