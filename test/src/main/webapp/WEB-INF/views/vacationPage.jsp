<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>vacationPage</title>
	
	<!-- script
		================================================== -->
	<script src="js/button.js"></script>

</head>
<body>
	<form name="insertVacationForm" style="width: 50%; margin:0 auto;">
		<table style="margin:0 auto;">
			<tr>
				<th colspan="4" style="text-align: center;">개인 정보</th>
			</tr>
			<tr>
				<th>소속</th>
				<td>
					<select name="team" id="team">
						<option selected="selected">개발1팀</option>
						<option>개발2팀</option>
						<option>총무팀</option>
						<option>영업1팀</option>
						<option>영업2팀</option>
					</select>
				</td>
				<th>직위</th>
				<td>
					<select name="role" id="role">
						<option selected="selected">사원</option>
						<option>주임</option>
						<option>대리</option>
						<option>과장</option>
						<option>팀장</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>휴가 종류</th>
				<td>
				<select name="vacationType">
					<option selected="selected">연차</option>
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
				<td><input name="name" type="text" value="${sessionScope.name}"></td>
			</tr>
			<tr>
				<th colspan="4" style="text-align: center;">희망 기간</th>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;"><button onclick="openCalendar(); return false;">날짜 선택</button></td>
			</tr>
			<tr>
				<th>휴가 시작일</th>
				<td>
					<input type="text" readonly="readonly" name="startDate" id="startDate">
				</td>
				<th>휴가 마지막일</th>
				<td>
					<input type="text" readonly="readonly" name="endDate" id="endDate">
				</td>
			</tr>
			
			<tr>
				<th>비상 연락망</th>
				<td colspan="3"><input name="phone" type="text"></td>
			</tr>
			<tr>
				<th colspan="4" style="text-align: center;">업무 대행자</th>
			</tr>
			<tr>
				<th>소속</th>
				<td>
					<select name="subTeam" id="subTeam">
						<option selected="selected">개발1팀</option>
						<option>개발2팀</option>
						<option>총무팀</option>
						<option>영업1팀</option>
						<option>영업2팀</option>
					</select>
				</td>
				<th>직위</th>
				<td>
					<select name="subRole" id="subRole">
						<option selected="selected">사원</option>
						<option>주임</option>
						<option>대리</option>
						<option>과장</option>
						<option>팀장</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td colspan="3"><input name="subName" type="text"></td>
			</tr>
			<tr>
				<th>인수 내용</th>
				<td colspan="3"><textarea name="work" rows="10" cols="60"></textarea></td>
			</tr>
		</table>
		<button onclick="insertVacation(); return false;">신청</button>
		<button onclick="resetInsertVacation(); return false;">취소</button>
	</form>
</body>
</html>