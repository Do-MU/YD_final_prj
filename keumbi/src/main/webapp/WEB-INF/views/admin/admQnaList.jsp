<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.pagination {
	diplay: block;
}

.pagination>li>a {
	float: none;
}
</style>


<section class="banner_area">
	<div class="box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>고객센터 관리자 페이지</h2>
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
					<tr>
						<td><c:out value="${q.num}" /></td>
						<td><a href="./admQnaView?num=${q.num}"><c:out value="${q.title}" /></a></td>
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
		<li class="page-item">
			<a class="page-link" aria-label="Previous" onclick="prev(${p.pageNo})" id="prev_btn">
				<span aria-hidden="true">&laquo;</span>
			</a>
		</li>
		<c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
			<li class="page-item">
				<a id="page-num-${i}" class="page-link" data-pageNo="${i}">${i}</a>
			</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" aria-label="Next" onclick="next(${p.pageNo})" id="next_btn">
				<span aria-hidden="true">&raquo;</span>
			</a>
		</li>
	</ul>
</div>

<script>
	var totalPage = ${p.totalPage};
	var code = '';
	var pageNo = 1;
	
	// 넘어온 코드 고정
	if('${p.code}'!=''){
		code = '${p.code}';
		$("#sortKey").val("${p.code}").prop("selected",true);
	}
	
	// 옵션 선택
	$("#sortKey").on("change", this ,function(){
		if($(this).val() == ''){
			code = '';
			console.log($(this).val);	
		} else{
			code = $(this).val();
			console.log($(this).val);			
		}
		pageNo = 1;
		change(code, pageNo);
	});
	
	// 페이지 선택
	$(".pagination").on('click', ".page-link", function(){
		pageNo = $(this).text();
		change(code, pageNo);
	});
	
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
		}
		else{
			return false;
		}
	}
	
	function change(code, pageNo){
		var url = 'admQnaList';
		console.log(code);
		if(code != ''){
			url += '?code='+code+"&pageNo="+pageNo;
		}else{
			url += "?pageNo="+pageNo;
		}
		window.location = url;
	}
</script>