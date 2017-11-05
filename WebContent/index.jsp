<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.offer.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.news.model.*"%>
<%@ page import="java.util.*"%>
<% 
	int count=1;

	OfferService offerSvc = new OfferService();
	List<OfferVO> list = offerSvc.getAll();
	pageContext.setAttribute("list",list);	
	
	NewsService newsSvc = new NewsService();
	List<NewsVO> newslist = newsSvc.getAll();
	pageContext.setAttribute("newslist",newslist);
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
          <div class="carousel-item active" style="background-image: url('<%=request.getContextPath()%>/images/slide1.jpg" class="img-responsive')">
            <div class="carousel-caption d-none d-md-block">
              <h3>最新優惠消息</h3>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          	<c:forEach var="offerVO" items="${list}">	
          		<c:if test="${(offerVO.off_status) == 1}">
		          <div class="carousel-item" style="background-image: url('<%=request.getContextPath()%>/offer/offerImage.do?off_no=${offerVO.off_no}')">
		            <div class="carousel-caption d-none d-md-block">
		              <h3>優惠名稱:${offerVO.off_title}</h3>
		              <h3>優惠內容:${offerVO.off_content}</h3>
		              <p>優惠時間:${offerVO.off_start}~${offerVO.off_end}</p>
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
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project One</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Two</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Three</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos quisquam, error quod sed cumque, odio distinctio velit nostrum temporibus necessitatibus et facere atque iure perspiciatis mollitia recusandae vero vel quam!</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Four</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Five</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-sm-6 portfolio-item">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
            <div class="card-body">
              <h4 class="card-title">
                <a href="#">Project Six</a>
              </h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Itaque earum nostrum suscipit ducimus nihil provident, perferendis rem illo, voluptate atque, sit eius in voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
            </div>
          </div>
        </div>
      </div>
      <!-- /.row -->
    </div>
    <!-- /.container -->

    <!-- Footer -->
    <jsp:include page="/footer.jsp" />


  </body>

</html>
