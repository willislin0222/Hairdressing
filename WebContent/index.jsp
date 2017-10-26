<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.offer.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>
<% 
	OfferService offerSvc = new OfferService();
	List<OfferVO> list = offerSvc.getAll();
	pageContext.setAttribute("list",list);
	
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	int count=1;
%>
<!DOCTYPE html>
<html lang="">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
		<title>Title Page</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mail.css">

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="<%=request.getContextPath()%>/js/jquery-1.11.2.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.js"></script>
		<script src="<%=request.getContextPath()%>/js/map.js"></script>
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtG-rqgt4dGBFF6i-6X8jsW2WxWqGZi_4&callback=initMap"   type="text/javascript"></script>

	</head>
	<body>
		
		<!--第一層-選單開始-->
		<div>
			<nav class="navbar navbar-default navbar-fixed-top menu" role="navigation">
			    <div class="container">
			      <!-- 移動顯示 -->
			        <div class="navbar-header">
			          <button type="button" class="navbar-toggle collapsed navbarMin" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			            <span class="sr-only">Toggle navigation</span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			            <span class="icon-bar"></span>
			          </button>
			          <a class="navbar-brand" href="#"><img src="<%=request.getContextPath()%>images/logo.jpg"></a>
			        </div>
			      <!--按鈕內容 -->
			        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			          <ul class="nav navbar-nav navbar-right menubtn">
			          		<c:if test="${memberVO == null}">
			            		<li><a href="<%= request.getContextPath()%>/member/login.jsp">會員登入</a></li>
			            	</c:if>
			            	<c:if test="${memberVO != null}">
		            		<li style="size:7"><a href="#">${memberVO.mem_name}歡迎您</a></li>
		            		<li><a href="<%=request.getContextPath()%>/member/memberManager.jsp">會員專區</a></li>
		            		<li><a href="<%=request.getContextPath()%>/member/logout.jsp">登出</a></li>
			            	</c:if>
<%-- 			            <li><a href="<%= request.getContextPath()%>/reservation/fullcalendar.jsp">預約專區</a></li>		          --%>
			            <li><a href="<%= request.getContextPath()%>/reservation/fullcalendar.action">預約專區</a></li>		         
			            <li><a href="#">美髮商城</a></li>
			            <li><a href="#">聯絡我</a></li>
			            	
			          </ul>
			        </div>
			    </div>
			</nav>




		</div>
		<!--第一層-選單結束-->
		<!--第二層-廣告輪播開始-->
		<div class="banner">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		      <!-- 指標 -->
		      <ol class="carousel-indicators">
		        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		        	<c:forEach var="offerVO" items="${list}">
		        		<c:if test="${(offerVO.off_status) == 1}">	
		       			 	<li data-target="#carousel-example-generic" data-slide-to=<%= count++%>></li>
		       			</c:if>
		       		</c:forEach>
		      </ol>
		    
		      <!-- 幻燈片 -->
		      <div class="carousel-inner" role="listbox">
			        <div class="item active">
			          <img src="<%=request.getContextPath()%>/images/slide1.jpg" class="img-responsive">
			          <div class="carousel-caption">
			          		<h1>最新優惠消息</h1>
			          </div>
			        </div>
				        <c:forEach var="offerVO" items="${list}">
				        	<c:if test="${(offerVO.off_status) == 1}">						
						        <div class="item">
						          <img src="<%=request.getContextPath()%>/offer/offerImage.do?off_no=${offerVO.off_no}" class="img-responsive">
						          <div class="carousel-caption">
						          		<h1>優惠名稱:${offerVO.off_title}</h1>
						          		<h1>優惠內容:${offerVO.off_content}</h1>
						          		<h1>優惠時間:${offerVO.off_start}~${offerVO.off_end}</h1>
		
						          </div>
						        </div>
						    </c:if>
					        
					    </c:forEach>
					 
		      </div>
		      <!-- 左右切換控制 -->
		      <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		        <span class="sr-only">Previous</span>
		      </a>
		      <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		        <span class="sr-only">Next</span>
		      </a>
		    </div>

		</div>
		<!--第二層-廣告輪播結束'-->	
		<!--第三層-最新消息開始-->
		<div class="container news">
			<div class="row">
				<div class="col-xs-12 col-sm-6">
					<img src="<%=request.getContextPath()%>/images/newTile.jpg" class="courseTitle">
						<div class="panel-group" id="accordion1">
					        <div class="panel panel-info">
					          <div class="panel-heading">
					            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1">網頁設計丙級 解題 開課了</a></h4>
					          </div>
					          <div id="collapseOne1" class="panel-collapse collapse in">
					            <div class="panel-body">學習如何利用Google Web Design 軟體進行【網頁設計丙級】的術科解題</div>
					          </div>
					        </div>
					        <div class="panel panel-default">
					          <div class="panel-heading">
					            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion1" href="#collapseTwo1">Google Web Design 開課囉</a></h4>
					          </div>
					          <div id="collapseTwo1" class="panel-collapse collapse">
					            <div class="panel-body">網頁設計新神器Google Web Designer就是要讓創意者、設計人或初學者不必撰寫任何程式碼，就可以運用HTML5技術，縮短製作時程，打造跨平台互動廣告、動畫與網頁！</div>
					          </div>
					        </div>
					        <div class="panel panel-default">
					          <div class="panel-heading">
					            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion1" href="#collapseThree1">123LearnGo 官方網站正式啟動</a></h4>
					          </div>
					          <div id="collapseThree1" class="panel-collapse collapse">
					            <div class="panel-body">以分享知識為主軸，提供相關的專業技能供有興趣的人一起學習與討論</div>
					          </div>
					        </div>
					    </div>

				</div>
				<div class="col-xs-12 col-sm-6">
					<table class="table table-hover">
						<caption class="price">價目表</caption>
						<thead>
							<tr>
								<th>造型</th>
								<th>價錢</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>洗　髮</td>								
								<td>$300</td>
							</tr>
							<tr>
								<td>剪　髮</td>
								<td>$700</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!--第三層-最新消息結束-->
		<!--第四層-地圖顯示開始-->
		<div class="container">
			<div id="myMap" style="width:100%;height:600px;"></div>
		</div>
		<!--第四層-地圖顯示結束開始-->
		<!--第六層-頁腳分享開始-->
			<div class="footer">© 2016 123learngo</div>
		<!--第六層-頁腳分享結束-->
		<!--回頂部動畫開始-->
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/move-top.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath()%>/js/easing.js"></script>
			<script type="text/javascript">
						jQuery(document).ready(function($) {
							$(".scroll").click(function(event){		
								event.preventDefault();
								$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
							});
						});
			</script>
			<script type="text/javascript">
					$(document).ready(function() {
					$().UItoTop({ easingType: 'easeOutQuart' });
			});
			</script>
			<a href="#to-top" id="toTop" style="display: block;">
				<span id="toTopHover" style="opacity: 1;"></span>
			</a>


		<!--回頂部動畫結束-->

		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			
	</body>
</html>