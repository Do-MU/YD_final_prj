<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.container {
	text-align:center;
}

#btn_cont>button {
	margin-top: 50px;
}
</style>
<div class="pagetitle">
	<h1>상품 관리</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item">예금</li>
		<li class="breadcrumb-item">적금</li>
		<li class="breadcrumb-item">대출</li>
	</ol>
</div>
<div class="container">
	<div id="btn_cont">
		<button id="deposit">예금목록 가져오기</button>
		<br>
		<button id="saving">적금목록 가져오기</button>
		<br>
		<button id="loan">대출목록 가져오기</button>
		<br>
		<br>
		<br>
		<br>
		<br>
		<button id="dummy_dep" class="btn btn-success">예금 계좌 더미데이터 만들기</button>
		<br>
		<button id="dummy_sav" class="btn btn-success">적금 계좌 더미데이터 만들기</button>
		<br>
		<button id="dummy_loa" class="btn btn-success">대출 계좌 더미데이터 만들기</button>
		<br>
		<button id="dummy_card" class="btn btn-success">카드 번호 더미데이터 만들기</button>
		<br>
		<button id="dummy_chall" class="btn btn-success">챌린지 더미데이터 만들기</button>
	</div>
</div>

<script>
	// 관리자외 접근시
	if (!"${loginUser.id}" || "${loginUser.id}" != 'admin') {
		swal({
			text:"권한이 없습니다.",
			button: "확인",
			icon: "error",
			closeOnClickOutside: false
		}).then((value) => {
			window.location = "${pageContext.request.contextPath}/userLoginForm";
		});
	}

	$("#deposit").on('click', function(){
		$.ajax({
			url : "depUpdate"
		}).done(function(str){
			swal(str, {icon: 'success'})
		});
	});
	
	$("#saving").on('click', function(){
		$.ajax({
			url : "savUpdate"
		}).done(function(str){
			swal(str, {icon: 'success'})
		});
	});
	
	$("#loan").on('click', function(){
		$.ajax({
			url : "loanUpdate"
		}).done(function(str){
			swal(str, {icon: 'success'})
		});
	});
	
	
	// 더미 데이터 만들기
	$("#dummy_dep").on("click", function(){
		$.ajax({
			url : "dummyDep"
		}).done(function(acc){
			console.log(acc+"개 계좌 생성완료!!!");
		});
	});
	
	$("#dummy_sav").on("click", function(){
		$.ajax({
			url : "dummySav"
		}).done(function(acc){
			console.log(acc+"개 계좌 생성완료!!!");
		});
	});
	
	$("#dummy_loa").on("click", function(){
		$.ajax({
			url : "dummyLoa"
		}).done(function(acc){
			console.log(acc+"개 계좌 생성완료!!!");
		});
	});
	
	$("#dummy_card").on("click", function(){
		$.ajax({
			url : "dummyCard"
		}).done(function(card){
			console.log(card+"개 카드 생성완료!!!");
		});
	});
	
	$("#dummy_chall").on("click", function(){
		$.ajax({
			url : "dummyChall"
		}).done(function(chall){
			console.log(chall+"개 카드 생성완료!!!");
		});
	});
	
</script>