<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>會員專區</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="<%= request.getContextPath()%>/css/member/assets/css/main.css" />
	</head>
	<body id="top">
		<!-- Wrapper -->
		<div id="wrapper">
			<!-- Header -->
				<header id="header">
					<div class="inner">

						<!-- Introduction -->
						
						<a href="#" class="image avatar"><img src="<%= request.getContextPath()%>/images/5gold.jpg" alt="" /></a>
						<!-- Nav -->
						<nav>
							<ul>
								<li><a href="#menu">Menu</a></li>
							</ul>
						</nav>
					</div>
				</header>

			<!-- Menu -->
				<nav id="menu">
					<h2>Menu</h2>
					<ul>
						<li><a href="<%= request.getContextPath()%>/index.jsp">Home</a></li>
						<li><a href="<%= request.getContextPath()%>/member/updateMember.jsp">修改個人資料</a></li>
						<li><a href="<%= request.getContextPath()%>/member/GetReservationDataByMemAction.action">查詢個人預約紀錄</a></li>
						<li><a href="<%= request.getContextPath()%>/member/GetMorderDataByMemAction.action">查詢訂單紀錄</a></li>
					</ul>
				</nav>

			<!-- Main -->
				<div id="main">

					<!-- One -->
						<section id="one">
							<header class="major">
								<h2>「美髮網」</h2>
							</header>
							<p></p>
						</section>


			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<ul class="icons">
							<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
							<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
							<li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
						</ul>
						<ul class="copyright">
							<li>&copy; 藝起學</li>
						</ul>
					</div>
				</footer>
		</div>

		

		<!-- Scripts -->
			<script src="<%= request.getContextPath()%>/css/member/assets/js/jquery.min.js"></script>
			<script src="<%= request.getContextPath()%>/css/member/assets/js/jquery.poptrox.min.js"></script>
			<script src="<%= request.getContextPath()%>/css/member/assets/js/skel.min.js"></script>
			<script src="<%= request.getContextPath()%>/css/member/assets/js/util.js"></script>
			<script src="<%= request.getContextPath()%>/css/member/assets/js/main.js"></script>

	</body>
</html>