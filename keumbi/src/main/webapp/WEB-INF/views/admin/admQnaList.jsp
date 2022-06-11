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
#sortKey {
	margin : 0px 0px 20px 0px;

}
table {
	table-layout:fixed;
	margin-top:100px;
}
th {
	background-color: #eeeeee; 
	text-align: center;
}
.th1, .td1 {
	width : 70px;
}
.th2, .td2 {
	width : 500px;
}
.th3, .td3 {
	width : 150px;
}
.th4, .td4 {
	width : 150px;
}
.th5, .td5 {
	width : 200px;
}
.th6, .th6 {
	width : 100px;
}
.pin:hover{
	cursor:pointer;
}
</style>


<div class="pagetitle">
	<h1>고객센터</h1>
</div>

<div class="container">
	<!-- 답변완료/미답변 Select -->
	<div>
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
					<th class="th1">번호</th>
					<th class="th2">제목</th>
					<th class="th3">작성자</th>
					<th class="th4">ID</th>
					<th class="th5">작성일</th>
					<th class="th6">답변유무</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="q" items="${qnas}">
					<tr>
						<td class="td1"><c:out value="${q.num}" /></td>
						<td class="td2"><a href="./admQnaView?num=${q.num}"><c:out
									value="${q.title}" /></a></td>
						<td class="td3"><c:out value="${q.name}" /></td>
						<td class="td4"><c:out value="${q.user_id}" /></td>
						<td class="td5"><c:out value="${q.qdate}" /></td>
						<td class="td6"><c:out value="${q.val}" /></td>
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
		</a></li>
		<c:forEach begin="${p.startPage}" end="${p.endPage}" var="i">
			<li class="page-item pin">
			<a id="page-num-${i}" class="page-link" onclick="changePage(${i})">${i}</a></li>
		</c:forEach>
		<li class="page-item"><a class="page-link" aria-label="Next" onclick="next(${p.pageNo})" id="next_btn"> 
		<span aria-hidden="true">&raquo;</span>
		</a></li>
	</ul>
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
		change();
	});
	
	// 페이지 선택
	function changePage(n){
		pageNo = n;
		change();
	}
	
	document.getElementById("page-num-"+${p.pageNo}).style = "background-color: blue; color: white";
	
	// 이전페이지 > 21~30 페이지 사이일 때 20페이지로
	// 마지막 페이지일때 next btn disable
	if(${p.pageNo} <= 10){
		$("#prev_btn").css("cursor","default");
		$("#prev_btn").css("background-color","#dee2e6");
	}      
	function next(n){
		if(${p.pageNo} < parseInt(totalPage/10)*10){
			pageNo = ((parseInt((n-1)/10)+1)*10)+1;
			change();
		}else{
			return false;
		}
		
	}
	// 다음페이지 > 1~10 페이지 사이일 때 11페이지로
	// 첫 페이지일때 prev btn disable
	if(${p.startPage} == ((parseInt((totalPage - 1) / 10)) * 10 + 1) ){
		$("#next_btn").css("cursor","default");
		$("#next_btn").css("background-color","#dee2e6");
	}
	function prev(n){
		if(${p.pageNo} > 10){
			pageNo = ((parseInt((n-1)/10)-1)*10)+1;
			change();
		}
		else{
			return false;
		}
	}
	
	function change(){
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