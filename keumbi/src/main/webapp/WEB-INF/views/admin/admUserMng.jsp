<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.container {
	text-align: center;
}

table {
	margin: 0 auto;
	width: 90%;
	border: 1px solid;
}

th {
	border: 1px solid;
	background-color: #e9ecef;
}

td {
	border: 1px solid;
}

#user_select {
	height: 30px;
}

#san_select {
	padding-left: 830px;
	padding-right: 0px;
}

#search {
	width: 170px;
}

.input-group {
	padding-top: 100px;
	padding-bottom: 5px;
}

.sanCon {
	width: 300px;
}

.userId {
	width: 250px;
}

.userState {
	width: 150px;
}

.sanDate {
	width: 150px;
}

.trhidden {
	display: none;
}
</style>

<div class="pagetitle">
	<h1>회원관리</h1>
	<ol class="breadcrumb">
		<li class="breadcrumb-item">제재 회원</li>
		<li class="breadcrumb-item">탈퇴예정 회원</li>
	</ol>
</div>
<!-- End Page Title -->
<div class="container">
	<div class="input-group">
		<div id="user_select">
			<select id="selectboxA" style="height: 30px;">
				<option value="all" selected>전체회원</option>
				<option value="U1">일반회원</option>
				<option value="U2">제재회원</option>
				<option value="U3">탈퇴예정회원</option>
			</select>
		</div>
		<div id="san_select">
			<select id="selectboxB" style="height: 30px;">
				<option value="id">아이디</option>
				<option value="sdate">제재일자</option>
			</select>
		</div>
		<input id="searchVal" type="text" placeholder="내용을 입력해주세요.">
		<button id="searchBtn" type="button">검색</button>
	</div>
	<div>
		<table class="sanList table table-striped">
			<thead>
				<tr>
					<th>아이디</th>
					<th>회원상태</th>
					<th class="sanCon">제재내용</th>
					<th class="sanDate">제재일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="allu" items="${allUser}">
					<tr class="userList">
						<td class="userId">${allu.id}</td>
						<td class="userState">${allu.user_alias}</td>
						<td class="sanContent"><a href="#"></a></td>
						<td class="sanDate"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- MODAL -->
	<div class="modal fade" id="sanContent_modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- MODAL BODY -->
				<div class="modal-body">
					<div id="mod_body_top">
						<div id="mod_chal_title">제재 내용</div>
						<hr>
					</div>
					<div id="mod_body_middle"></div>
				</div>

				<!-- MODAL FOOTER -->
				<div class="modal-footer">
					<button type="button" id="modal_close" class="btn btn-primary">확인</button>
				</div>

			</div>
		</div>
	</div>
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
	//제재회원 정보
	$.ajax({
		url:"sanUser"
	}).done(function(list){
		for(sanc of list){
			$(".userId").each(function(){
				var id = $(this);
				if(id.text() == sanc.user_id){
					if(sanc.sanc_code == "SB"){
						id.next().next().children().text("적절하지 않은 게시글");	
					}else if(sanc.sanc_code == "SR"){
						id.next().next().children().text("적절하지 않은 댓글");
					}
					id.next().next().data("sanc_reason", sanc.sanc_reason);
					id.next().next().next().text(sanc.sdate);
				}
			})
		}
	});
	
	//제재 내용
	$(".sanContent a").on('click',this, function(){
		$("#sanContent_modal").modal("show");
		$("#mod_body_middle").html($(this).parent().data("sanc_reason"));
	})
	
	//제재내용 모달창 닫기
	$("#modal_close").click(function(){
		$("#sanContent_modal").modal("hide");	
	})
	
	//회원목록 선택
	$("#selectboxA").on("change",function(){
		$("#selectboxB option:eq(0)").prop("selected", true);
		$("#searchVal").val("");
		var opt = $("#selectboxA option:selected").text();
		$(".trhidden").removeClass("trhidden");
		if(opt != '전체회원'){
			$(".userState").each(function(){
				if($(this).text() != opt){
					$(this).parent().addClass("trhidden");
				}
			})			
		}
	})
	
	//검색
	$("#searchBtn").click(function(){
		$("#selectboxA option:eq(0)").prop("selected", true);
		$.ajax({
			url:"userSearch",
			data:{
				searchOp: $("#selectboxB option:selected").text(),
				searchVal: $("#searchVal").val()
			}
		}).done(function(list){
			$(".userList").addClass("trhidden");
			for(user of list){
				$(".userId").each(function(){
					if($(this).text() == user.ID){
						$(this).parent().removeClass("trhidden");
					}
				})
			}
		})
	})
	
</script>