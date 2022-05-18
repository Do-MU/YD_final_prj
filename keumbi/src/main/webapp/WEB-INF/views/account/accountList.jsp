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
							<table>
								<c:forEach items="${acc }" var="acc">
									<tr id="fin" data-fin="${acc.fintech_use_num }">
										<td>${acc.bank_name }(${acc.account_alias })</td>
										<td colspan="4"></td>
									</tr>
									<tr>
										<td colspan="2">${acc.account_num_masked }</td>
										<td>잔액		${acc.balance_amt }</td>
										<td><button onclick="transList();">거래내역</button></td>
										<td><button>이체</button></td>
									</tr>
								</c:forEach>
							</table>
						</c:otherwise>
					</c:choose>			
				</div>
			</div>
		</div>
	</div>
</section>
</body>
<script>
	function transList(){
		let finNum = $("#fin").data("fin");
		console.log("===  " + finNum);
		
		$.ajax({
			url : "/transaction",
			data : finNum
		})
		
	}
</script>
</html>