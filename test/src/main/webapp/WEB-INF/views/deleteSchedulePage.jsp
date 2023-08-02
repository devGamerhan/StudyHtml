<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function deleteSchedule(){
	if(window.confirm("삭제하시겠습니까?")){
		location.href="deleteSchedule.do?choiceColor=${schedule.choiceColor.substring(1)}";
	}else{
		window.history.back();
	}
}
deleteSchedule();
</script>

</body>
</html>