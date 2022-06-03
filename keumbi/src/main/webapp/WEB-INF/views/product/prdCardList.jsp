<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
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
.cardCol {
	display: inline-block;
	margin-right: 30px;
	margin-bottom: 30px;;
}
.card {
	width : 18rem;
}
.card-body {
	height : 190px;
	position: relative;
}
.detailBtn > button {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translate(-50%, 0);
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
				<div class="btn-group btn-lg " role="group" aria-label="Basic example">
				  <button type="button" class="btn btn-outline-primary">전체</button>
				  <c:if test="${not empty loginUser }">
					  <button type="button" class="btn btn-outline-primary" id="age">연령대별 추천</button>
					  <button type="button" class="btn btn-outline-primary" id="consum">소비패턴별 추천</button>
					  <button type="button" class="btn btn-outline-primary" id="keyword">관심사별 추천</button>
				  </c:if>
				  <button type="button" class="btn btn-outline-primary" id="C366">신한카드</button>
				  <button type="button" class="btn btn-outline-primary" id="C381">국민카드</button>
				  <button type="button" class="btn btn-outline-primary" id="C365">삼성카드</button>
				  <button type="button" class="btn btn-outline-primary" id="C361">BC카드</button>
				  <button type="button" class="btn btn-outline-primary" id="C367">현대카드</button>
				</div>
			</div>

			<div id="output" align="center">
				<c:forEach items="${cardList}" var="list">
					<div class="cardCol">
						<div class="card" data-company="${list.card_company }">
							<img
								src="${pageContext.request.contextPath}/resources/img/card/${list.card_image}"
								class="card-img-top">
							<div class="card-body">
								<h4 class="card-title" id="${list.card_seq }">${list.card_name}</h4>
								<p class="card-text">${list.card_info}</p>
								<div class="detailBtn">
									<button class="cardModalView btn btn-outline-primary btn-sm">자세히 보기</button>
								</div>
							</div>
						</div>
					</div>
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
					<table>
						<tr>
							<th width="100px">카드이름</th>
							<td id="card_name"></td>
						</tr>
						<tr>
							<th>카드혜택</th>
							<td id="card_benefit"></td>
						</tr>
						<tr>
							<th>연회비</th>
							<td id="card_annualfee"></td>
						</tr>
						<tr>
							<th>전월실적</th>
							<td id="card_perfo"></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	
<script type="text/javascript">	
	// 카드 상세보기 Modal func
	$("#output").on("click", ".cardModalView", function(){
		var company = $(this).closest('.card').data("company");
		var seqNum = $(this).closest('.card-body').children().attr('id');
		
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
	
	
	// 상단 버튼 -> 해당하는 목록 출력
	$(".btn-outline-primary").on("click", this, function(){
		var companyId = $(this).attr("id");
		
		if(companyId != null && (companyId == "C366"|| companyId == "C381"||companyId =="C365"||companyId =="C361"||companyId =="C367")){	//카드사별 출력
			$.ajax({
				url : "companyCard",
				data : { card_company :  companyId }
			})
			.done(function(datas){
				makeOutput(datas);
			})
		} else if(companyId == null) {		// 전체 목록
			$.ajax({
				url : "totalPrd"
			})
			.done(function (datas){
				makeOutput(datas);
			})
		} else if(companyId == "age"){		// 연령별 추천 목록
			// 비회원 접근시
			if (!"${loginUser.id}") {
				alert('로그인이 필요합니다.');
				window.location = "userLoginForm";
			} else {
				$.ajax({
					url : "recommendedAge"				
				})
				.done(function(datas){
					makeOutput(datas);
					let userName = "${loginUser.name}"
					let h1 = "<h1>" + userName + "님과 비슷한 연령대의 회원들이 보유한 카드입니다.</h1><br/>";
					$("#output").prepend(h1);
				})
			}			
		} else if(companyId == "consum"){	// 소비패턴별 추천 목록
			// 비회원 접근시
			if (!"${loginUser.id}") {
				alert('로그인이 필요합니다.');
				window.location = "userLoginForm";
			} else {
				$.ajax({
					url : "recommendedConsum"				
				})
				.done(function(datas){
					//console.log(datas);
					makeOutput(datas);
					
					let userName = "${loginUser.name}"
					let h1 = "<h1>" + userName + "님의 최근 3개월 간 소비지출에 대한 추천 카드입니다.</h1><br/>";
					$("#output").prepend(h1);
					
// 					for(let i=0; i<datas.length; i++){
// 						//console.log(datas[i].val);
						
// 						if(!datas[i+1]){
// 							console.log("값이 없어요")
// 						} else if (datas[i].val == datas[i+1].val){
// 							console.log(datas[i].val)
// 							var cateVal = datas[i].val
// 							$("#cateVal").text(cateVal);
// 						} else if(datas[i].val != datas[i+1].val){
// 							console.log("달라요")
// 						}
// 					}
					
					
				})
			}
		} else if(companyId == "keyword") {		// 관심사별 추천 목록
			// 비회원 접근시
			if (!"${loginUser.id}") {
				alert('로그인이 필요합니다.');
				window.location = "userLoginForm";
			} else {
				$.ajax({
					url : "recommendedKey"
				})
				.done(function(datas){
					makeOutput(datas);
					let userName = "${loginUser.name}"
						let h1 = "<h1>" + userName + "님의 관심사에 대한 추천 카드입니다.</h1><br/>";
						$("#output").prepend(h1);
				})
			}
		}
	})
	
	// 목록 초기화 후 결과 뿌려주는 공통 function
	function makeOutput(datas){
		$("#output").empty();
		for(list of datas) {
			let result = ` <div class="cardCol">
								<div class="card" data-company="\${list.card_company }">
								<img
									src="${pageContext.request.contextPath}/resources/img/card/\${list.card_image}"
									class="card-img-top">
								<div class="card-body">
									<h4 class="card-title" id="\${list.card_seq }"\>${list.card_name}</h4>
									<p class="card-text">\${list.card_info}</p>
									<div class="detailBtn">
										<button class="cardModalView btn btn-outline-primary btn-sm">자세히 보기</button>
									</div>
								</div>
							</div>
						</div> `;		
			$("#output").append(result);
		}
	}
</script>

</body>
</html>