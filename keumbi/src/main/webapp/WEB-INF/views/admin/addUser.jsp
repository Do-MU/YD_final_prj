<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<button id="insertRandUser">+</button>
</body>
<script>
$("#insertRandUser").click(function(){
	$.ajax({
		type:"GET",
		url:"insertRandUser",
	}).done(function(data){
		alert('추가완료');
	})
})
</script>
</html>