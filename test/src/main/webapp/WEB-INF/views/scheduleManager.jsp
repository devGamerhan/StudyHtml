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
		<link rel="stylesheet" href="colorPicker/jquery.minicolors.css">
		<!-- script
		================================================== -->
		<script src="js/modernizr.js"></script>
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/script.js"></script>
		<script src="js/button.js"></script>
		<script src="colorPicker/jquery.minicolors.js"></script>
  
  		<!-- custom script
  		================================================== -->
  		<script>
		    $(document).ready( function() {
		
		      $('.demo').each( function() {
		        //  $(selector).minicolors();

		        $(this).minicolors({
		          control: $(this).attr('data-control') || 'hue',
		          defaultValue: $(this).attr('data-defaultValue') || '',
		          format: $(this).attr('data-format') || 'hex',
		          keywords: $(this).attr('data-keywords') || '',
		          inline: $(this).attr('data-inline') === 'true',
		          letterCase: $(this).attr('data-letterCase') || 'lowercase',
		          opacity: $(this).attr('data-opacity'),
		          position: $(this).attr('data-position') || 'bottom',
		          swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
		          change: function(hex, opacity) {
		            var log;
		            try {
		              log = hex ? hex : 'transparent';
		              if( opacity ) log += ', ' + opacity;
		              console.log(log);
		            } catch(e) {}
		          },
		          theme: 'default'
		        });
		
		      });
		
		    });
		 </script>

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
<c:if test="${empty sessionScope.id}">
<section>
	<div class="scrollspy-section padding-xlarge">
		
	</div>
</section>
</c:if>
<c:if test="${!empty sessionScope.id}">
	<div class="scrollspy-section padding-xlarge">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<p>달력 들어갈 부분</p>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<form name="scheduleForm">
						    <label for="text-field">색상 선택</label>
						    <input type="text" id="text-field" class="demo" value="#70c24a">
							<label>날짜 선택</label>
							시작일<input type="text" name="startDate" id="startDate"><br>
							종료일<input type="text" name="endDate" id="endDate"><br>
							<button onclick="inputSchedule(); return false;">등록</button>
							<button onclick="">취소</button>
						</form>
					</div>
				</div>
			</div>
			
		</div>
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
</body>
</html>