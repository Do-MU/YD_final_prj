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
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">ID</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">답변유무</th>
						</tr>
					</thead>
					<tbody>					
						<c:forEach var="q" items="${qnas}">
							<tr onclick='qnaView("${q.num}")'>
							
								<td><c:out value="${q.num}" /></td>
								<td><a href="./admQnaView?num=${q.num}"><c:out value="${q.title}" /></a></td>
								<td><c:out value="${q.name}"/></td>
								<td><c:out value="${q.user_id}"/></td>
								<td><c:out value="${q.qdate}" /></td>
								<td><c:out value="${q.val}" /></td>	
							</tr>	
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
<script>
function qnaView(i) {
	console.log("==============="+i)
	frm.num.value = i;
	frm.action = "./admQnaView?num=${q.num}";
	frm.submit();
}
</script>
</body>
</html>