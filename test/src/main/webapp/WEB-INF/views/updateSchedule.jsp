<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.example.biz.board.ScheduleVO" %>
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
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css"> 
		<!-- script
		================================================== -->
		<script src="js/modernizr.js"></script>
		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="js/plugins.js"></script>
		<script src="js/script.js"></script>
		<script src="js/button.js"></script>
		<script src="colorPicker/jquery.minicolors.js"></script>
		<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
		
		 <!-- custom script
  		================================================== -->
 		<script>
	    	$(document).ready(function () {
	            $.datepicker.setDefaults($.datepicker.regional['ko']); 
	            $( "#startDate" ).datepicker({
	                 changeMonth: true, 
	                 changeYear: true,
	                 nextText: '다음 달',
	                 prevText: '이전 달',
	                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 dateFormat: "yymmdd",
	                 minDate: 0,
	                 maxDate: 365,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	                 onClose: function( selectedDate ) {    
	                      //시작일(startDate) datepicker가 닫힐때
	                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
	                     $("#endDate").datepicker( "option", "minDate", selectedDate );
	                 }    
	 
	            });
	            $( "#endDate" ).datepicker({
	                 changeMonth: true, 
	                 changeYear: true,
	                 nextText: '다음 달',
	                 prevText: '이전 달', 
	                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	                 dateFormat: "yymmdd",
	                 minDate: 0,
	                 maxDate: 365,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	                 onClose: function( selectedDate ) {    
	                     // 종료일(endDate) datepicker가 닫힐때
	                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
	                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
	                 }    
	 
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
					<div class="form-group">
						<form name="scheduleForm">
							<input type="hidden" id="choiceColor" name="choiceColor" value="${schedule.choiceColor }">
							<label>스케줄 이름</label>
							<input type="text" id="scheduleName" name="scheduleName" value="${schedule.scheduleName }">
							<label>날짜 선택</label>
							시작일 <input type="text" name="startDate" id="startDate" value="${schedule.startDate }"><br>
							종료일 <input type="text" name="endDate" id="endDate" value="${schedule.endDate }"><br>
							<button onclick="updateSchedule(); return false;">변경</button>
							<button onclick="back(); return false;">돌아가기</button>
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