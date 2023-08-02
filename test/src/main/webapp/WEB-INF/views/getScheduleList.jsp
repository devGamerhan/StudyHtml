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
			var today = new Date();		// 오늘 기준의 날짜 데이터
			
			function buildCalendar(){
				var row = null;
				var cnt = 0;
				var calendarTable = document.getElementById("calendar");
				var calendarTableTitle = document.getElementById("calendarTitle");
				calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";	//오늘의 년, 월
				
				var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);		// 현재 달력의 첫날
				var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);	// 현재 달력의 마지막날
				
				
				
				//서버에서 받아온 스케줄 리스트를 자바스크립트 변수에 대입
				var sList = new Array();
				
				<c:forEach items="${scheduleList}" var="schedule">
					sList.push({"scheduleName":"${schedule.scheduleName}",
								"choiceColor":"${schedule.choiceColor}",
								"startDate":"${schedule.startDate}",
								"endDate":"${schedule.endDate}"});
	   			</c:forEach>
				
				/*	작성 테이블 미리 초기화
				*	타이틀, 일~월 까지의 표시는 남기기 위해 3행부터 삭제
				*/
				while(calendarTable.rows.length > 1){
				  	calendarTable.deleteRow(calendarTable.rows.length -1);
				}
				
				// 스케줄 만큼 반복
				for(var j=0; j<sList.length; j++){
					var scheduleName = sList[j].scheduleName;
		  			var startDay = sList[j].startDate.substring(6,8);
		  			var endDay = sList[j].endDate.substring(6,8);
		  			var startMonth = sList[j].startDate.substring(4,6);
		  			var endMonth = sList[j].endDate.substring(4,6);
		  			
					row = calendarTable.insertRow();									//table에 행(tr) 추가하기
					var cell = row.insertCell();
					cell.innerHTML = sList[j].scheduleName;
					
					for(i = 1; i <= lastDate.getDate(); i++){
					  	cell = row.insertCell();										//table에 열(td) 추가하기
					  	cnt += 1;

					    cell.setAttribute('id', i);										//속성 id값에 해당 날짜 숫자
					  	cell.innerHTML = i;
					  	cell.align = "center";

			  			// 0 붙은거 제거
			  			if(startDay.substring(0,1) == "0"){								
			  				startDay = startDay.substring(1,2);
			  			}
			  			if(endDay.substring(0,1) == "0"){								
			  				endDay = endDay.substring(1,2);
			  			}
			  			if(startMonth.substring(0,1) == "0"){							
			  				startMonth = startMonth.substring(1,2);
			  			}
			  			if(endMonth.substring(0,1) == "0"){							
			  				endMonth = endMonth.substring(1,2);
			  			}
			  			
			  			// 시작일이 오늘보다 빠르거나 같고, 종료일이 오늘보다 나중이거나 같으면
			  			if(
			  					((startMonth*100)+(startDay*1) <= ((today.getMonth()+1)*100)+i)
			  					&& ((endMonth*100)+(endDay*1) >= ((today.getMonth()+1)*100)+i)
			  			){
			  				cell.style.backgroundColor = sList[j].choiceColor;		//해당 셀 배경색 변경
			  			}
					 }//end for
				}//end schedule list
			}//end build
			
			// today 에서 +1개월
			function nextCalendar(){
				today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
				buildCalendar();
			}
			// today 에서 -1개월
			function prevCalendar(){
				today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
				buildCalendar();
			}
		</script>
		<style type="text/css">
			td{
				padding:10px 7px;
			}
		</style>
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
		<div class="container">		<!-- style="margin:0;" -->
			<div class="row">
				<div class="col-md-12">
					<table id="calendar" style="border-collapse:collapse;">
						<tr>
							<td align="center"><label onclick="prevCalendar()"> ◀ </label></td>
							<td colspan="30" id="calendarTitle" style="text-align: center;">yyyy년 m월</td>
							<td align="center"><label onclick="nextCalendar()"> ▶ </label></td>
						</tr>
					</table>
					<script type="text/javascript">buildCalendar();</script>
				</div>
				
				<div class="col-md-6">
					<table id="scheduleTable">
						<tr>
							<th>색상</th>
							<th>스케줄명</th>
							<th>기간</th>
						</tr>
						<c:forEach items="${scheduleList}" var="schedule">
						<tr>
							<td style="background-color:${schedule.choiceColor}"></div></td>
							<td>${schedule.scheduleName}</td>
							<td>${schedule.startDate}~${schedule.endDate}</td>
						</tr>
						</c:forEach>
					</table>
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