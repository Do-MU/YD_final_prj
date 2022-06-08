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

#tbl_list tbody tr:not(.t2tr):hover {
	background-color: #eeeeee;
	cursor: pointer;
}
#div_tbl{
	min-height: 650px;
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
	<div class="container" id="div_tbl">
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
						<c:choose>
							<c:when test="${i.bod_code eq 'T2'}">
								<tr data-num="#" class="t2tr">
									<td>${i.bod_num}</td>
									<td align="left">${i.title}</td>
									<td>${i.user_id}</td>
									<td>${i.wdate}</td>
									<td>${i.hit}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr data-num="${i.bod_num}">
									<td>${i.bod_num}</td>
									<td align="left">${i.title}</td>
									<td>${i.user_id}</td>
									<td>${i.wdate}</td>
									<td>${i.hit}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<!-- 글쓰기 버튼 생성 -->
		<c:if test="${loginUser != null && loginUser.user_code == 'U1'}">
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
						<a id="page-num-${i}" class="page-link pgl" onclick="changePage(${i})">${i}</a>
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
		printReCnt();
		
		var totalPage = ${p.totalPage};
		var pageNo = ${p.pageNo};
		var scale = ${p.pageScale};
		var key = '${s.key}';
		var val = '${s.val}';
		if(val != ''){
			$("#searchVal").val(val);
			for(var i=0; i<$("#searchKey option").length; i++){
				if(key == $("#searchKey option")[i].value){
					$("#searchKey option")[i].selected = true;
				}
			}
		}
		
		document.getElementById("page-num-"+${p.pageNo}).style = "background-color: blue; color: white";
		
		// 페이지 이동
		function changePage(num){
			pageNo = num;
			redirect();
		}
		
		// 1-10 페이지일 때 prev btn disable
		if(${p.pageNo} <= 10){
			$("#prev_btn").css("cursor","default");
			$("#prev_btn").css("background-color","#dee2e6");
		}
		function next(n){
			if(${p.endPage} <= parseInt(totalPage/10)*10){		// 현재 마지막 페이지 40, 총 페이지 46 >> 다음페이지버튼 활성화 
				pageNo = ((parseInt((n-1)/10)+1)*10)+1;			// 다음페이지 > 21~30 페이지 사이일 때 31페이지로
				redirect();
			}else{
				return false;
			}
		}
		
		// 마지막 페이지일때 next btn disable
		if(${p.startPage} == ((parseInt((totalPage - 1) / 10)) * 10 + 1) ){
			$("#next_btn").css("cursor","default");
			$("#next_btn").css("background-color","#dee2e6");
		}
		function prev(n){
			if(${p.pageNo} >= 10){								// 현재 페이지가 10이상 일때만 >> 이전페이지버튼 활성화
				pageNo = ((parseInt((n-1)/10)-1)*10)+1;			// 이전페이지 > 21~30 페이지 사이일 때 21페이지로
				redirect();
			}
			else{
				return false;
			}
		}
		
		// 페이지에 출력하는 게시글 개수 조정
		function scaleChange(){
			scale = $(".pageScale option:selected").val();
			redirect();
		}
		for(var i=0; i<$(".pageScale option").length; i++){
			if(${p.pageScale} == $(".pageScale option")[i].value){
				$(".pageScale option")[i].selected = true;
			}
		}
		
		// 제재된 게시글 선택 X
		$("#tbl_list tbody").on('click', "tr", function(){
			if($(this).data("num")=='#'){
				return false;
			}
			window.location = "boardView?bod_num="+$(this).data("num");
		});
		
		$("#searchBtn").on('click',function(){
			key = $("#searchKey").val();
			val = $("#searchVal").val();
			pageNo = 1;
			scale = 10;
			if(val == ''){
				redirect();
			} else{
				redirect();
			}
		});
		
		// 댓글 수 출력 []
		function printReCnt(){
			$("#tbl_list tbody tr").not(".t2tr").each(function(){
				let tr = $(this);
				$.ajax({
					url:"replyCount",
					data:{bod_num:tr.data("num")}
				}).done(function(reCnt){
					title = tr.children(":eq(1)").text();
					tr.children(":eq(1)").html("<b style='color:#777777;'>"+title+"</b><span> ["+reCnt+"] </span>");
				});
				
			});
		}
		
		// 조건에 따라 list 다르게 유지
		function redirect(){
			if(val == ''){
				window.location = "boardList?pageNo=" + pageNo + "&pageScale=" + scale;
			} else{
				window.location = "boardList?pageNo=" + pageNo + "&pageScale=" + scale + "&key=" + key + "&val=" + val;
			}
			printReCnt();
		}
	</script>
