<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="banner_area">
	<div class="box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h1>내 계좌 간 송금</h1>
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
				<form id="depositFrm">
						<input type="hidden" name="wit_bank_name" value="${finBal.bank_name }">
						<input type="hidden" name="wit_account_num_masked" value="${finBal.account_num_masked }">
						<h4 id="fin" data-fin="${finBal.fintech_use_num }">출금계좌정보</h4>
					<table>
						<tr>
							<th scope="col">출금계좌번호</th>
							<td colspan="3">
								<select name="wit_fintech_use_num" onchange="witSelect()">
									<option value="">계좌를 선택해주세요.</option>
									<c:forEach items="${accList }" var="list">
										<option value="${list.fintech_use_num }">${list.bank_name}			${list.account_num_masked }</option>				
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col">이체금액</th>
							<td><input name="tran_amt" type="text" onchange="inputChange()">원</td>
							<td>이체가능금액</td>
							<td><input name="wit_amt" type="text" readonly="readonly" value="${finBal.balance_amt }"></td>
						</tr>
						<tr>
							<th scope="col">출금통장 표시내용</th>
							<td colspan="3"><input name="wit_print_content"></td>
						</tr>
					</table>
					<hr/>
					<h4>입금계좌정보</h4>
					<table>
						<tr>
							<th scope="col">입금계좌번호</th>
							<td colspan="2">
								<select name="dep_fintech_use_num" onchange="depSelect()">
									<option value="">계좌를 선택해주세요.</option>
									<c:forEach items="${accList }" var="list">
										<option value="${list.fintech_use_num }">${list.bank_name}		${list.account_num_masked }</option>				
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col">입금통장 표시내용</th>
							<td><input name="dep_print_content"></td>
							<td><input type="hidden" name="dep_amt"></td>
						</tr>
					</table>
				</form>
			</div>
			<br/>
			<div>
				<button>입력취소</button>
				<button onclick="depositFun()">이체하기</button>
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
        		<th>출금계좌</th>
        		<td id="wit_bn"></td>
        		<td id="wit_acc"></td>
        	</tr>
        	<tr>
        		<th>입금계좌</th>
        		<td id="dep_bn"></td>
        		<td id="dep_acc"></td>
        	</tr>
        	<tr>
        		<th>이체금액</th>
        		<td colspan="2" id="tran_amt"></td>
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
        <button type="submit" class="btn btn-primary" onclick="transPro()">이체실행</button>
      </div>
    </div>
  </div>
</div>

</body>

