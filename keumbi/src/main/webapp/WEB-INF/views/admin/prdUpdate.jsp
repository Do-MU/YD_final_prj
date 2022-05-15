<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
#btn_cont {
	margin: auto;
}

#btn_cont>button {
	margin-top: 50px;
}
</style>

<div class="container">
	<h3>상품 관리 (관리자)</h3>
	<div id="btn_cont">
		<button id="deposit">예금목록 가져오기</button>
		<br>
		<button id="saving">적금목록 가져오기</button>
		<br>
		<button id="loan">대출목록 가져오기</button>
		<br>
	</div>
</div>

<script>
	$("#deposit").on('click', function(){
		$.ajax({
			url : "depUpdate"
		}).done(function(str){
			alert(str);
		});
	});
</script>