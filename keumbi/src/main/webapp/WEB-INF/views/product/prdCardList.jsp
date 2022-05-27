c<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.prds{
	display:flex;
	padding: 20px;
}
.div_img{
	text-align: center;
	height:150px;
	flex:1;
}
.div_exp{
	flex:3;
}
.card_name{
	font-size:1.5em;
	margin-bottom: 20px;
}
.card_info{
	font-size:2em;
	margin-bottom: 30px;
}
.card_annualfee{
	color: red;
	font-size: 1.5em;
	margin-bottom: 20px;
}
</style>

</head>
<body>
	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>카드상품추천</h2>
						<div class="page_link">
							<a href="home">Home</a> <a href="PrdCardListView">카드상품추천</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">
			<div class="tab">
					<ul class="tabnav">
						<li><a href="#tip1" onclick="totalPrd()">전체</a></li>
						<li><a href="#tip2">신한카드</a></li>
						<li><a href="#tip3">국민카드</a></li>					
						<li><a href="#tip4">삼성카드</a></li>
						<li><a href="#tip5">BC카드</a></li>
						<li><a href="#tip6">현대카드</a></li>
					</ul>
				<div class="tabcontent">
					<div id="div_crawling">
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">
			<div id="list">
				<c:forEach items="${cardList}" var="list">
					<div class="prds">
						<div class="div_img">
							<img
								src="${pageContext.request.contextPath}/resources/img/card/${list.card_image}"
								width="250px" height="150px">
						</div>
						<div class="div_exp">
							<div class="card_name">${list.card_name}</div>
							<div class="card_info">${list.card_info}</div>
							<div class="card_annualfee">${list.card_annualfee}</div>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>
			<br>
		</div>
	</section>
</body>

<script type="text/javascript">
	// 전체 -> 랜덤으로 5개 보여주는 function
	function totalPrd(){
		$.ajax({
			url : "totalPrd"
		})
		.done(function (datas){
			//console.log(datas);
			makeList(datas);
		})
	}
	
	// 
	
	
	
	// 목록 초기화 후 결과 뿌려주는 공통 function
	function makeList(datas){
		$("#list").empty();
		for(list of datas) {
			let result = ` <div class="prds">
							<div class="div_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/card/\${list.card_image}"
									width="250px" height="150px">
							</div>
							<div class="div_exp">
								<div class="card_name">\${list.card_name}</div>
								<div class="card_info">\${list.card_info}</div>
								<div class="card_annualfee">\${list.card_annualfee}</div>
							</div>
						</div>
						<hr> `;
			$("#list").append(result);
		}
	}
</script>

</html>