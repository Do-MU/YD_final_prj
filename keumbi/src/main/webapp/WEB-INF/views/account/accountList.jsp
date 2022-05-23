<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	.container>div>h1{margin-bottom: 50px;}
</style>

</head>
<body>
<section class="banner_area">
	<div class="box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<c:choose>
						<c:when test="${empty loginUser.access_token}">
							<h1>인증되지 않은 회원입니다.</h1>
							<button type="button" class="btn btn-primary" onclick="location.href ='bankAuth'">인증하기</button><br><br>
						</c:when>
						<c:otherwise>
							<h1>계좌목록</h1>
							<h3>${loginUser.name } 님의 총 보유 자산 	 ${accTotalSum }</h3>
							<form id="transForm" name="transForm">
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
											<td><button>이체하기</button></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</c:otherwise>
					</c:choose>			
				</div>
			</div>
		</div>
	</div>
</section>
</body>

<script>

	//비회원 접근시
	if (!"${loginUser.id}") {
		alert('로그인이 필요합니다.');
		window.location = "userLoginForm";
	}
	
	$(".trans").on("click", this, function() {
		var finNum = $(this).parent().parent().prev().data("fin");
		console.log(finNum);

		$("#fintech_use_num").val(finNum);
		transForm.action = "accTransView";
		transForm.method = "get";
		transForm.submit();
	})
</script>
</html>