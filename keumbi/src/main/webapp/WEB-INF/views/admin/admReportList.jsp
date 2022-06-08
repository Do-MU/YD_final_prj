<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.container{
	text-align:center;
}

table{
	margin:0 auto;
	width:90%;
	border:1px solid;
	table-layout:fixed;
}

th{
	border:1px solid;
	background-color:#e9ecef;
}

td{
	border:1px solid;
}

.reason{
	height:35px;
	text-overflow:ellipsis;
	overflow:hidden;
	white-space : nowrap;
}

#btn_div{
	padding:5px 0px 0px 880px;
}
.swal-text{
	font-size: 25px;
	margin-top: 20px;
}
.swal-footer{
	text-align: center;
	margin-top: 5px;
}
.swal-button{
	width: 400px;
}
</style>
<div class="container">
	<h1>신고목록</h1>
	<table>
		<thead>
			<tr>
				<th width="50px;">#</th>
				<th>신고자</th>
				<th>제재대상</th>
				<th>신고일자</th>
				<th>종류</th>
				<th>내용</th>
				<th>정지일수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="rep" items="${reportList}">
				<tr data-rep_num="${rep.rep_num}">
					<td><input type="checkbox" class="check"></td>
					<td class="repId">${rep.rep_id}</td>
					<td class="repedId">${rep.reped_id}</td>
					<td class="date">${rep.rep_date}</td>
					<td class="repCode" data-rep_code="${rep.rep_code}">${rep.rep_code}</td>
					<td class="reason" data-rep_reason="${rep.rep_reason}"><a href="#">내용보기</a></td>
					<td>
						<select class="sanDate" style="width:150px;">
							<option selected>3일</option>
							<option>7일</option>
							<option>14일</option>
							<option>30일</option>
						</select>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div id="btn_div">
		<button type="button" id="deleteBtn" class="btn btn-danger">삭제</button>
		<button type="button" id="sanInsertBtn" class="btn btn-primary active">저장</button>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="reasonModal" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">신고 내용</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <div class="modal-body">
	      </div>
	    </div>
	  </div>
	</div>
</div>
<script>
	// 제재 내용
	$(".reason a").on('click', function(){
		$.ajax({
			url:"repReason",
			data:{
				rep_code:$(this).parent().prev().data("rep_code"),
				rep_reason:$(this).parent().data("rep_reason")
			}
		}).done(function(data){
			$(".modal-body").html(data);
		})
		$("#reasonModal").modal("show");
	})
	
	// 제재 종류
	$(".repCode").each(function(){
		var num = $(this).parent().find(".reason").data("rep_reason");
		if($(this).text() == 'SB'){
			$(this).text("게시글 #" + num);
		}else if($(this).text() == 'SR'){
			$(this).text("댓글 #" + num);
		}
	})
	
	// 저장 버튼
	$("#sanInsertBtn").on('click', function(){
		$(".check:checked").each(function(){
			$.ajax({
				url:"sanInsert",
				data:{
					user_id:$(this).closest("tr").find(".repedId").text(),
					sanc_code:$(this).closest("tr").find(".repCode").data("rep_code"),
					edate:$(this).closest("tr").find(".sanDate").val().slice(0, -1),
					rep_reason:$(this).closest("tr").find(".reason").data("rep_reason"),
					sanc_reason:$(".modal-body").html()
				}
			}).done(function(data){
				if(data == 1){
					//alert(data + "건 처리 되었습니다.");
					swal(data + "건 처리 되었습니다.", {icon: 'success'}).then((value) => {
						window.location.reload();						
					})
				}
			})
		})
	})
	
	// 삭제 버튼
	$("#deleteBtn").on('click', function(){
		$(".check:checked").each(function(){
			console.log($(this).closest("tr").data("rep_num"));
			$.ajax({
				url:"reportDelete",
				data:{
					rep_code:$(this).closest("tr").find(".repCode").data("rep_code"),
					rep_reason:$(this).closest("tr").find(".reason").data("rep_reason"),
					rep_num:$(this).closest("tr").data("rep_num")
				}
			}).done(function(data){
				if(data != null){
					//alert(data + "건 처리 되었습니다.");
					swal(data + "건 처리 되었습니다.", {icon: 'success'}).then((value) => {
						window.location.reload();						
					})
				}
			})
		})
	})
</script>