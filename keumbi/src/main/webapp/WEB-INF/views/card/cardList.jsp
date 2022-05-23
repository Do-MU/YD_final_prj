<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<c:choose>
							<c:when test="${not empty loginUser.id}">
								<h1>등록된 카드가 없습니다.</h1>
								<h2>카드를 불러오시겠습니까?</h2><br/>
								<a href="getCardList">카드 불러오기</a>
							</c:when>
							<c:when test="not empty loginUser.id">
								<h1>내 카드 목록</h1>
							</c:when>
						</c:choose>
						<br />
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="contact_area p_120">
		<div class="container">
			<div align="center">
				<div>5월 카드사용 금액은 544,000원 입니다.</div>
				<hr/>
				<div>
					<span>국민카드</span>
					<span>카드번호 1212-1212-1212-1212</span><br/>
					<span>이용금액 544,000</span>
					<button>거래내역</button>
				</div>
			</div>
		</div>
	</section>
</body>

<script>
	if (!"${loginUser.id}") {
		alert('로그인이 필요합니다.');
		window.location = "userLoginForm";
	}
	
</script>

</html>