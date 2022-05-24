<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.container>div>h1 {
	margin-bottom: 50px;
}
</style>

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
			<c:choose>
				<c:when test="${empty loginUser.access_token}">
					<h1>인증되지 않은 회원입니다.</h1>
					<button type="button" class="btn btn-primary"
						onclick="location.href ='bankAuth'">인증하기</button>
					<br>
					<br>
				</c:when>
				<c:otherwise>
					<h3>${loginUser.name }님의 총 보유 자산 ${accTotalSum }</h3>
					<form id="transFrm" name="transFrm">
						<input id="fintech_use_num" name="fintech_use_num" type="hidden">
					</form>
					<div>
						<table id="output">
							<c:forEach items="${acc }" var="acc">
								<tr id="fin" data-fin="${acc.fintech_use_num }">
									<td>${acc.bank_name }(${acc.account_alias })</td>
									<td colspan="4"></td>
								</tr>
								<tr>
									<td colspan="2">${acc.account_num_masked }</td>
									<td>잔액 ${acc.balance_amt }</td>
									<td><button type="submit" class="trans">거래내역</button></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

	<script>
		//비회원 접근시
		if (!"${loginUser.id}") {
			alert('로그인이 필요합니다.');
			window.location = "userLoginForm";
		}

		//거래내역
		$(".trans").on("click", this, function() {
			var finNum = $(this).parent().parent().prev().data("fin");
			console.log(finNum);

			$("#fintech_use_num").val(finNum);
			transFrm.action = "accTransView";
			transFrm.method = "get";
			transFrm.submit();
		})		
	</script>
</html>