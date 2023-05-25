<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>join</title>
	<link rel="stylesheet" type="text/css" href="style.css">

	<!-- script
	================================================== -->
	<script src="js/modernizr.js"></script>
	<script src="js/button.js"></script>
</head>
<body>
	<div class="scrollspy-section padding-xlarge" style="text-align: center;">
		<form name="joinForm">
			<label for="id">사원번호</label>
			<input type="text" name="id" id="id">
			
			<label for="pw">비밀번호</label>
			<input type="password" name="password" id="password">
			
			<label for="name">이름</label>
			<input type="text" name="name" id="name">
			
			<label for="phone1">연락처</label>
			<input type="tel" name="phone1" id="phone1" style="width:60px"> -
			<input type="tel" name="phone2" id="phone2" style="width:90px"> -
			<input type="tel" name="phone3" id="phone3" style="width:90px">
			
			<label for="role">직책</label>
			<select name="role" id="role">
				<option selected="selected">사원</option>
				<option>주임</option>
				<option>대리</option>
				<option>과장</option>
				<option>팀장</option>
			</select>
			<br>
			<input type="button" onclick="userJoin(); return false;" value="가입">
		</form>
	</div>
</body>
</html>