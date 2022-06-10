<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>
	#depositFrm table{
		width:100%;
		border-collapse: separate;
		border-spacing: 0 10px;
	}
	
	#tran_amt{
		text-align:right;
	}
	
	.modal-body table{
		width:100%;
	}
	.nice-select,
	#depositFrm input{
		width:250px;
		text-align:right;
	}
	
	#div_wit, #div_dep{
		border: 1px solid #e6e6e6;
		padding: 40px;
		border-radius: 20px;
		margin: 20px 0;
	}
	#div_btns{
		margin: 30px auto;
		text-align:center;
	}
	#div_btns button{
		width: 100px;
		font-size: 1.2em;
		margin: 0 10px;
	}
	.swal-modal {
    width: 550px;
    height: 360px;
    text-align-last: center;
	}
	.swal-text:first-child {
	    margin-top: 60px;
	}
	.swal-text {
		font-size: 30px;
		color: black;
		margin-top: 20px;
	}
	.swal-footer {
		margin-top: 20px;
	}
	.swal-button {
		width: 480px;
	}
</style>
<script>
	// 비회원 접근시
	$(window).ready(function(){
		if (!"${loginUser.id}") {
			swal({
				text:"로그인이 필요합니다.",
				button: "확인",
				icon: "error",
				closeOnClickOutside: false
			}).then((value) => {
				window.location = "userLoginForm";
			});
		}
	})
