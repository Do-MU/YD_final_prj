<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<a onclick="getAuth">인증하러가기</a> <br/>
					<button onclick="getAccount()">계좌목록불러오기</button>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div align="center">
			<div id="list">
				
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
	
	//계좌목록 불러오기
	function getAccount(){
		$.ajax({
			url : "accountList"
		})
		.done(function(datas){
			console.log(datas)
			for(data of datas){
				$("<div>").addClass("acc").data("usenum", data.fintechUseNum)
				.append($("<p>").html(data.fintechUseNum))
				.append($("<span>").html(data.bankName))
				.append($("<span id='realName'>").html(data.accountNumMasked))
				.append($("<input>").val(data.accountAlias))
				.append($("<button>").html("수정").addClass("btnAlias"))
				.append($("<button>").html("거래내역").addClass("btnTrans"))
				.appendTo("#list")
			}
		})
	}
</script>
</body>
</html>