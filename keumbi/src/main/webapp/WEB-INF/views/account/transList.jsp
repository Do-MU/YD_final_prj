<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
	.container>div>h1{margin-bottom: 50px;}
</style>
</head>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h1>거래내역</h1>
						<br/>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="contact_area p_120">
		<div class="container">
			<div align="center">
				<div>
					<form id="transFrm" name="transFrm">
						<p>조회 계좌</p>
							<select name="fintech_use_num">
								<option value="">계좌를 선택해주세요.</option>
								<c:forEach items="${acc }" var="acc">
									<option value="${acc.fintech_use_num }">${acc.bank_name}	${acc.account_num_masked }</option>
								</c:forEach>
							</select>
						<p>조회 기간
							<input name="from_date" type="date"> - <input name="to_date" type="date">
							<button type="submit" onclick="transCheck()">조회하기</button>
						</p>
						<button>이체하기</button>
					</form>
				</div>
			</div>
		</div>
	</section>


<script type="text/javascript">
	// 거래내역 회신
	function transCheck(){
		$.ajax({
			url : "accTransRes",
			method : 'POST',
			data : $("#transFrm").serialize()
		})
		.done(function(datas){
			console.log(datas);
		})
	}

</script>

</body>
</html>