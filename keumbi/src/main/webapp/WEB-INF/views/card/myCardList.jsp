<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.div_submenu{
	display:none;
}
.cardCol {
	display: inline-block;
	margin-right: 30px;
	margin-bottom: 30px;;
}
.card {
	width : 18rem;
}
.card-body {
	height : 130px;
	position: relative;
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
				
		
		
		
<!-- 			<div id="output"> -->
<%-- 				<c:forEach items="${cardList}" var="list"> --%>
<!-- 					<div class="div_acc div_view"> -->
<!-- 						<div class="div_img"> -->
<!-- 							<img -->
<%-- 								src="${pageContext.request.contextPath}/resources/img/card/${list.card_image}" --%>
<!-- 								width="100px" height="70px"> -->
<!-- 						</div> -->
<!-- 						<div class="div_data1"> -->
<%-- 							<div class="div_title">${list.val}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${list.card_name}</div> --%>
<%-- 							<div class="div_num">${list.card_num_masked}</div> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<!-- 			</div> -->
		</div>
	</section>

	<script type="text/javascript">
		// 비회원 접근시
		if (!"${loginUser.id}") {
			alert('로그인이 필요합니다.');
			window.location = "userLoginForm";
		}
	</script>

</body>
</html>