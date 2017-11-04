<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.model.*"%>
<%
	ProductService productSvc = new ProductService();
	List<ProductVO> list = productSvc.getAll();
	request.setAttribute("list", list);	
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
	          <a href="#">商品管理</a>
	        </li>
	      </ol>
	<!-- Breadcrumbs結束-->	
	<div class="card mb-3">
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
	               	 <tr>
						<th>商品編號</th>
						<th>商品名稱</th>
						<th>商品描述</th>
						<th>商品單價</th>
						<th>商品圖片1</th>
						<th>商品圖片2</th>
						<th>商品圖片3</th>
						<th>商品圖片4</th>
						<th>訂購人數</th>
						<th>修改</th>
						<th>刪除</th>
					</tr>
              </thead>
              <tbody>
             	<c:forEach var="productVO" items="${list}">
					<tr align='center' valign='middle' ${(productVO.pro_no==param.pro_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
						<td>${productVO.pro_no}</td>
						<td>${productVO.pro_name}</td>
						<td>${productVO.pro_desc}</td>
						<td>${productVO.pro_price}</td>
						<td><img src="productImage.do?imglist=1&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>
						<td><img src="productImage.do?imglist=2&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>
						<td><img src="productImage.do?imglist=3&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>
						<td><img src="productImage.do?imglist=4&pro_no=${productVO.pro_no}" width="200px" height="200px"></td>			
						<td>${productVO.pro_number}</td>		
						<td>
						  <s:form method="post" action="getOne_For_Update" namespace="/product">
						     <input type="submit" value="修改"> 
						     <input type="hidden" name="pro_no" value="${productVO.pro_no}">
						  </s:form>
						</td>
						<td>
						  <s:form method="post" action="delete" namespace="/product">
						    <input type="submit" value="刪除">
						    <input type="hidden" name="pro_no" value="${productVO.pro_no}">
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