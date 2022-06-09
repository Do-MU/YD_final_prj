<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.card_name {
	font-size: 1.5em;
	margin-bottom: 20px;
}

.card_info {
	font-size: 2em;
	margin-bottom: 30px;
}

.card_annualfee {
	color: red;
	font-size: 1.5em;
	margin-bottom: 20px;
}

.tab {
	width: 100%;
	margin-bottom: 100px;
}

.btn-group {
	margin: 0 auto;
	width: 100%;
}

.btn-group button {
	width: 20%;
	height: 4em;
}

.cardCol {
	display: inline-block;
	margin-right: 40px;
	margin-left: 40px;
	margin-bottom: 30px;
}

.card {
	width: 18rem;
}

.card-body {
	height: 190px;
	position: relative;
}

.detailBtn>button {
	position: absolute;
	bottom: 10px;
	left: 50%;
	transform: translate(-50%, 0);
}

#card_image_content {
	font-weight: bold;
	display: table-cell;
	vertical-align: inherit;
}

#card_image {
	width: 300px;
	display: block;
	margin-left: auto;
	margin-right: auto;
}

.modal-footer {
	place-content: center;
	font-weight: bold;
	width: 100%;
}

#term_content {
	color: red;
}

.card_term {
	font-size: larger;
}

.modal-body {
	line-height: 40px;
	font-size: large;
}

table {
	width: 100%;
}

h1 {
	text-align: center;
	color: black;
}

#category>h2 {
	color: black;
	text-align: left;
}

.active {
	background-color: #007bff;
	border-color: #007bff;
	color: white;
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
				<div><h1 align="center">이런 상품은 어떠신가요?</h1></div><br/><br/><br/>
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
					<h3 class="modal-title" id="card_company"></h3>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<img id="card_image"><br/>
					<table class="table table-striped">
						<tr>
							<th width="110px" scope="row">카드이름</th>
							<td id="card_name"></td>
						</tr>
						<tr>
							<th scope="row">카드혜택</th>
							<td id="card_benefit"></td>
						</tr>
						<tr>
							<th width="100px" scope="row">분류</th>
							<td id="card_class"></td>
						</tr>
						<tr>
							<th scope="row">연회비</th>
							<td id="card_annualfee"></td>
						</tr>
						<tr>
							<th scope="row">전월실적</th>
							<td id="card_perfo"></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<div class="card_term">신용카드 결제는 외상구매라는 본질적 특성을 지니며, <p id="term_content">과도한 신용카드 사용은 가계 빚 증가로 이어집니다.<p></div>
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
			if(data != null){
				var result = data.card_benefit.replace(/(\n|\r\n)/g, '<br>');
				
				$("#card_image").attr("src","${pageContext.request.contextPath}/resources/img/card/"+data.card_image);
				$("#card_company").html(data.card_company + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "[&nbsp;&nbsp;" + data.card_name + "&nbsp;&nbsp;]");
				$("#card_name").html(data.card_name);
				$("#card_benefit").html(result);
				$("#card_class").html(data.val);
				if(data.card_annualfee != null){
					$("#card_annualfee").html(data.card_annualfee + "원");
					for(amt of $("#card_annualfee")){
						amt.innerHTML = amt.innerHTML.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					}
				} else {
					$("#card_annualfee").html("연회비 없음");
				}
				
				if(data.card_perfo != null){
					$("#card_perfo").html(data.card_perfo + " 만원 이상");
				} else{
					$("#card_perfo").html("해당사항 없음");
				}
				
				$('#exampleModal').modal('show');
			} else {
				//alert("다시 시도해주세요.");
				swal("다시 시도해주세요", {icon: 'error'});
			}
		})
	})
	
	// 상단 버튼 -> css Class
	$(".btn-group > .btn-outline-primary").click(function(){
	    $(".btn-outline-primary").removeClass("active");
	    $(this).addClass("active");
	});
	
	// 상단 버튼 -> 해당하는 목록 출력
	$(".btn-outline-primary").on("click", this, function(){
		var companyId = $(this).attr("id");
		//$(this).addClass('active');
		
		if(companyId != null && (companyId == "C366"|| companyId == "C381"||companyId =="C365"||companyId =="C361"||companyId =="C367")){	//카드사별 출력
			$.ajax({
				url : "companyCard",
				data : { card_company :  companyId }
			})
			.done(function(datas){
				$("#output").empty();
				for(list of datas) {
					$("#output").append(makeOutput(list));
				}
			})
		} 
		else if(companyId == "age"){		// 연령별 추천 목록
			// 비회원 접근시
			if (!"${loginUser.id}") {
				alert('로그인이 필요합니다.');
				window.location = "userLoginForm";
			} else {
				$.ajax({
					url : "recommendedAge"				
				})
				.done(function(datas){
					$("#output").empty();
					for(list of datas) {
						$("#output").append(makeOutput(list));
					}
					let userName = "${loginUser.name}"
					let h1 = "<h1 align='center'>" + userName + " 님과 비슷한 연령대의 회원들이 보유한 카드입니다.</h1><br/><br/>";
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
					$("#output").empty();
					var category = "";		// 카테고리 출력
					for(list of datas) {
						if(category != list.val) {					
							var div = `<br/><br/><div id="category">
											<h2>\${list.val}</h2>
										</div><br/>`;
							$("#output").append(div);							
							category = list.val;
						}
						$("#output").append(makeOutput(list));
					}
					let userName = "${loginUser.name}"
					let h1 = "<h1 align='center'>" + userName + " 님의 최근 3개월 간 소비지출에 대한 추천 카드입니다.</h1><br/>";
					$("#output").prepend(h1);
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
					$("#output").empty();
					var category = "";		// 카테고리 출력
					for(list of datas) {
						if(category != list.val) {					
							var div = `<br/><br/><div id="category">
											<h2>\${list.val}</h2>
										</div><br/>`;
							$("#output").append(div);							
							category = list.val;
						}
						$("#output").append(makeOutput(list));
					}
					let userName = "${loginUser.name}"
						let h1 = "<h1>" + userName + " 님의 관심사에 대한 추천 카드입니다.</h1><br/>";
						$("#output").prepend(h1);
				})
			}
		}
	})
	
	// 목록 초기화 후 결과 뿌려주는 공통 function
	function makeOutput(datas){
		let result = ` <div class="cardCol">
							<div class="card" data-company="\${list.card_company }">
								<img
									src="${pageContext.request.contextPath}/resources/img/card/\${list.card_image}"
									class="card-img-top">
								<div class="card-body">
									<h4 class="card-title" id="\${list.card_seq }">\${list.card_name}</h4>
									<p class="card-text">\${list.card_info}</p>
									<div class="detailBtn">
										<button class="cardModalView btn btn-outline-primary btn-sm">자세히 보기</button>
									</div>
								</div>
							</div>
						</div>`;
		return result;
	}
</script>

</body>
</html>