<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.offer.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.news.model.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="java.util.*"%>
<% 
	int count=1;
	int productNumber = 1;

	OfferService offerSvc = new OfferService();
	List<OfferVO> list = offerSvc.getAll();
	pageContext.setAttribute("list",list);	
	
	NewsService newsSvc = new NewsService();
	List<NewsVO> newslist = newsSvc.getNewsByStatus();
	pageContext.setAttribute("newslist",newslist);
	System.out.println(newslist.size());
	
	ProductService productSvc = new ProductService();
	List<ProductVO> productlist = productSvc.getProductsByStatus();
	pageContext.setAttribute("productlist",productlist);
	System.out.println(productlist.size());
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <script src="<%= request.getContextPath()%>/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath()%>/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <title>index</title>

  </head>

  <body>

    <!-- header -->
    	<jsp:include page="/header.jsp" />
	<!--幻燈片開始 -->
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      	<!-- 指標 -->
        <ol class="carousel-indicators">
          	<c:forEach var="offerVO" items="${list}">
		    	<c:if test="${(offerVO.off_status) == 1}">	
		    	 	<li data-target="#carousel-example-generic" data-slide-to=<%= count++%>></li>
		    	</c:if>
		    </c:forEach>
        </ol>
        <!-- 幻燈片 -->
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('<%=request.getContextPath()%>/images/banner_sale.png" class="img-responsive')">
            <div class="carousel-caption d-none d-md-block">
<!--               <font style="color:red"><h3>最新優惠消息</h3></font> -->
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          	<c:forEach var="offerVO" items="${list}">	
          		<c:if test="${(offerVO.off_status) == 1}">
		          <div class="carousel-item" style="background-image: url('<%=request.getContextPath()%>/offer/offerImage.do?off_no=${offerVO.off_no}')">
		            <div class="carousel-caption d-none d-md-block">
<!-- 		              <font style="color:#EEEE00"> -->
<%-- 		              <h3>優惠名稱:${offerVO.off_title}</h3> --%>
<%-- 		              <h3>優惠內容:${offerVO.off_content}</h3> --%>
<%-- 		              <h3><p>優惠時間:${offerVO.off_start}~${offerVO.off_end}</p></h3> --%>
<!-- 		              </font> -->
		            </div>
		          </div>
         		</c:if>
         	</c:forEach>
        </div>
        <!-- 左右切換控制 -->
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">

      <img src="<%=request.getContextPath()%>/images/newTile.jpg" class="newsTitle">

      <!-- Marketing Icons Section -->
      <div class="container news">
	      <div class="row">
	        <div class="panel-group" id="accordion1">
				<div class="panel panel-info">
					<%@ include file="/pages/newspage.file" %>
					<c:forEach var="newsVO" items="${newslist}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					    <div class="panel-heading">
					        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapseOne<%= count%>">${newsVO.news_title}</a></h4>
					    </div>
					    <div id="collapseOne<%= count++%>" class="panel-collapse collapse in">
					       <div class="panel-body">${newsVO.news_content}</div>
					    </div>
					</c:forEach>
				</div>	        
			</div>
	      </div>
	      <%@ include file="/pages/page4.file" %>	
      </div>
      <!-- /.row -->

      <!-- Portfolio Section -->
      <h2>最新商品</h2>

      <div class="row">
      	 <c:forEach var="productVO" items="${productlist}">
      	 	<c:if test="<%= productNumber++<=6%>">
		       <c:if test="${productVO.pro_status.equals('1')}">   
			        <div class="col-lg-4 col-sm-6 portfolio-item">
			          <div class="card h-100">
			            <a href="<%=request.getContextPath()%>/product/getOne_For_Display?pro_no=${productVO.pro_no}"><img height="400px" class="card-img-top" src="<%=request.getContextPath()%>/product/productImage.do?imglist=1&pro_no=${productVO.pro_no}" alt=""></a>
			            <div class="card-body">
			              <h4 class="card-title">
			                <a href="<%=request.getContextPath()%>/product/getOne_For_Display?pro_no=${productVO.pro_no}">${productVO.pro_name}</a>
			              </h4>
			              <h4><p class="card-text">$${productVO.pro_price}</p></h4>
			            </div>
			          </div>
			        </div>
		        </c:if>
			</c:if>
		</c:forEach>
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <jsp:include page="/footer.jsp" />


  </body>

</html>