<script type="text/javascript">	
	//페이지 로드시 
	document.addEventListener("DOMContentLoaded", function(){		
		// -> selectBox 계좌번호 고정
		var finNum = $("#fin").data("fin");
		var sel = $("option");
		//console.log(finNum);
		//console.log(sel);
		
		for(var i=0; i<sel.length; i++){
			if(finNum == sel[i].value){
				//console.log(finNum);
				//console.log(sel[i].value);
				sel[i].selected = true;
				$('select[name=wit_fintech_use_num]').niceSelect('update');
			}
		}
	})
	
	// 모달에 필요한 변수	
	var wit_bn;
	var wit_acc;
	var wit_pc;
	var dep_bn;
	var dep_acc;
	var dep_pc;
	var tran_amt;
	
	// 출금 Select Event
	function witSelect(){
		$('input[name=wit_amt]').val(""); // 입금가능금액 input 초기화
		$('input[name=wit_bank_name]').val(""); // 은행이름 초기화
		$('input[name=wit_account_num_masked]').val(); // 계좌번호 초기화
		
		var finNum = $("select[name=wit_fintech_use_num]").val();
		$.ajax({
			url : "getAccInfo",
			data : { fintech_use_num : finNum }
		})
		.done(function(data){
			$("input[name=wit_amt]").val(data.balance_amt); // 이체가능금액 update
			$('input[name=wit_bank_name]').val(data.bank_name); // 은행이름
			$('input[name=wit_account_num_masked]').val(data.account_num_masked); // 계좌번호
			wit_bn = data.bank_name; //모달 출금은행명
			wit_acc = data.account_num_masked; // 모달 출금계좌
			console.log(wit_bn + wit_acc);
		})	
	}
	
	// 이체금액 입력값 검증
	function inputChange(){
		var wit_amt = Number($('input[name=wit_amt]').val()); //이체가능금액
		var tranVal = Number($('input[name=tran_amt]').val()); //이체금액
		if( (wit_amt - tranVal) < 0){
			alert("잔액부족\n" + "이체금액을 다시 입력해주세요.");
			$('input[name=tran_amt]').val("")
			$('input[name=tran_amt]').focus();
			return false;
		}
	}
	
	// 입금 Select Event
	function depSelect(){
		$("input[name=dep_bank_name]").empty();
		$("input[name=dep_account_num_masked]").empty();
		
		var finNum = $("select[name=dep_fintech_use_num]").val();
		console.log(finNum)
		
		$.ajax({
			url : "getAccInfo",
			data : { fintech_use_num : finNum }
		})
		.done(function(data){
			console.log(data)
			$("input[name=dep_amt]").val(data.balance_amt); // 잔액불러오기
			dep_bn = data.bank_name; // 모달 입금은행명
			dep_acc = data.account_num_masked; // 모달 입금계좌
			console.log(dep_bn)
		})
	}
	
	// 이체확인 모달
	function depositFun(){
		// 안먹힘 다시 확인*************************
		if($("select[name=wit_fintech_use_num]").val() == "" || $("select[name=dep_fintech_use_num]").val() == ""){
			alert("은행을 선택해 주세요.");
			$('select[name=dep_fintech_use_num]').focus();
			return false;
		}
		// 이체금액 미입력 시
		if(!$('input[name=tran_amt]').val()){
			alert("이체 할 금액을 입력하세요.");
			$('input[name=tran_amt]').focus();
			return false;
		}
		
		// 출금 은행 변경없이 이체 할 경우
		//	-> 은행이름 + 계좌 모달에 고정
		wit_bn = $("input[name=wit_bank_name]").val();
		wit_acc = $("input[name=wit_account_num_masked]").val();
		
		tran_amt = $("input[name=tran_amt]").val(); // 송금액 표시
		wit_pc = $("input[name=wit_print_content]").val(); // 출금내용표시
		dep_pc = $("input[name=dep_print_content]").val(); // 입금내용표시
		
		if(wit_pc == ""){
			wit_pc = $("#wit_pc").html(dep_bn + ' ' + '${loginUser.name}').text();
			console.log(dep_bn + ' ' + '${loginUser.name}');
			$('input[name=wit_print_content]').val(dep_bn + ' ' + '${loginUser.name}');
		}
		
		if(dep_pc == ""){
			dep_pc = $("#dep_pc").html(wit_bn + ' ' + '${loginUser.name}').text();
			console.log(wit_bn + ' ' + '${loginUser.name}');
			$('input[name=dep_print_content]').val(wit_bn + ' ' + '${loginUser.name}');
		}
		
		console.log(wit_bn)
		$("#wit_bn").text(wit_bn); // 출금은행이름
		$("#wit_acc").text(wit_acc); // 출금계좌
		$("#dep_bn").text(dep_bn); // 입금은행이름
		$("#dep_acc").text(dep_acc); // 입금계좌
		$("#tran_amt").text(tran_amt); // 이체금액
		$("#wit_pc").text(wit_pc) // 출금내용
		$("#dep_pc").text(dep_pc); // 입금내용
		
		$('#exampleModal').modal('show');
	}
	
	// 이체실행 func
	function transPro(){
		depositFrm.action = "accTranProcess";
		depositFrm.method = "post";
		depositFrm.submit();
	}	
</script>
</html>