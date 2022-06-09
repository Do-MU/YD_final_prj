<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	#transFrm> *,
	#transFrm> #div_btns> *{
		height: 42px;
	}
	#div_frm{
		text-align: right;
	}
  
	#output{
		margin-top:20px;
	}
	table{
		text-align:center;
	}
	.td_contents{
		text-align:left;
	}
	 .td_money{
	 	text-align:right;
	 }
	#output {
		min-height:350px;
	}
	.swal-text{
		font-size: 25px;
		margin-top: 20px;
	}
	.swal-footer{
		text-align: center;
		margin-top: 5px;
	}
	.swal-button{
		width: 400px;
	}
	.p_120{
    	min-height: 910px;
	}
</style>
</head>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>거래내역</h2>
						<div class="page_link">
							<a href="home">Home</a>
							<a href="accTransView">거래내역</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="contact_area p_120">
		<div class="container">
			<div align="center">
				<div id="div_frm">
					<form id="transFrm" onsubmit="return false;">
						<select name="fintech_use_num" onchange="chageSelect()">
							<option value="">계좌를 선택해주세요.</option>
							<c:forEach items="${accList }" var="list">
								<option value="${list.fintech_use_num }">${list.bank_name}		${list.account_num_masked }</option>				
							</c:forEach>
						</select>
						<div id="div_btns">
							<input id="from_date" name="from_date" type="date"> - <input id="to_date" name="to_date" type="date">
							<button class="btn btn-success" onclick="transCheck()">조회하기</button>
							<button type="submit" class="deposit btn btn-primary">이체하기</button>
						</div>
					</form>
				</div>
				
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
										<th width="12%">거래일자</th>
										<th width="12%">거래일시</th>
										<th width="11%">입/출금</th>
										<th width="35%">내 용</th>
										<th width="15%">금 액</th>
										<th width="15%">잔 액</th>
									</tr>
								</thead>
								<tbody id="result">
									<c:forEach items="${accTrans }" var="trans">
										<tr data-fin="${trans.fintech_use_num }">
											<td>${trans.tran_date}</td>
											<td>${trans.tran_time}</td>
											<td>${trans.inout_type}</td>
											<td class="td_contents">${trans.print_content} (${trans.branch_name})</td>
											<td class="td_money">${trans.tran_amt}</td>
											<td class="td_money">${trans.after_balance_amt}</td>
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
		
		for(var i=0; i<sel.length; i++){
			if(finNum == sel[i].value){
				//console.log(finNum);
				//console.log(sel[i].value);
				sel[i].selected = true;
				$('select').niceSelect('update');
			}
		}
		dateformat();
	})

	// 날짜 선택 -> 거래내역 회신
	function transCheck(){
		console.log($("#from_date").val())
		console.log($("#to_date").val())
		// 조회 날짜 미선택
		if($("#from_date").val() == '' || $("#to_date").val() == ''){
			//alert("조회할 날짜 선택해주세요.");
			swal("조회할 날짜를 선택해주세요", {icon: 'error'});
		} else{
			$.ajax({
				url : "accTransRes",
				data : $("#transFrm").serialize()
			}).done(function(datas){
				makeTable(datas);
				dateformat();
			});
		}
	}
	
	// select -> 다른 계좌번호 선택 시 거래내역 들고옴 
	function chageSelect(){
		// 날짜 input 초기화
		$("input[name=from_date]").val(null);
		$("input[name=to_date]").val(null);
		
		var selVal = $("select option:selected").val();
		console.log(selVal)
		
		$.ajax({
			url : "chageSelect",
			data : {fintech_use_num : selVal}
		}).done(function(datas){
			makeTable(datas);
			dateformat();
		});
	}
	
	// 이체하기 넘어가는 곳
	$(".deposit").on("click", this, function(){
		var finNum = $("#result").children().first().data("fin");
		console.log(finNum);
		
		$("#fintech_use_num").val(finNum);
		transFrm.action = "accRemitForm";
		transFrm.method = "get";
		transFrm.submit();
	})
	
	// 조회 통장 변경 OR 조회 시 테이블 출력하는 function 
	function makeTable(datas){
		$("#output").empty();			// 출력 div 초기화
		
		if(datas.length != 0) {			// return 되는 데이터가 존재
			var table = $('<table class="table">');
			var thead = `<thead class="thead-dark">
							<tr>
								<th width="12%">거래일자</th>
								<th width="12%">거래일시</th>
								<th width="11%">입/출금</th>
								<th width="35%">내 용</th>
								<th width="15%">금 액</th>
								<th width="15%">잔 액</th>
							</tr>
						</thead>`;
						
			var tbody = $('<tbody id="result">');
			for(data of datas){
				var tr = `<tr data-fin="\${data.fintech_use_num }">
							<td>\${data.tran_date}</td>
							<td>\${data.tran_time}</td>
							<td>\${data.inout_type}</td>
							<td class="td_contents">\${data.print_content} (\${data.branch_name})</td>
							<td class="td_money">\${data.tran_amt}</td>
							<td class="td_money">\${data.after_balance_amt}</td>
						</tr>`;		
				tbody.append(tr);
			}
			
			$("#output").append(table);
			table.append(thead, tbody);
			
		}
		else {							// return 되는 데이터 X
			$("#output").empty();
			$("#output").html("<h3>거래내역이 없습니다.</h3>");
		}	
	}
	
	function dateformat(){
		$("#result").children().each(function(){
			let tdate = $(this).children(":eq(0)").html();
			let ttime = $(this).children(":eq(1)").html();
			let tiotype = $(this).children(":eq(2)").html();
			let tamt = $(this).children(":eq(4)").html();
			let tmoney = $(this).children(":eq(5)").html();
			$(this).children(":eq(0)").html(tdate.substr(0,4)+"/"+tdate.substr(4,2)+"/"+tdate.substr(6));
			$(this).children(":eq(1)").html(ttime.substr(0,2)+":"+ttime.substr(2,2)+":"+ttime.substr(4));
			if(tiotype == "출금"){
				$(this).children(":eq(4)").html("-" + tamt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원");
			}else{
				$(this).children(":eq(4)").html(tamt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
			}
			$(this).children(":eq(5)").html(tmoney.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
		})
	}
</script>

</body>
</html>