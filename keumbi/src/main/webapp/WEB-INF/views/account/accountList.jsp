<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
#div_noAcc{
	text-align:center;
	min-height: 233px;
	padding: 150px 0;
}
#div_noAcc h2{
	font-size: 80px;
}
#callAcc{
	margin-top: 30px;
	width: 200px;
	font-size: 1.2em;
}
.div_view{
	border-radius: 15px;
	padding: 40px;
	background-color: #E0F8F7;
	margin-bottom: 50px;
    box-shadow: 3px 3px 3px 3px #dadce0;
    color:black;
}
.div_acc{
	display:flex;
	margin-bottom: 30px;
	background-color: #CEECF5;
}

.div_acc:nth-child(2n){
	background-color: #E0ECF8;
}
.div_acc:hover{
	cursor:pointer;
}
.div_acc .div_img{
	margin-right: 30px;
	width:100px;
	height:100px;
	background-color:white;
	border-radius:50%;
}
.div_acc .div_img img{
	margin: 15px;
}
.div_data1{
	flex-grow: 1;
}
.div_acc .div_data1 .div_title{
	font-size: 30px;
	margin: 20px 0;
}
.div_acc .div_data1 .div_num{
	font-size: 24px;
	margin: 20px 0;
}
.div_acc .div_data2{
	text-align: right;
}
.div_acc .div_data2 .div_amt{
	font-size: 36px;
	margin-top: 80px;
}
.div_submenu{
	display:none;
}
.swal-modal {
    width: 550px;
    height: 300px;
    text-align-last: center;
}
.swal-text:first-child {
    margin-top: 60px;
}
.swal-text {
	font-size: 30px;
	color: black;
	margin-top: 20px;
}
.swal-footer {
	margin-top: 20px;
}
.swal-button {
	width: 480px;
}
</style>
<script>
	// 비회원 접근시
	$(window).ready(function(){
		if (!"${loginUser.id}") {
			swal({
				text:"로그인이 필요합니다.",
				button: "확인",
				icon: "error",
				closeOnClickOutside: false
			}).then((value) => {
				window.location = "userLoginForm";
			});
		}
	})
</script>
</head>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>내 계좌 목록</h2>
						<div class="page_link">
							<a href="home">Home</a>
							<a href="accountView">내 계좌 목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">
			<div id="div_totalAcc" class="div_view">
				<h3>총 계좌 잔액</h3>
				<h1>${accTotalSum} 원</h1>
			</div>
			
			<c:choose>
			
				<c:when test="${empty loginUser.access_token}">
					<div id="div_noAcc">
						<h2><i class="bi bi-info-circle"></i></h2>
						<h1>불러올 계좌가 없어요...</h1>
						<button id="callAcc" type="button" class="btn btn-primary"
							onclick="location.href ='bankAuth'">내 계좌 불러오기</button>
					</div>
				</c:when>
				
				<c:otherwise>
					<div id="div_accList">
						<c:forEach items="${acc}" var="acc">
							<div class="div_acc div_view" data-fin="${acc.fintech_use_num}">
								<div class="div_img">
									<img src="${pageContext.request.contextPath}/resources/img/bank_logo/${acc.bank_name}.jpg" width="70px" height="70px">
								</div>
								<div class="div_data1">
									<div class="div_title">${acc.bank_name}<c:if test="${not empty acc.account_alias}"> (${acc.account_alias })</c:if></div>
									<div class="div_num">${acc.account_num_masked}</div>
								</div>
								<div class="div_data2">
									<div class="div_amt">${acc.balance_amt}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
				
			</c:choose>
			
		</div>
	</section>
</body>

	<script>
		// 천단위 콤마
		for(amt of $(".div_amt")){
			amt.innerHTML = amt.innerHTML.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 원";
		}
		$("#div_totalAcc").html($("#div_totalAcc").html().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		
		// 계좌 클릭시 계좌 거래내역으로 이동
		$(".div_acc").not($(".bi-justify")).on("click", function(){
			$(this).css("box-shadow","3px 3px 3px 3px #dadce0 inset")
			location.href = "accTransList?fintech_use_num=" + $(this).data("fin");
		});
		$(".div_btn").on("click",this,function(){
			$(this).children(2).css("display","block");
		})
	</script>
</html>