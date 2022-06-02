<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
</style>
<script>
	if (!'${loginUser.id}') {
		alert('로그인이 필요합니다.');
		window.location = "userLoginForm";
	}
</script>
<body>

	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>고객센터</h3>
					</div>
				</div>
			</div>
		</div>
	</section>

	<br>
	<br>

	<div class="container">
		<div class="accordion" id="accordionExample">
			<span id="insertBtn"><a href="qnaInsertForm" role="button"
				class="btn btn-dark">1:1문의 쓰기</a></span>
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">답변유무</th>
							<th style="background-color: #eeeeee; text-align: center;"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="q" items="${qnas}">
							<tr class="card-header">
								<td data-toggle="collapse" data-target="#collapse-${q.num}"
									aria-expanded="true" aria-controls="collapseOne"><c:out
										value="${q.title}" /></td>
								<td><c:out value="${q.qdate}" /></td>
								<td><c:out value="${q.val}" /></td>
								<td><a href="qnaDelete?num=${q.num}" role="button"
									class="btn btn-light"
									onclick="return confirm('문의글을 삭제하시겠습니까?')">삭제</a></td>
							</tr>
							<tr class="card-body">

								<td colspan="4" id="collapse-${q.num}" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<span>문의내용</span> 
									<span>${q.qcontents}</span></td>
							</tr>
							<c:if test="${not empty q.acontents}">
								<td colspan="4" id="collapse-${q.num}" class="collapse"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<span>답변내용</span>
									<span>${q.acontents}</span>
									<span>${q.adate}</span></td>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>