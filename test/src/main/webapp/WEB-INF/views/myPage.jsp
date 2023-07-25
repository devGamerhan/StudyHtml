<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<title>my page</title>
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

		<!-- third party jQuery plugins -->
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
				<ul class="menu-list navbar-nav list-inline">
					<li class="scrollspy-link"><a href="main.do" data-target="intro" class="nav-link smoothscroll">Home</a></li>
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

<c:if test="${empty sessionScope.id}">
	<div class="scrollspy-section padding-xlarge">
		<h3>로그인 해야합니다.</h3>
	</div>
</c:if>

<c:if test="${!empty sessionScope.id}">
	<section>
		<div class="scrollspy-section padding-large">
		<div class="container">
			<div class="col-md-12">
				<div class="post-grid">
					<div class="row">
						<div class="col-md-6">
							<div style="text-align: center;">
								<h3>휴가 신청 내역</h3>
								<table style="margin: 0 auto; text-align: center;">
									<tr>
										<th>번호</th>
										<th>종류</th>
										<th>희망기간</th>
									</tr>
									<c:forEach items="${vacationList}" var="vacation">
										<tr>
											<td>${vacation.seq}</td>
											<td>${vacation.vacationType}</td>
											<td>${vacation.startDate.substring(2,8)}~${vacation.endDate.substring(2,8)}</td>
										</tr>
									</c:forEach>
								</table>
								<jsp:include page="pagingMyPage.jsp">
									<jsp:param name="page" value="${paging['page']}" />
									<jsp:param name="totalCount" value="${paging['totalCount']}" />
								</jsp:include>
							</div>
						</div>
						<div class="col-md-6">
							<div style="text-align: center;">
								<h3>승인 여부</h3>
								<table style="margin: 0 auto; text-align: center;">
									<tr>
										<th>번호</th>
										<th>희망기간</th>
										<th>승인 여부</th>
										<th>거부 이유</th>
									</tr>
									<c:forEach items="${vacationList}" var="vacation">
									<tr>
										<td>${vacation.seq}</td>
										<td>${vacation.startDate} ~ ${vacation.endDate}</td>
										<td>${vacation.accept}</td>
										<td>${vacation.reason}</td>
									</tr>
									</c:forEach>
								</table>
								<jsp:include page="pagingMyPage.jsp">
									<jsp:param name="page" value="${paging['page']}" />
									<jsp:param name="totalCount" value="${paging['totalCount']}" />
								</jsp:include>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
</c:if>


<footer>
	<div id="footer-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="copyright">
						<p>© 2023 HAN GIOK. All rights reserved.</p>
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
</body>
</html>