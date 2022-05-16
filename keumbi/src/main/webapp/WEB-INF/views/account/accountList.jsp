<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.container>div>h1{margin-bottom: 50px;}
</style>
</head>
<body>
<!-- 	<button id="getAuth">인증하러가기</button> cors 오류 -->
	
<!-- 	<a href="#" id="getAuth">인증하러가기</a> -->
<section class="banner_area">
	<div class="box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<a href="bankAuth">인증하러가기</a> <br/>
					<button onclick="getAccount()">계좌목록불러오기</button>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div align="center">
			
		</div>
	</div>
</section>	
	


<script type="text/javascript">
	// 사용자 인증 버튼
	$("#getAuth").on('click', function(){
		$.ajax({
			url : "bankAuth"
		})
		.done(function(data){
			alert(data);
		})
	});
	
	//계좌목록 불러오기
	function getAccount(){
		$.ajax({
			url : "accountList"
		})
		.done(function(data){
			console.log(data)
		})
	}
</script>
</body>
</html>