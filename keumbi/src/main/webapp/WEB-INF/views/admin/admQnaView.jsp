<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<h3>고객센터 관리자 페이지</h3>
					</div>
				</div>
			</div>
		</div>
	</section>

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
						<td colspan="2" style="text-align: left;">${qna.qdate }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;">${qna.qcontents}</td>
					</tr>
					<c:choose>
						<c:when test="${not empty qna.acontents}">
							<tr>
								<td>답변</td>
								<td colspan="2" style="height: 200px; text-align: left;">
									<p>${qna.acontents}</p> <br> <span>답변일시:
										${qna.qdate}</span>
								</td>
							</tr>
						</c:when>
						<c:otherwise>

							<tr>
								<td colspan="3" style="text-align: center;">
									<!-- <button onclick="displayForm()">답변쓰기</button> -->
									<form id="amdQnaUpdateFrm" method="POST"
										action="admQnaUpdate?num=${qna.num}">
										<p>
											<textarea cols="140" rows="10" name="acontents"></textarea>
										</p>
										<p>
											<input type="submit" style="text-align: center;" value="등록하기">
										</p>
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

		function displayForm() {
			
			var makeForm = `<form id="amdQnaUpdateFrm" method="POST" action="admQnaUpdate?num=${qna.num}">
							<p>
								<textarea cols="140" rows="10" name="acontents"></textarea>
							</p>
							<p>
								<input type="submit" style="text-align: center;" value="등록하기">
							</p>
						</form>`;
						
			$(this).parent().append(makeForm);
			
		}
	</script>
</body>
</html>