<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.num {
	text-align: center;
}

.btn {
	text-align: center;
}

.btn-info {
	margin-top: 10px;
	float: right;
	width: 150px;
}

.form-control{
	line-height: 30px;
}

.form-control3 {
	width: 220px;
	height: 38px;
}

th {
	background-color: #eeeeee;
	text-align: center;
}

#tbl_list {
	text-align: center;
	border: 1px solid #dddddd;
	width: 100%;
}

#searchBtn {
	width: 100px;
}

#tbl_list tbody tr:hover {
	background-color: #eeeeee;
	cursor: pointer;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>커뮤니티</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="boardList">커뮤니티</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="contact_area p_120">
	<div class="container">
		<select class="form-control pageScale" id="pageScale" style="float: left;" onchange="scaleChange()">
			<option value="10">10페이지</option>
			<option value="20">20페이지</option>
			<option value="30">30페이지</option>
		</select>

		<div class="row" style="float: right;">
			<table class="pull-right">
				<tr>
					<td>
						<select class="form-control2" name="key" id="searchKey">
							<option value="t">제목</option>
							<option value="c">내용</option>
							<option value="tc">제목 + 내용</option>
							<option value="tg">태그</option>
						</select>
					</td>
					<td>
						<input type="text" class="form-control3" placeholder="검색어 입력" id="searchVal" name="val" maxlength="100">
					</td>
					<td>
						<input value="검색" id="searchBtn" class="btn btn-primary">
					</td>
				</tr>
			</table>
		</div>
	</div>

	<br> <br> <br>
	<!-- 게시판 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="row">
			<table id="tbl_list" class="table">
				<thead>
					<tr>
						<th width="15%">번호</th>
						<th width="50%">제목</th>
						<th width="15%">작성자</th>
						<th width="10%">작성일</th>
						<th width="10%">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${boards}">
						<tr data-num="${i.bod_num}">
							<td>${i.bod_num}</td>
							<td align="left">${i.title}</td>
							<td>${i.user_id}</td>
							<td>${i.wdate}</td>
							<td>${i.hit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 글쓰기 버튼 생성 -->
		<c:if test="${sessionScope.loginUser != null}">
			<a href="boardInsertForm" role="button" class="btn btn-info">게시글 작성</a>
		</c:if>
		<br>

		<div>
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" aria-label="Previous" onclick="prev(${p.pageNo})" id="prev_btn">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
					<li class="page-item">
						<a id="page-num-${i}" class="page-link" href="boardList?pageNo=${i}&pageScale=${p.pageScale}">${i}</a>
					</li>
				</c:forEach>
				<li class="page-item">
					<a class="page-link" aria-label="Next" onclick="next(${p.pageNo})" id="next_btn">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 게시판 메인 페이지 영역 끝 -->
</section>

<script>
		var totalPage = ${p.totalPage};
		var pageNo = ${p.pageNo};
		var scale = ${p.pageScale};
		document.getElementById("page-num-"+${p.pageNo}).style = "background-color: blue; color: white";
		
		// 이전페이지 > 21~30 페이지 사이일 때 20페이지로
		// 첫 페이지일때 prev btn disable
		if(${p.pageNo} <= 10){
			$("#prev_btn").css("cursor","default");
			$("#prev_btn").css("background-color","#dee2e6");
		}      
		function next(n){
			if(${p.pageNo} < parseInt(totalPage/10)*10){
				pageNo = ((parseInt((n-1)/10)+1)*10)+1;
				window.location = "boardList?pageNo=" + pageNo + "&pageScale=" + scale;
			}else{
				return false;
			}
			
		}
		
		// 다음페이지 > 1~10 페이지 사이일 때 11페이지로
		// 마지막 페이지일때 next btn disable
		if(${p.startPage} == ((parseInt((totalPage - 1) / 10)) * 10 + 1) ){
			$("#next_btn").css("cursor","default");
			$("#next_btn").css("background-color","#dee2e6");
		}
		function prev(n){
			if(${p.pageNo} > 10){
				pageNo = ((parseInt((n-1)/10)-1)*10)+1;
				window.location = "boardList?pageNo=" + pageNo + "&pageScale=" + scale;
			}
			else{
				return false;
			}
		}
		
		// 페이지에 출력하는 게시글 개수 조정
		function scaleChange(){
			scale = $(".pageScale option:selected").val();
			window.location = "boardList?pageNo=" + pageNo + "&pageScale=" + scale;
		}
		for(var i=0; i<$(".pageScale option").length; i++){
			if(${p.pageScale} == $(".pageScale option")[i].value){
				$(".pageScale option")[i].selected = true;
			}
		}
		
		$("#tbl_list tbody").on('click', "tr", function(){
			window.location = "boardView?bod_num="+$(this).data("num");
		});
		
		$("#searchBtn").on('click',function(){
			event.preventDefault();
			$.ajax({
				url : "boardSearch",
				data : {"key" : $("#searchKey").val(),
						"val" : $("#searchVal").val()}
			}).done(function(result){
				console.log(result);
			});
		});
	</script>
