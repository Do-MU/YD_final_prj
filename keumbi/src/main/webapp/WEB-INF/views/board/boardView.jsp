<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>뷰</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

</style>

</head>
<body>
<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>게시판 보기</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
<br>
<br>

<!-- <script>
function goUp(){
	
console.log($("#user_id").val());
 
 $frm =  $("#id");
 $frm.attr("action","boardUpdate");
 $frm.attr("target","_self");
 $frm.submit(); 
 
 }
</script>  -->
<div class="container">
	<div class="row">
	<form id="id" name="id" method="post" style="width:1180px; text-align:center;">
		<%-- <input type="hidden" id="user_id" name="user_id" value="${list}"> --%>
		

		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd ">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center; height: 50px;"><strong>${view.user_id}</strong>님의 &nbsp 게시글</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2" >${view.wdate }</td>
					</tr>
					<tr>
						<td style="width: 20%; ">글 제목</td>
						<td colspan="2">${view.title }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;">${view.contents }</td>						
					</tr>
					<tr>
						<td>해시태그</td>
						<td colspan="2" style="text-align: center;" id="Hash"></td>
					</tr>
				</tbody>
			</table>
			<a href="boardList" role="button" class="btn btn-outline-info" style="float: right;">목록보기</a>
			<%-- <c:if test="${author eq 'admin'}">	 --%>		
			<%-- <c:if test="${sessionScope.loginUser == view.user_id}">	 --%>
			<c:if test="${loginUser.id eq view.user_id}">
				<!-- <a href="noticeUpdate.do" class="btn btn-primary">수정</a>
				<a href="noticeDelete.do" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')"  class="btn btn-primary">삭제</a>  -->
				<!-- <button role="button" class="btn btn-outline-info" onclick="goUp()" style="float: right;">수정</button> -->
				<a href="delete?bod_num=${view.bod_num}" role="button" class="btn btn-outline-info pull-right delete_btn"  onclick="return confirm('정말로 삭제하시겠습니까?')" style="float: right;">삭제</a>
				<a href="updateForm?bod_num=${view.bod_num}" role="button" class="btn btn-outline-info" style="float: right;" onclick="return confirm('수정페이지로 이동하시겠습니까?')">수정</a>
				<%-- <button role="button" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')" formaction="./boardDelete?id=${view.user_id }" class="btn btn-outline-info pull-right delete_btn" style="float: right;">삭제</button> --%>
			</c:if>
			<%-- </c:if> --%>
	</form>
	</div>
	</div>
	
	<br>
	<br>
	<br>
	<br>
	
	<div class="container">
	<div class="row">
		<h5 class="card-header" style="height: 150px;">댓글</h5>
		<div class="card-body">
			<form name=replyInsertForm action="/replyInsert" method="post" autocomplete="off">
				<div class="form-group">
					<input type="hidden" name="bod_num" />
					<textarea name=re_contents class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary" name=replyInsertBtn style="float: right;">등록</button>
			</form>
		</div>
	</div>
	
	<div class="replyList"></div>
	
	</div>
		

	
	<br>
	<br>
	<br>
	<br>
	
	<script type="text/javascript">
	
	var code = document.getElementById('tag-list').dataset.code;
	
	</script>
	
	<script>
	
	var bod_num = '${view.bod_num}'; //게시글 번호 
	$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시     
		var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴    
		replyInsert(insertData); //Insert 함수호출(아래)});
	
	//댓글 목록 
	function replyList(){
	    $.ajax({
	        url : '/boardView/replyList,       
			type : 'get',        
			data : {'re_num':re_num},       
			success : function(data){            
				var a ='';             
				$.each(data, function(key, value){
	                 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';                
					 a += '<div class="commentInfo'+value.re_num+'">'+'댓글번호 : '+value.re_num+' / 작성자 : '+value.user_id;                
					 a += '<a onclick="commentUpdate('+value.re_num+',\''+value.re_contents+'\');"> 수정 </a>';                
					 a += '<a onclick="commentDelete('+value.re_num+');"> 삭제 </a> </div>';               
					 a += '<div class="commentContent'+value.re_num+'"> <p> 내용 : '+value.re_contents +'</p>';                
					 a += '</div></div>';           
				 });                        
				
				 $(".replyList").html(a);        
			}    
		});
	}
	
	//댓글 등록
	function replyInsert(insertData){
	    $.ajax({
	        url : '/boardView/replyInsert',       
			type : 'post',        
			data : insertData,        
			success : function(data){            
				if(data == 1) {                
					replyList(); //댓글 작성 후 댓글 목록 reload                
					$('[name=re_contents]').val('');            
					}        
				}    
			});
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function replyUpdate(re_num, re_contents){
	    var a ='';        
	
		a += '<div class="input-group">';    
		a += '<input type="text" class="form-control" name="re_contents_'+re_num+'" value="'+re_contents+'"/>';    
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="replyUpdate('+re_num+');">수정</button> </span>';    
		a += '</div>';        
		
		$('.re_contents'+re_num).html(a);    
		
	}
	
	//댓글 수정
	function commentUpdateProc(cno){    
		var updateContent = $('[name=re_contents_'+re_num+']').val();        
		
		$.ajax({
	        url : '/boardView/replyUpdate',        
			type : 'post',        
			data : {'re_contents' : updateContent, 're_num' : re_num},        
			success : function(data){
	            if(data == 1) replyList(re_num); //댓글 수정후 목록 출력         
		}    
	});
}

	//댓글 삭제 
	function replyDelete(re_num){
		 $.ajax({
	        url : '/boardView/replyDelete/'+re_num,        
			type : 'post',        
			success : function(data){            
				if(data == 1) replyList(re_num); //댓글 삭제후 목록 출력         
			}    
		});
	}

	
	$(document).ready(function(){
	    replyList(); //페이지 로딩시 댓글 목록 출력 
	});

	
	</script>
		
	
</body>
</html>