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
.pagination {
	diplay: block;
}

.pagination>li>a {
	float: none;
}
</style>
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
	
		<!-- 답변완료/미답변 분류 검색 -->
		<div class="row" style="float: right;">
			<form method="post" name="sortForm" action="admQnaSort">
				<table class="pull-right">
					<tr>
						<td><select class="form-control2" name="code" id="sortKey">
								<option value="">전체보기</option>
								<option value="Q0">미답변</option>
								<option value="Q1">답변완료</option>
						</select></td>
						<td><input type="submit" value="검색" class="btn btn-primary">
						</td>
					</tr>
				</table>
			</form>
		</div>

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
							<td><a href="./admQnaView?num=${q.num}"><c:out
										value="${q.title}" /></a></td>
							<td><c:out value="${q.name}" /></td>
							<td><c:out value="${q.user_id}" /></td>
							<td><c:out value="${q.qdate}" /></td>
							<td><c:out value="${q.val}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<!-- 페이징 바 -->
	<div>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" aria-label="Previous"
				onclick="prev(${p.pageNo})" id="prev_btn"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
				<li class="page-item"><a id="page-num-${i}" class="page-link"
					href="admQnaList?pageNo=${i}">${i}</a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link" aria-label="Next"
				onclick="next(${p.pageNo})" id="next_btn"> <span
					aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</div>

	<script>
	
	var totalPage = ${p.totalPage};
	   // 첫장과 막장의 prev/next버튼 disable
	   if(${p.pageNo} <= 10){
	      document.getElementById("prev_btn").onclick="location.href='#'";
	   }
	   if(${p.startPage} == ((parseInt((totalPage - 1) / 10)) * 10 + 1) ){
	      document.getElementById("next_btn").onclick="location.href='#'";
	   }
	   
	   document.getElementById("page-num-"+${p.pageNo}).style = "background-color: blue; color: white";
	      
	   function next(n){
	      var x = ((parseInt((n-1)/10)+1)*10)+1;
	      window.location = "admQnaList?pageNo=" + x;
	   }
	   function prev(n){
	      var x = ((parseInt((n-1)/10)-1)*10)+1;
	      window.location = "admQnaList?pageNo=" + x;
	   }
</script>
</body>
</html>