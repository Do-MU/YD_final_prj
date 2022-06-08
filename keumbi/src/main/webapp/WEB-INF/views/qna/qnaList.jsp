<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
	float: left;
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
	display: none;
}

table {
	table-layout: fixed;
}

th {
	background-color: #eeeeee;
	text-align: center;
}

.th-title {
	width: 600px;
}

.th-yn {
	width: 130px;
}

.th-deleteBtn {
	width: 100px;
}
.contact_area> .container{
	min-height:410px;
}
</style>
<script>
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

	<section class="contact_area p_120">
		<div class="container">
			<div>
				<div class="row">

					<table class="table qlist"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th class="th-title">제목</th>
								<th>작성일</th>
								<th class="th-yn">답변유무</th>
								<th class="th-deleteBtn"></th>
							</tr>
						</thead>

						<tbody>
							<c:forEach var="q" items="${qnas}">
								<tr class="qhead">
									<td><c:out value="${q.title}" /></td>
									<td class="qdate"><c:out value="${q.qdate}" /></td>
									<td><c:out value="${q.val}" /></td>
									<td><a role="button"
										class="btn btn-light"
										onclick="return swal('정말로 삭제하시겠습니까?', {buttons: true,dangerMode: true,closeOnClickOutside: false}).then((value) => 
										{if(value){window.loaction='qnaDelete?num=${q.num}'}})">삭제</a></td>
								</tr>
								<tr class="qbody">
									<td colspan="4">
										<div class="qnabox">
											<div class="qbox">
												<span class="question">Q. </span> <span><pre>${q.qcontents}</pre></span>
											</div>
											<c:if test="${not empty q.acontents}">
												<div class="abox">
													<span class="answer">A. </span> <span><pre>${q.acontents}</pre></span>
												</div>
											</c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<span><a href="qnaInsertForm" role="button"
						class="btn btn-dark">1:1문의 쓰기</a></span>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(".qlist .qhead").on("click", function() {
			$(".qbody").hide();
			$(this).next().toggle(300);
		});

		$(".qdate").text($(".qdate").text().substring(0, 10));
	</script>
</body>
</html>