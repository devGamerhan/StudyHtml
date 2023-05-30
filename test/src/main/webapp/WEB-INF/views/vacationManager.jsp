<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>vacationManager</title>
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
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/plugins.js"></script>
	<!-- custom javascript -->
	<script src="js/script.js"></script>
	<script src="js/button.js"></script>
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
					<li class="scrollspy-link"><a href="schedule.do" data-target="services" class="nav-link smoothscroll">스케줄표</a></li>
					<li class="scrollspy-link"><a href="myPage.do" data-target="testimonial" class="nav-link smoothscroll">마이페이지</a></li>
					<c:if test="${sessionScope.role eq '팀장'}">
						<li class="scrollspy-link"><a href="vacationManager.do" data-target="portfolio" class="nav-link smoothscroll">휴가서 관리</a></li>
						<li class="scrollspy-link"><a href="scheduleManager.do" data-target="contact" class="nav-link smoothscroll">스케줄표 관리</a></li>
					</c:if>
					<span class="scrollspy-indicator"></span>
				</ul>
			</div>
		</nav>
	</div>
</header>
<!-- end header -->

<!-- section -->
	<section>
		<div class="scrollspy-section padding-large">
			<div class="container">
				<table style="margin: 0 auto;">
					<tr>
						<th>번호</th>
						<th>소속</th>
						<th>직책</th>
						<th>휴가</th>
						<th>이름</th>
						<th>희망 기간</th>
						<th>상세보기</th>
					</tr>
					<c:forEach items="${vacationList}" var="vacation">
						<tr>
							<td>${vacation.seq}</td>
							<td>${vacation.team}</td>
							<td>${vacation.role}</td>
							<td>${vacation.vacationType}</td>
							<td>${vacation.name}</td>
							<td>${vacation.startDate.substring(2,8)}~${vacation.endDate.substring(2,8)}</td>
							<td><a href="getVacation.do?seq=${vacation.seq}">상세내역확인</a></td>
						</tr>
					</c:forEach>
				</table>
				<jsp:include page="pagingVacation.jsp">
					<jsp:param name="page" value="${paging['page']}" />
					<jsp:param name="totalCount" value="${paging['totalCount']}" />
				</jsp:include>
			</div>
		</div>
	</section>
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
</body>
</html>