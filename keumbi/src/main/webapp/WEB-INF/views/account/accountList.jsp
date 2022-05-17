<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<c:if test="${empty access_token }">
						<a href="bankAuth">인증하러가기</a> <br/>
						<button onclick="getAccount()">계좌목록불러오기</button>
						<button onclick="getAccount()">계좌목록불러오기</button>						
					</c:if>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div align="center">
			<div>
				<h1>계좌목록조회</h1>
				<table id="list">
<!-- 					<tr> -->
<!-- 						<td>국민은행(입출금통장)</td> -->
<!-- 						<td colspan="4"></td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td colspan="2">010010010010</td> -->
<!-- 						<td>잔액 500,000</td> -->
<!-- 						<td><button>거래내역</button></td> -->
<!-- 						<td><button>이체</button></td> -->
<!-- 					</tr> -->
				</table>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">
	// 사용자 인증 버튼
	function getAuth(){
		$.ajax({
			url : "bankAuth"
		})
		.done(function(datas){			
		})
	}
	
	//계좌목록 저장
	function saveAccount(){
		$.ajax({
			url : "saveAccount"
		})
	}
	
	//계좌목록 불러오기
	function getAccount(){
		$.ajax({
			url : "getAccount"
		})
		.done(function(datas){
			console.log(datas)
			
			let list = $("#list");
			for(data of datas){
				let table = `<tr>
								<td>\${data.bank_name} (\${data.account_alias})</td>
								<td colspan="4"></td>
							</tr>
							<tr>
								<td colspan="2">\${data.account_num_masked}</td>
								<td>잔액 500,000</td>
								<td><button>거래내역</button></td>
								<td><button>이체</button></td>
							</tr>`;
				list.append(table);
			}
		})
	}
</script>
</body>
</html>