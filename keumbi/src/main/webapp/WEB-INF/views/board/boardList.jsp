<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판</title>

<style>
.num {
	text-align: center;
}

.btn {
	text-align: center;
	width: 150px;
}

.btn-outline-info {
	right: 365px;
	margin-top: 10px;
	float: right;
}

.form-control3 {
	width: 220px;
	height: 38px;
}
</style>

</head>
<body>
	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>게시판</h3>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- 네비게이션 영역 끝 -->

	<br>
	<br>
	<br>

	<div class="container">
		<select class="form-control" name="searchField" style="float: left;">
			<option value="0">10페이지</option>
			<option value="0">20페이지</option>
			<option value="0">30페이지</option>
		</select>
		<div class="row" style="float: right;">
			<form method="post" name="search" action="boardSearch">
				<table class="pull-right">
					<tr>
						<td><select class="form-control2" name="key" id="searchKey">
								<option value="제목">제목</option>
								<option value="내용">내용</option>
								<option value="제목내용">제목 + 내용</option>
								<option value="0">태그</option>
						</select></td>
						<td><input type="text" class="form-control3"
							placeholder="검색어 입력" id="searchVal" name="val" maxlength="100">
						</td>
						<td><input type="submit" value="검색" class="btn btn-primary">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<br>
	<br>
	<br>
	<!-- 게시판 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list}">
						<tr>
							<td><c:out value="${i.bod_num}" /></td>
							<td><a href="./boardView?bod_num=${i.bod_num}"><c:out
										value="${i.title}" /></a></td>
							<td><c:out value="${i.wdate}" /></td>
							<td><c:out value="${i.user_id}" /></td>
							<td><c:out value="${i.hit}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<%-- <c:if test="${sessionScope.loginUser != null}">			
			<script>
				alert("로그인 하신 후에 글작성이 가능합니다!");
				location.href = "user/userLoginForm";
			</script>							
</c:if>	 --%>
		<!-- 글쓰기 버튼 생성 -->
		<c:if test="${sessionScope.loginUser != null}">
			<a href="boardInsertForm" role="button" class="btn btn-outline-info">게시글
				작성</a>
		</c:if>
		<br> <br>  


		<div>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" aria-label="Previous"
				onclick="prev(${p.pageNo})" id="prev_btn"> <span
					aria-hidden="true">&laquo;</span>
			</a></li>
			<c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
				<li class="page-item"><a id="page-num-${i}" class="page-link"
					href="boardList?pageNo=${i}">${i}</a></li>
			</c:forEach>
			<li class="page-item"><a class="page-link" aria-label="Next"
				onclick="next(${p.pageNo})" id="next_btn"> <span
					aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</div>


	</div>
	<br>
	<!-- 게시판 메인 페이지 영역 끝 -->

	<script type="text/javascript">
		function searchList() {
			event.preventDefault();
			/* console.log('sssss') */
			$.ajax({
				url : "boardSearch",
				type : "post",
				data : {
					"key" : $("#searchKey").val(),
					"val" : $("#searchVal").val()
				},
				dataType : "json",
				success : function(result) {
					if (result.length > 0) {
						/* console.log(result); */
						//searchResult(result); // json data를 html로 변환해서 화면에 뿌려주는 메소드 
					} else {
						alert("검색한 결과 존재하지 않습니다.");
					}
				}
			});
		}
		
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
		      window.location = "boardList?pageNo=" + x;
		   }
		   function prev(n){
		      var x = ((parseInt((n-1)/10)-1)*10)+1;
		      window.location = "boardList?pageNo=" + x;
		   }
		
	</script>

</body>



</html>