<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>聯絡我</title>
	<script src="<%=request.getContextPath()%>/js/map.js"></script>
	<script src="" text/javascript" ></script>
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDtG-rqgt4dGBFF6i-6X8jsW2WxWqGZi_4&callback=initMap"   type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/contact.css">
  </head>

  <body>

	
    <!-- header -->
    	<jsp:include page="/header.jsp" />

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Contact
        <small>Subheading</small>
      </h1>

      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.jsp">首頁</a>
        </li>
        <li class="breadcrumb-item active">聯絡我</li>
      </ol>

      <!-- Content Row -->
      <div class="row">
        <!-- Map Column -->
        <div class="col-lg-8 mb-4">
          <!-- Embedded Google Map -->
          <div class="container">
			<div id="myMap" style="width:100%;height:400px;"></div>
			</div>
        </div>
        <!-- Contact Details Column -->
        <div class="col-lg-4 mb-4">
          <h3>聯絡方式</h3>
          <p>
          	<lable title="Email">店址:</lable>
          	  台灣桃園市桃園區莊一街80號           
          </p>
          <p>
            <label title="Phone">電話</label>: (03) 456-7890
          </p>
          <p>
            <lable title="Email">電子郵件:</lable>
            <a href="mailto:name@example.com">demomail201711@gmail.com</a>
          </p>
          <p>
            <lable title="Hours">營業時間</abbr>: 星期一 - 星期日: 9:00 AM to 5:00 PM
          </p>
        </div>
      </div>
      <!-- /.row -->

      <!-- Contact Form -->
      <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->


    </div>
    <!-- /.container -->

     <!-- Footer -->
    <jsp:include page="/footer.jsp" />

  </body>

</html>
