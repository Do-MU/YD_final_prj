<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.container{
	text-align:center;
}

table{
	margin:0 auto;
	width:90%;
	border:1px solid;
}

th{
	border:1px solid;
	background-color:#e9ecef;
}

td{
	border:1px solid;
}

#user_select{
	padding-left:55px;
	height:30px;
}

#san_select{
	padding-left:550px;
	padding-right:5px;
}

#search{
	width:170px;
}

.input-group{
	padding-top:100px;
	padding-bottom:5px;
}

.sanCon{
	
	width:300px;
}

.userId{
	width:250px;
}

.userState{
	width:150px;
}

.sanDate{
	width:150px;
}

.trhidden{
	display:none;
}
</style>

<div class="container">
	<h1>회원관리</h1>
	<div class="input-group">
		<div id="user_select">
			<select id="selectboxA" style="height:30px;">
				<option value="all" selected>전체회원</option>
				<option value="U1">일반회원</option>
				<option value="U2">제재회원</option>
				<option value="U3">탈퇴예정회원</option>
			</select>
		</div>
		<div id="san_select">
			<select id="selectboxB" style="height:30px;">
				<option value="id">아이디</option>
				<option value="sdate">제재일자</option>
			</select>
		</div>
		<input id="searchVal" type="text" placeholder="내용을 입력해주세요.">
		<button id="searchBtn" type="button">검색</button>
	</div>
	<div>
		<table class="sanList">
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
					<td class="userState">${allu.user_code}</td>
					<td class="sanContent"></td>
					<td class="sanDate"></td>
					<%-- <c:set var="sdate" value="${u.sdate}"/>
					<td><fmt:formatDate value="${sdate}" dateStyle="default"/></td> --%>
				</tr>
			</c:forEach>
		</tbody>
		</table>
	</div>
	<!-- MODAL -->
	<div class="modal fade" id="sanContent_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-lg" >
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
	//제재회원 정보
	$.ajax({
		url:"sanUser"
	}).done(function(list){
		for(sanc of list){		
			$(".userId").each(function(){
				if($(this).text() == sanc.user_id){
					$(this).next().next().text(sanc.sanc_code);
					$(this).next().next().next().text(sanc.sdate);
				}
			})
			//제재내용 모달창 열기
			$(".sanContent").each(function(){
				$(this).click(function(){
					if($(this).text() != ""){
						$("#sanContent_modal").modal("show");
						$("#mod_body_middle").html(sanc.sanc_reason);
					}
				})
			})
		}
	});
	
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