<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE HTML>
<!--
	Strata by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Strata by HTML5 UP</title>
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
						<h1><strong>我是金城武</strong>, 林北流氓啦！你現在什麼身份？俘虜啦！</h1>
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
						<li><a href="index.html">Home</a></li>
						<li><a href="generic.html">修改個人資料</a></li>
						<li><a href="generic.html">查詢預約紀錄</a></li>
						<li><a href="generic.html">查詢購物紀錄</a></li>
					</ul>
				</nav>

			<!-- Main -->
				<div id="main">

					<!-- One -->
						<section id="one">
							<header class="major">
								<h2>「為台灣而教」</h2>
							</header>
							<p>我們期許每個人都能透過建立自己的課程的方式，達到教學相長、知識共享的目的，共同終結台灣教育體制的缺陷以ㄐㄧ不平等的問題，讓一個孩子的出身不再限制他的未來。</p>
							<ul class="actions">
								<li><a href="#" class="button">Learn More</a></li>
							</ul>
						</section>

					<!-- Two -->
						<section id="two">
							<h2>Recently</h2>
							<div class="row">
								<article class="6u 12u$(xsmall) work-item">
									<a href="<%= request.getContextPath()%>/images/pic01.jpg" class="image fit thumb">
										<img src="<%= request.getContextPath()%>/images/pic01.jpg" alt="" />
										<h3>如何當一個假掰的工程師</h3>
									</a>
								</article>
								<article class="6u$ 12u$(xsmall) work-item">
									<a href="<%= request.getContextPath()%>/images/pic03.jpg" class="image fit thumb">
										<img src="<%= request.getContextPath()%>/images/pic03.jpg" alt="" />
										<h3>Title</h3>
									</a>
								</article>
								<article class="6u 12u$(xsmall) work-item">
									<a href="<%= request.getContextPath()%>/images/pic05.jpg" class="image fit thumb">
										<img src="<%= request.getContextPath()%>/images/pic05.jpg" alt="" />
										<h3>Title</h3>
									</a>
								</article>
								<article class="6u$ 12u$(xsmall) work-item">
									<a href="<%= request.getContextPath()%>/images/pic07.jpg" class="image fit thumb">
										<img src="<%= request.getContextPath()%>/images/pic07.jpg" alt="" />
										<h3>Title</h3>
									</a>
								</article>
								<article class="6u 12u$(xsmall) work-item">
									<a href="<%= request.getContextPath()%>/images/pic09.jpg" class="image fit thumb">
										<img src="<%= request.getContextPath()%>/images/pic09.jpg" alt="" />
										<h3>Title</h3>
									</a>
								</article>
								<article class="6u$ 12u$(xsmall) work-item">
									<a href="<%= request.getContextPath()%>/images/pic09.jpg" class="image fit thumb">
										<img src="<%= request.getContextPath()%>/images/pic11.jpg" alt="" />
										<h3>Title</h3>
									</a>
								</article>
							</div>
							<ul class="actions">
								<li><a href="#" class="button">Expand</a></li>
							</ul>
						</section>
				</div>

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