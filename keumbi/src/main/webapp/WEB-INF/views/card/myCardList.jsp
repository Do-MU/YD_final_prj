<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>
.div_submenu{
	display:none;
}
#output {
	display: inline-block;
	margin-right: 89px;
	margin-bottom: 30px;
	min-height: 182px;
}
.card {
	width : 18rem;
}
.card-body {
	position: relative;
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
#div_noCards{
	text-align: center;
	margin: 0 auto;
}
#div_noCards h2{
	font-size: 80px;
}
</style>
</head>
<body>
	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>내 카드 목록</h2>
						<div class="page_link">
							<a href="home">Home</a> <a href="MycardListView">내 카드 목록</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="contact_area p_120">
		<div class="container">
			
			<c:if test="${fn:length(cardList) eq 0}">
				<div id="div_noCards">
					<h2><i class="bi bi-info-circle"></i></h2>
					<h1>불러온 카드가 없어요...</h1>
				</div>
			</c:if>
			
			<div id="output" align="center">
				
				<c:forEach items="${cardList}" var="list">
					<div class="cardCol">
						<div class="card">
							<img
								src="${pageContext.request.contextPath}/resources/img/card/${list.card_image}"
								class="card-img-top">
							<div class="card-body">
								<h4 class="card-title">${list.card_name}</h4>
								<p class="card-text">${list.card_num_masked}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>

	<script type="text/javascript">
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

</body>
</html>