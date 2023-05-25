<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html class="no-js">
<head>
		<title>main page</title>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta name="format-detection" content="telephone=no">
	    <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="author" content="">
	    <meta name="keywords" content="">
	    <meta name="description" content="">

	    <link rel="stylesheet" type="text/css" href="css/normalize.css">
	    <link rel="stylesheet" type="text/css" href="icomoon/icomoon.css">
	    <link rel="stylesheet" type="text/css" href="css/vendor.css">
	    <link rel="stylesheet" type="text/css" href="style.css">

		<!-- script
		================================================== -->
		<script src="js/modernizr.js"></script>
		
		<!-- inline style
		================================================== -->

</head>

<body>

<!-- header -->
<header id="header" class="onepage-menu fixed">
	<div id="header-wrap">
		<nav id="navbar">
			<div class="main-logo">
				<a href="index.html">A.</a>
			</div>

			<div class="main-menu" id="navigation">
				<ul class="menu-list scrollspy-nav navbar-nav list-inline">
					<li class="scrollspy-link"><a href="main.jsp" data-target="intro" class="nav-link smoothscroll">Home</a></li>
					<li class="scrollspy-link"><a href="vacation.do" data-target="about" class="nav-link smoothscroll">휴가서</a></li>
					<li class="scrollspy-link"><a href="#" data-target="services" class="nav-link smoothscroll">스케줄표</a></li>
					<li class="scrollspy-link"><a href="#" data-target="testimonial" class="nav-link smoothscroll">마이페이지</a></li>
					<li class="scrollspy-link"><a href="#" data-target="portfolio" class="nav-link smoothscroll">휴가서 관리</a></li>
					<li class="scrollspy-link"><a href="#" data-target="contact" class="nav-link smoothscroll">스케줄표 관리</a></li>
					<span class="scrollspy-indicator"></span>
				</ul>
			</div>
		</nav>
	</div>
</header>
<!-- end header -->

<!-- section -->
<c:if test="${empty sessionScope.id}">
<section>
	<div id="content" class="scrollspy-section padding-xlarge" style="text-align: center;">
		<h3>LOGIN</h3>
		<form name="loginForm">
			<span style="margin-right: 10px">사원번호</span><input type="text" name="id" id="id"><br>
			<span style="margin-right: 10px">비밀번호</span><input type="password" name="password" id="password"><br>
			<input type="button" onclick="login(); return false;" value="로그인">
			<input type="button" onclick="joinPage(); return false;" value="회원가입">
		</form>
	</div>
</section>
</c:if>
<c:if test="${!empty sessionScope.id}">
	<div class="scrollspy-section padding-xlarge">
		<h3>로그인 중인 상태입니다.</h3>
	</div>
</c:if>
<!-- end section -->

<!-- footer -->
<footer>
	<div id="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="copyright">
						<p>© 2022 Archi. All rights reserved.</p>
					</div>
				</div>
				<div class="col-md-6">
					<div class="copyright text-right">
						<p>HTML Template by <a href="https://www.templatesjungle.com/" target="_blank">TemplatesJungle</a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- end footer -->

<!-- script -->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<script src="js/button.js"></script>
</body>
</html>