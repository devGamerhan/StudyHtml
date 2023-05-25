<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>vacationPage</title>
</head>
<body>
	<form style="width: 50%; margin:0 auto;">
		<table style="margin:0 auto;">
			<tr>
				<th colspan="4" style="text-align: center;">개인 정보</th>
			</tr>
			<tr>
				<th>소속</th>
				<td><input name="" type="text"></td>
				<th>직위</th>
				<td><input name="" type="text"></td>
			</tr>
			<tr>
				<th>휴가 종류</th>
				<td>
				<select name="">
					<option>연차</option>
					<option>월차</option>
					<option>경조</option>
					<option>공가</option>
					<option>병가</option>
					<option>포상</option>
					<option>특별</option>
					<option>기타</option>
				</select>
				</td>
				<th>이름</th>
				<td><input name="" type="text"></td>
			</tr>
			<tr>
				<th colspan="4" style="text-align: center;">희망 기간</th>
			</tr>
			<tr>
				<td colspan="4">
					<button onclick="openCalendar(); return false;">날짜 선택</button>
				</td>
			</tr>
			<tr>
				<th>비상 연락망</th>
				<td colspan="3"><input name="" type="text"></td>
			</tr>
			<tr>
				<th colspan="4" style="text-align: center;">업무 대행자</th>
			</tr>
			<tr>
				<th>소속</th>
				<td><input name="" type="text"></td>
				<th>직위</th>
				<td><input name="" type="text"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><input name="" type="text"></td>
			</tr>
			<tr>
				<th>인수 내용</th>
				<td colspan="3"><textarea rows="10" cols="60"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="신청">
		<input type="reset" value="취소">
	</form>
</body>
</html>