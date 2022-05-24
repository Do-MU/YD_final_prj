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
					<h4>출금계좌정보</h4>
					<table border="1">
						<tr>
							<th scope="col">출금계좌번호</th>
							<td colspan="3">
								<select name="wit_fintech_use_num">
									<option value="">계좌를 선택해주세요.</option>
									<c:forEach items="${accList }" var="list">
										<option value="${list.fintech_use_num }">${list.bank_name}		${list.account_num_masked }</option>				
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col">이체금액</th>
							<td><input name="wit_tran_amt">원</td>
							<td>이체가능금액</td>
							<td>123321321</td>
						</tr>
						<tr>
							<th scope="col">출금통장 표시내용</th>
							<td colspan="3"><input name="wit_print_content"></td>
						</tr>
					</table>
					<hr/>
					<h4>입금계좌정보</h4>
					<table border="1">
						<tr>
							<th scope="col">입금계좌번호</th>
							<td colspan="3">
								<select name="dep_fintech_use_num">
									<option value="">계좌를 선택해주세요.</option>
									<c:forEach items="${accList }" var="list">
										<option value="${list.fintech_use_num }">${list.bank_name}		${list.account_num_masked }</option>				
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col">입금통장 표시내용</th>
							<td colspan="2"><input name="dep_print_content"></td>
						</tr>
					</table>
				</form>
			</div>
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
        		<td>국민은행</td>
        		<td id="a"></td>
        	</tr>
        	<tr>
        		<th>입금계좌</th>
        		<td>우리은행</td>
        		<td id="b"></td>
        	</tr>
        	<tr>
        		<th>이체금액</th>
        		<td colspan="2" id="c"></td>
        	</tr>
        	<tr>
        		<th>받는 분 통장표시내용</th>
        		<td colspan="2" id="d"></td>
        	</tr>
        	<tr>
        		<th>내 통장표시내용</th>
        		<td colspan="2" id="e"></td>
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
	
	// 이체확인 모달
	function depositFun(){
		let wit_fun = $("select[name=wit_fintech_use_num]").val();
		let wit_ta = $("input[name=wit_tran_amt]").val();
		let wit_pc = $("input[name=wit_print_content]").val();
		let dep_fun = $("select[name=dep_fintech_use_num]").val();
		let dep_pc = $("input[name=dep_print_content]").val();
		
		/* console.log(wit_fun);
		console.log(wit_ta);
		console.log(wit_pc);
		console.log(dep_fun);
		console.log(dep_pc); */
		
		$("#a").text(wit_fun);
		$("#b").text(wit_ta);
		$("#c").text(wit_pc);
		$("#d").text(dep_fun);
		$("#e").text(dep_pc);
		
		
		// 입력값 검증
		//	-> 이체금액이 이체가능 금액보다 클 경우
		
		$('#exampleModal').modal('show');
	}
	
	// 이체실행 func
	function transPro(){
		depositFrm.action = "accTranProcess";
		depositFrm.method = "post";
		depositFrm.submit();
	}
	
	
	
	
	// 폼태그안에 dep wit 받을 id 설정 -> 폼태크 controller로 넘기기
	
	
	
</script>
</html>