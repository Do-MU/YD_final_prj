<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	margin-top:100px;
}
</style>
</head>
<body>
<div class="pagetitle">
	<h1>고객센터 답변하기</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="admQnaList">고객센터</a></li>
          <li class="breadcrumb-item active">답변하기</li>
        </ol>
      </nav>
</div>

	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center; height: 50px;"><strong>${qna.name}(${qna.user_id})</strong>님의
							&nbsp; 문의</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">제목</td>
						<td colspan="2" style="text-align: left;">${qna.title}</td>
					</tr>
					<tr>
						<td>문의일시</td>
						<td colspan="2" style="text-align: left;" id="qdate">${qna.qdate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"><pre>${qna.qcontents}</pre></td>
					</tr>
					<c:choose>
						<c:when test="${not empty qna.acontents}">
							<tr>
								<td>답변일시</td>
								<td style="text-align: left;" id="adate">${qna.adate}</td>
							</tr>
							<tr>
								<td>답변</td>
								<td colspan="2" style="height: 200px; text-align: left;"><pre>${qna.acontents}</pre>
									<br></td>

							</tr>

						</c:when>
						<c:otherwise>

							<tr>
								<td colspan="3" style="text-align: center;">
									<form id="amdQnaUpdateFrm" method="POST"
										action="admQnaUpdate?num=${qna.num}">

										<textarea cols="140" rows="10" name="acontents"
											id="answerCont"></textarea>

										<input type="submit" style="text-align: center;" value="등록하기">

									</form>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
		<a href="admQnaList" role="button" class="btn btn-outline-secondary"
			style="float: right;">목록보기</a>
	</div>

	<script>
	// 관리자외 접근시
	if (!"${loginUser.id}" || "${loginUser.id}" != 'admin') {
		swal({
			text:"권한이 없습니다.",
			button: "확인",
			icon: "error",
			closeOnClickOutside: false
		}).then((value) => {
			window.location = "${pageContext.request.contextPath}/userLoginForm";
		});
	}
		//문의 날짜
		$("#qdate").text($("#qdate").text().substring(0, 10));
		//답변 날짜
		$("#adate").text($("#adate").text().substring(0, 10));
	</script>
</body>
</html>