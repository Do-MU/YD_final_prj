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
.btn-dark {
	float: right;
}
.question, .answer {
	font-family: fantasy;
	font-size: 200%;
	width: 100px;
	float : left;

}
.qnabox {
	margin: 40px;
}

.abox {
	margin: 40px 0px 0px 0px;
}

.btn-dark {
	margin: 0px 0px 50px 0px;
}
.qbody {
	display : none;
}
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
		<div >
			<div class="row">

				<table class="table qlist"
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
							<tr>
								<td ><c:out
										value="${q.title}" /></td>
								<td><c:out value="${q.qdate}" /></td>
								<td><c:out value="${q.val}" /></td>
								<td><a href="qnaDelete?num=${q.num}" role="button"
									class="btn btn-light"
									onclick="return confirm('문의글을 삭제하시겠습니까?')">삭제</a></td>
							</tr>
							<tr class="card-body qbody">

								<td colspan="4" >
									<div class="qnabox">
										<div class="qbox">
											<span class="question">Q. </span> 
											<span><pre>${q.qcontents}</pre></span>
										</div>
										<c:if test="${not empty q.acontents}">
											<div class="abox">
												<span class="answer">A. </span> 
												<span><pre>${q.acontents}</pre></span>
											</div>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<span><a href="qnaInsertForm" role="button" class="btn btn-dark">1:1문의
					쓰기</a></span>
			</div>
		</div>
	</div>
	<script>
		$(".qlist tr").on("click", function() {
			$(".qbody").hide();
			$(this).next().toggle(1000);
		})
	</script>
</body>
</html>