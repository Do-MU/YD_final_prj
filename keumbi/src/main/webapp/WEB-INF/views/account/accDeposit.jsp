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
					<h1>이체하기</h1>
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
								<select name="fintech_use_num">
									<option value="">계좌를 선택해주세요.</option>
									<c:forEach items="${accList }" var="list">
										<option value="${list.fintech_use_num }">${list.bank_name}		${list.account_num_masked }</option>				
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="col">이체금액</th>
							<td><input>원</td>
							<td>이체가능금액</td>
							<c:if test="${accList }">
								<td>123321321</td>
							</c:if>
						</tr>
						<tr>
							<th scope="col">내통장표시내용</th>
							<td colspan="3"><input></td>
						</tr>
					</table>
					<hr/>
					<h4>입금계좌정보</h4>
					<table border="1">
						<tr>
							<th scope="col" colspan="3">입금계좌정보</th>
						</tr>
						<tr>
							<th scope="col">입금은행</th>
							<td>
								<select>
									<option value="">은행을 선택해주세요.</option>
								</select>
							</td>
							<td>
								<input>
							</td>
						</tr>
						<tr>
							<th scope="col">내통장표시내용</th>
							<td colspan="2"><input></td>
						</tr>
					</table>
				</form>
			</div>
			<div>
				<button onclick="depositFun()">입력취소</button>
				<button>이체하기</button>
			</div>
		</div>
	</div>
</section>

</body>

<script type="text/javascript">
	// 폼태그안에 dep wit 받을 id 설정 -> 폼태크 controller로 넘기기
	// 입력값 검증
	//	-> 핀테크 이용번호 검증
	//	-> 이체금액이 이체가능 금액보다 클 경우
	//	-> 통장표시	-> 이름
</script>
</html>