<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
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
	padding:5px 0px 0px 945px;
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
				<tr>
					<td class="check"><input type="checkbox"></td>
					<td class="repId">${rep.rep_id}</td>
					<td class="repedId">${rep.reped_id}</td>
					<td class="date">${rep.rep_date}</td>
					<td class="repCode" data-rep_code="${rep.rep_code}">${rep.rep_code}</td>
					<td class="reason" data-rep_reason="${rep.rep_reason}"><a href="#">내용보기</a></td>
					<td>
						<select style="width:150px;">
							<option>3일</option>
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
	
	$(".repCode").each(function(){
		if($(this).text() == 'SB'){
			$(this).text("게시글");
		}else if($(this).text() == 'SR'){
			$(this).text("댓글");
		}
	})
	
	$("#sanInsertBtn").on('click', function(){
		$(".check").each(function(){
			if($(this).children().is(":checked")==true){
				console.log($(this).parent().children(":eq(2)").text());
				/* $.ajax({
					url:"sanInsert",
					data:{
						user_id:$(this).next().next().text(),
						sanc_code:$(this).next().next().next().next().text(),
						edate:$(this).next().next().next().text(),
						sanc_reason:$(this).next().next().next().next().next().text()
					}
				}) */				
			}
		})
	})
</script>