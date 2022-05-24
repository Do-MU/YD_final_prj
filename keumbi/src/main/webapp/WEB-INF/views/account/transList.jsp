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
					<form id="transFrm" onsubmit="return false;">
						<p>조회 계좌
							<select name="fintech_use_num" onchange="chageSelect()">
								<option value="">계좌를 선택해주세요.</option>
								<c:forEach items="${accList }" var="list">
									<option value="${list.fintech_use_num }">${list.bank_name}		${list.account_num_masked }</option>				
								</c:forEach>
							</select>
						</p>
						<span>조회 기간
							<input name="from_date" type="date"> - <input name="to_date" type="date">
						</span>
						<button type="submit" onclick="transCheck()">조회하기</button>
						<button type="submit" class="deposit">이체하기</button>
					</form>
				</div>
				<br/>
				<div id="output">
					<!-- 이곳에 거래내역 출력 -->
					<c:choose>
						<c:when test="${empty accTrans }">
							<h3 id="noData">거래내역이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col">TRAN_DATE</th>
										<th scope="col">TRAN_TIME</th>
										<th scope="col">INOUT_TYPE</th>
										<th scope="col">PRINT_CONTENT</th>
										<th scope="col">TRAN_AMT</th>
										<th scope="col">AFTER_BALANCE_AMT</th>
										<th scope="col">BRANCH_NAME</th>
									</tr>
								</thead>
								<tbody id="result">
									<c:forEach items="${accTrans }" var="trans">
										<tr data-fin="${trans.fintech_use_num }">
											<td>${trans.tran_date }</td>
											<td>${trans.tran_time }</td>
											<td>${trans.inout_type }</td>
											<td>${trans.print_content }</td>
											<td>${trans.tran_amt }</td>
											<td>${trans.after_balance_amt }</td>
											<td>${trans.branch_name }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		
	</section>


<script type="text/javascript">
	// selectBox 계좌번호 고정
	document.addEventListener("DOMContentLoaded", function(){
		var finNum = $("#result").children().first().data("fin");
		var sel = $("option");
		//console.log(finNum);
		//console.log(sel);
		
		for(let i=0; i<sel.length; i++){
			if(finNum == sel[i].value){
				//console.log(finNum);
				//console.log(sel[i].value);
				sel[i].selected = true;
				$('select').niceSelect('update');
			}
		}
	})

	// 날짜 선택 -> 거래내역 회신
	function transCheck(){
		$.ajax({
			url : "accTransRes",
			data : $("#transFrm").serialize()
		})
		.done(function(datas){
			//console.log("완료")
			//console.log(datas)
			
			//$("#noData").remove();
			//$("#result").empty();
			$("#output").empty();
			
			if(datas.length != 0) {
				let table = $('<table class="table">');
				let thead = `<thead class="thead-dark">
								<tr>
									<th scope="col">TRAN_DATE</th>
									<th scope="col">TRAN_TIME</th>
									<th scope="col">INOUT_TYPE</th>
									<th scope="col">PRINT_CONTENT</th>
									<th scope="col">TRAN_AMT</th>
									<th scope="col">AFTER_BALANCE_AMT</th>
									<th scope="col">BRANCH_NAME</th>
								</tr>
							</thead>`;
				let tbody = $('<tbody id="result">');
				$("#output").append(table);
				table.append(thead, tbody);
				for(data of datas){
					let tr = `<tr>
								<td>\${data.tran_date}</td>
								<td>\${data.tran_time}</td>
								<td>\${data.inout_type}</td>
								<td>\${data.print_content}</td>
								<td>\${data.tran_amt}</td>
								<td>\${data.after_balance_amt}</td>
								<td>\${data.branch_name}</td>
							</tr>`;
					tbody.append(tr);
				}
				
			} else {
				$("#output").empty();
				$("#output").html("<h3>거래내역이 없습니다.</h3>");
			}
		})	
	}
	
	// select -> 다른 계좌번호 선택 시 거래내역 들고옴 
	function chageSelect(){
		// 날짜 input 초기화
		$("input[name=from_date]").val(null);
		$("input[name=to_date]").val(null);
		
		let selVal = $("select option:selected").val();
		console.log(selVal)
		
		$.ajax({
			url : "chageSelect",
			data : {fintech_use_num : selVal}
		})
		.done(function(datas){
			//console.log("갔다왔지롱")
			//console.log(datas)
			
			//$("#noData").remove();
			//$("#result").empty();
			$("#output").empty();
			
			if(datas.length != 0) {
				let table = $('<table class="table">');
				let thead = `<thead class="thead-dark">
								<tr>
									<th scope="col">TRAN_DATE</th>
									<th scope="col">TRAN_TIME</th>
									<th scope="col">INOUT_TYPE</th>
									<th scope="col">PRINT_CONTENT</th>
									<th scope="col">TRAN_AMT</th>
									<th scope="col">AFTER_BALANCE_AMT</th>
									<th scope="col">BRANCH_NAME</th>
								</tr>
							</thead>`;
				let tbody = $('<tbody id="result">');
				$("#output").append(table);
				table.append(thead, tbody);
				
				for(data of datas){
					let tr = `<tr>
								<td>\${data.tran_date}</td>
								<td>\${data.tran_time}</td>
								<td>\${data.inout_type}</td>
								<td>\${data.print_content}</td>
								<td>\${data.tran_amt}</td>
								<td>\${data.after_balance_amt}</td>
								<td>\${data.branch_name}</td>
							</tr>`;		
					tbody.append(tr);
				}
			} else {
				//$("#output").empty();
				$("#output").html("<h3>거래내역이 없습니다.</h3>");
			}
		})
	}
	
	// 이체하기 넘어가는 곳
	$(".deposit").on("click", this, function(){
		var finNum = $("#result").children().first().data("fin");
		console.log(finNum);
		
		$("#fintech_use_num").val(finNum);
		transFrm.action = "accDepositView";
		transFrm.method = "get";
		transFrm.submit();
	})
</script>

</body>
</html>