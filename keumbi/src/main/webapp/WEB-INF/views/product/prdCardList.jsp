<%@ page language="java" contentType="text/html; charset=UTF-8"
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
.tab{
	width:100%;
	margin-bottom: 100px;
}
.btn-group{
	margin: 0 auto;
	width: 100%;
}

.btn-group button{
	width: 20%;
	height: 4em;
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
				<div class="btn-group" role="group" aria-label="Basic example">
				  <button type="button" class="btn btn-secondary">전체</button>
				  <button type="button" class="btn btn-secondary" id="C366">신한카드</button>
				  <button type="button" class="btn btn-secondary" id="C381">국민카드</button>
				  <button type="button" class="btn btn-secondary" id="C365">삼성카드</button>
				  <button type="button" class="btn btn-secondary" id="C361">BC카드</button>
				  <button type="button" class="btn btn-secondary" id="C367">현대카드</button>
				</div>
			</div>

			<div id="output">
				<c:forEach items="${cardList}" var="list">
					<div class="prds" data-company="${list.card_company }">
						<div class="div_img">
							<img
								src="${pageContext.request.contextPath}/resources/img/card/${list.card_image}"
								width="250px" height="150px">
						</div>
						<div class="div_exp">
							<div class="card_name" data-seq="${list.card_seq }">${list.card_name}</div>
							<div class="card_info">${list.card_info}</div>
							<div class="div_btn">
								<button class="cardModalView">자세히 보기</button>
							</div>
						</div>
					</div>
					
					<hr>
				</c:forEach>
			</div>
			<br>
		</div>
	</section>

	<!-- 카드 자세히 보기 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
				<div class="modal-header">
					<h1 class="modal-title" id="card_company"></h1>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<p class="h3" id="card_name"></p><br/>
					<p class="h4" id="card_benefit"></p><br/>
					<p class="h5" id="card_annualfee"></p><br/>
					<p class="h5" id="card_perfo"></p>
				</div>
				
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">	
	// 카드 상세보기 Modal func
	$("#output").on("click", ".cardModalView", function(){
		var company = $(this).parent().parent().parent().data("company");
		var seqNum = $(this).parent().prev().prev().data("seq");
		
		$.ajax({
			url : "cardDetail",
			data : { card_company : company,
					 card_seq : seqNum }
		})
		.done(function(data){
			//console.log(data)
			if(data != null){
				$("#card_company").html(data.card_company);
				$("#card_name").html(data.card_name);
				$("#card_benefit").html(data.card_benefit);
				if(data.card_annualfee != null){
					$("#card_annualfee").html("연 회 비  " + data.card_annualfee + " 원");
				} else {
					$("#card_annualfee").html("연회비 없음");
				}
				
				if(data.card_perfo != null){
					$("#card_perfo").html("전 월 실 적 	" + data.card_perfo + " 만 원");
				} else {
					$("#card_perfo").html("전월실적 해당사항 없음");
				}
				
				$('#exampleModal').modal('show');
			} else {
				alert("다시 시도해주세요.");
			}
		})
	})
	
	
	// 카드사별 카드 목록 출력
	$(".btn-secondary").on("click", this, function(){
		var companyId = $(this).attr("id");
		console.log(companyId);
		if(companyId != null){
			$.ajax({
				url : "companyCard",
				data : { card_company :  companyId }
			})
			.done(function(datas){
				makeOutput(datas);
			})
		} else {		// 전체 목록
			$.ajax({
				url : "totalPrd"
			})
			.done(function (datas){
				//console.log(datas);
				makeOutput(datas);
			})
		}
		
	})
	
	
	
	// 목록 초기화 후 결과 뿌려주는 공통 function
	function makeOutput(datas){
		$("#output").empty();
		for(list of datas) {
			let result = ` <div class="prds" data-company="\${list.card_company }">
							<div class="div_img">
								<img
									src="${pageContext.request.contextPath}/resources/img/card/\${list.card_image}"
									width="250px" height="150px">
							</div>
							<div class="div_exp">
								<div class="card_name" data-seq="\${list.card_seq }" >\${list.card_name}</div>
								<div class="card_info">\${list.card_info}</div>
								<div class="div_btn">
									<button class="cardModalView">자세히 보기</button>
								</div>
							</div>
						</div>
						<hr> `;		
			$("#output").append(result);
		}
	}
</script>

</body>
</html>