</script>
</head>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>내 계좌 간 송금</h2>
						<div class="page_link">
							<a href="home">Home</a>
							<a href="getAccInfo">송금</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="contact_area p_120">
		<div class="container">
			<div>
				<div>
					<form id="depositFrm">
						<div id="div_wit">
							<h3>출금계좌정보</h3>
							<table>
								<tr>
									<th width="20%">출금계좌번호</th>
									<td width="28%">
										<select id="wit_fintech_use_num" name="wit_fintech_use_num" onchange="witSelect()">
											<option value="">계좌를 선택해주세요.</option>
											<c:forEach items="${accList }" var="list">
												<option value="${list.fintech_use_num }">${list.bank_name} ${list.account_num_masked }</option>
											</c:forEach>
										</select>
									</td>
									<td width="5%">잔액</td>
									<td id="wit_balance_amt">${finBal.balance_amt}
									</td>
								</tr>
								<tr>
									<th>이체금액</th>
									<td>
										<input id="tran_amt" name="tran_amt" type="text" onchange="inputChange()">원
									</td>
								</tr>
								<tr>
									<th>출금통장 표시내용</th>
									<td>
										<input id="wit_print_content" name="wit_print_content">
										<input hidden="hidden" value="${finBal.balance_amt}" id="wit_amt" name="wit_amt">
									</td>
								</tr>
							</table>
						</div>
						
						<div id="div_dep">
							<h3>입금계좌정보</h3>
							<table>
								<tr>
									<th width="20%">입금계좌번호</th>
									<td width="25%">
										<select id="dep_fintech_use_num" name="dep_fintech_use_num" onchange="depSelect()">
											<option value="">계좌를 선택해주세요.</option>
											<c:forEach items="${accList}" var="list">
												<option value="${list.fintech_use_num}">${list.bank_name} ${list.account_num_masked}</option>
											</c:forEach>
										</select>
									</td>
									<td></td>
								</tr>
								<tr>
									<th>입금통장 표시내용</th>
									<td>
										<input id="dep_print_content" name="dep_print_content">
										<input hidden="hidden" value="" id="dep_amt" name="dep_amt">
									</td>
								</tr>
							</table>						
						</div>
					</form>
				</div>
				<br />
				<div id="div_btns">
					<button class="btn btn-secondary">취소</button>
					<button class="btn btn-primary" onclick="depositFun()">송금</button>
				</div>
			</div>
		</div>
	</section>

	<!-- 이체확인 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h3 class="modal-title">이체정보확인</h3>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<table>
						<tr>
							<th width="20%">출금계좌</th>
							<td id="wit_bn" width="20%"></td>
							<td id="wit_acc" width="20%"></td>
						</tr>
						<tr>
							<th>입금계좌</th>
							<td id="dep_bn"></td>
							<td id="dep_acc"></td>
						</tr>
						<tr>
							<th>이체금액</th>
							<td colspan="2" id="tr_amt"></td>
						</tr>
						<tr>
							<th>출금통장 표시내용</th>
							<td colspan="2" id="wit_pc"></td>
						</tr>
						<tr>
							<th>입금통장 표시내용</th>
							<td colspan="2" id="dep_pc"></td>
						</tr>
					</table>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary" onclick="transPro()">송금</button>
				</div>
				
			</div>
		</div>
	</div>

	<script>
	
		// 페이지 로드시 
		document.addEventListener("DOMContentLoaded", function() {
			$("#wit_balance_amt").html($("#wit_balance_amt").html().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");
			$('#wit_bn').text("${finBal.bank_name} ");
			$('#wit_acc').text("${finBal.account_num_masked}");
			// SelectBox 계좌번호 고정
			var finNum = "${finBal.fintech_use_num}";
			var sel = $("option");
			
			for (var i = 0; i < sel.length; i++) {
				if (finNum == sel[i].value) {
					sel[i].selected = true;
					$('#wit_fintech_use_num').niceSelect('update');
				}
			}
			$('#dep_fintech_use_num').val("");
		})

		// 출금 Select Event
		function witSelect() {
			var finNum = $("select[name=wit_fintech_use_num]").val();
			$.ajax({
				url : "getAccInfo",
				data : {fintech_use_num : finNum}
			}).done(function(wit) {
				$("#wit_balance_amt").html(wit.balance_amt.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원");		// 잔액
				$("#wit_amt").val(wit.balance_amt);
				
				$('#wit_bn').text(wit.bank_name); 					// 모달 출금 은행이름
				$('#wit_acc').text(wit.account_num_masked); 		// 모달 출금 계좌번호
			});
		}

		// 이체금액 입력값 검증
		function inputChange() {
			var wit_amt = Number($("#wit_amt").val()); 					// 이체가능금액
			var tranVal = Number($('#tran_amt').val()); 				// 이체금액
			
			if ((wit_amt - tranVal) < 0) {
				//alert("잔액부족\n" + "이체금액을 다시 입력해주세요.");
				swal("잔액부족", "이체금액을 다시 입력해주세요", {icon: "error"}).then((value) => {
					$('#tran_amt').val("")
					$('#tran_amt').focus();
					return false;					
				})
			}
		}

		// 입금 Select Event
		function depSelect() {
			var finNum = $("#dep_fintech_use_num").val();

			$.ajax({
				url : "getAccInfo",
				data : {fintech_use_num : finNum}
			}).done(function(dep) {
				$("#dep_amt").val(dep.balance_amt); 				// 잔액불러오기
				$("#dep_bn").html(dep.bank_name); 					// 모달 입금은행명
				$("#dep_acc").html(dep.account_num_masked); 		// 모달 입금계좌
			})
		}

		// 이체확인 모달
		function depositFun() {
			// 은행 미선택 시
			if ($("#wit_fintech_use_num").val() == ""|| $("#dep_fintech_use_num").val() == "") {
				swal("은행을 선택해주세요",{icon: 'error'}).then((value) => {
					$('#dep_fintech_use_num').focus();					
				});
				return false;
			}else if($("#wit_fintech_use_num").val() == $("#dep_fintech_use_num").val()){
				swal("입금계좌와 출금계좌가 같습니다.", {icon: 'error'});
				return false;
			}
			
			// 이체금액 미입력 시
			if (!$('#tran_amt').val()) {
				//alert("이체 할 금액을 입력하세요.");
				swal("이체 할 금액을 입력하세요", {icon: 'error'}).then((value) => {					
					$('#tran_amt').focus();
				})
				return false;
			}

			//	-> 은행이름 + 계좌 모달에 고정
			$("#tr_amt").text($("#tran_amt").val().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+"원"); // 송금액 표시

			if ($("#wit_print_content").val() == "") {
				$('#wit_print_content').val($("#dep_bn").text() + ' ' + '${loginUser.name}');
			}

			if ($("#dep_print_content").val() == "") {
				$('#dep_print_content').val($("#wit_bn").text() + ' ' + '${loginUser.name}');
			}
			
			$("#wit_pc").text($("#wit_print_content").val()); // 출금내용표시
			$("#dep_pc").text($("#dep_print_content").val()); // 입금내용표시

			$('#exampleModal').modal('show');
		}

		// 이체실행 func
		function transPro() {
			swal("이체가 완료되었습니다.", {icon: "success"}).then((value) => {
				depositFrm.action = "accTranProcess";
				depositFrm.method = "post";
				depositFrm.submit();				
			})
		}
	</script>
</body>
</html>