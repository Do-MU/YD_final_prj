<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.st {
	margin-left: 70px;
}

.stt {
	margin-left: 50px;
}

.table td {
	padding: 20px;
}

#board {
	width: 100%;
}

#contents {
	min-height: 300px;
}

#btns {
	width: 100%;
	margin-top: 50px;
}

#btns * {
	margin: 0 10px;
	color: black;
}

#btns *:hover {
	cursor: pointer;
	text-decoration: underline;
}

#reply {
	margin-top: 50px;
}

.re_btns {
	float: right;
}

.re_btns * {
	margin: 0 10px;
	color: black;
}

.re_btns a:hover {
	cursor: pointer;
}

.replycontents {
	padding: 10px 0 10px 20px;
}
.ror{
	padding: 10px 0 10px 50px;
}
.ror_contents{
	padding-left: 50px;
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
   width: 212px;
}
.swal-button--confirm{
   width: 440px;
}
.swal-button--danger{
   width: 212px;
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>커뮤니티</h2>
					<div class="page_link">
						<a href="home">Home</a> <a href="boardList">커뮤니티</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div class="row">
			<div id="board">
				<h2>${board.title}</h2>
				<h4>${board.user_id} | ${board.wdate }</h4>
				<hr>
				<div id="contents">
					<pre>${board.contents}</pre>
				</div>
				<h3>태그</h3>
				<hr>
				<c:forEach var="t" items="${tags}">
					#${t.val}&nbsp;&nbsp;&nbsp;
				</c:forEach>
			</div>

			<div id="btns">
				<c:if test="${not empty loginUser.id}">
					<c:if test="${loginUser.id ne board.user_id}">
						<a onclick="reportBoard()" style="float: right;">신고</a>
					</c:if>
					<c:if test="${loginUser.id eq board.user_id}">
						<a  onclick="return swal('정말로 삭제하시겠습니까?', {buttons: true,dangerMode: true,closeOnClickOutside: false}).then((value) => 
						{if(value){window.location='boardDelete?bod_num=${board.bod_num}'}})" style="float: right;">삭제</a>
						<a href="boardUpdateForm?bod_num=${board.bod_num}" style="float: right;">수정</a>
					</c:if>
				</c:if>
				<a href="boardList" style="float: right;">목록</a>
			</div>
		</div>
		<div id="reply">
			<div><h4>댓글</h4></div>
			<c:if test="${loginUser ne null && loginUser.user_code eq 'U1'}">
				<div class="input-group mb-3">
					<input type="text" id="re_contents" class="form-control" name="re_contents">
	            	<button class="btn btn-primary" type="button" id="replyInsertBtn">등록</button>
	          	</div>
			</c:if>
			
			<div>
				<form>
					<hr>
					<div class="replyList" id="replyList" style="width: 100%;"></div>
				</form>
			</div>
		</div>

	</div>

</section>

<script>
	function reportBoard() {
		swal("게시물을 신고하시겠습니까?", {
			icon: "warning",
			buttons: true,
			dangerMode: true,
			closeOnClickOutside: false
		}).then((value) => {
			if(value){
				$.ajax({
					url:"reportBoard",
					data:{rep_reason:${board.bod_num}}
				}).done(function(data){
					if(data==1){
						//alert("신고처리 완료되었습니다.");		
						swal("신고처리 완료되었습니다.", {icon: 'success'});
					}else{
						//alert("이미 신고처리 되었습니다.");
						swal("이미 신고처리 되었습니다.", {icon: 'error'});
					}
				});
			}else{
				swal("신고를 취소하셨습니다.", {icon: "success"});
			}
		})
	}
	function reportReply(re_num) {
		swal("댓글을 신고하시겠습니까?",{
			icon: "warning",
			buttons: true,
			dangerMode: true,
			closeOnClickOutside: false
		}).then((value) => {
			if(value){
				$.ajax({
					url:"reportReply",
					data:{rep_reason:re_num}
				}).done(function(data){
					if(data==1){
						//alert("신고처리 완료되었습니다.");					
						swal("신고처리 완료되었습니다.", {icon: 'success'});
					}else{
						//alert("이미 신고처리 되었습니다.");
						swal("이미 신고처리 되었습니다.", {icon: 'error'});
					}
				});
			}else{
				swal("신고를 취소하셨습니다.", {icon: "success"});
			}
		})
	}
	
	$('#replyInsertBtn').click(function(){ 		//댓글 등록 버튼 클릭시   
		replyInsert($("#re_contents").val()); 	//Insert 함수호출(아래)});
	})
		
	//댓글 목록 
	function replyList(){
	    $.ajax({
	        url : 'replyList',
			data : {bod_num : ${board.bod_num}},       
			success : function(data){
				var a ='';  
				$("#replyList").empty();           
				$.each(data, function(key, value){
					 var user = '';
					 if('${loginUser.id}' != ''){
						 if('${loginUser.id}'== value.user_id){
							user =	`<a onclick="replyDelete('\${value.re_num}');" style="float: right;"> 삭제 </a>
						 			 <a onclick="replyUpdate('\${value.re_num}','\${value.re_contents}');" style="float: right;"> 수정 </a>`;
					     }else{
					    	 user = `<a onclick="reportReply('\${value.re_num}')" style="float: right;">신고</a>`;
					     }
						 if('${loginUser.user_code}' == 'U1'){
							 user += `<a onclick="replyOfReply('\${value.re_num}');" style="float: right;"> 답글 </a>`;
						 }
					 }
      				 a += `<div class="replies\${value.re_num}" data-re_num="\${value.re_num}">\${value.user_id} | \${value.re_date}
   						  	  <div class="replycontents replycontents\${value.re_num}">\${value.re_contents}
   						  	  	<div class="re_btns">\${user}
   						  	  	</div>
   						  	  </div>
   						   </div>
   						   <hr>`;
   						   
   					//대댓글
   	   				$.each(value.pre_re, function(index, item){
						var users ='';
		   	   			if('${loginUser.id}' != ''){
							if('${loginUser.id}'== item.user_id){
								users =	`<a onclick="replyDelete('\${item.re_num}');" style="float: right;"> 삭제 </a>
							 			 <a onclick="replyUpdate('\${item.re_num}','\${item.re_contents}');" style="float: right;"> 수정 </a>`;
						     }else{
						    	users = `<a onclick="reportReply('\${item.re_num}')" style="float: right;">신고</a>`;
						     }					 
						 }
		   	  				
		   				 a += ` 	<div class="ror ror\${item.re_num}" data-re_num="\${item.re_num}">
		   				 				<i class="bi bi-arrow-return-right"></i> \${item.user_id} | \${item.re_date}
		   	  					  	  	<div class="replycontents replycontents\${item.re_num}">\${item.re_contents}
		   	   					  	  		<div class="re_btns">\${users}
		   	   					  	  		</div>
		   	   					  	  	</div>
		   	   					   	</div>
		   						   	<hr>`;
					})
					$("#replyList").html(a);
				})
			}
		});
	}
	
	//댓글 등록
	function replyInsert(contents){
		if(contents != ''){
			$.ajax({
				url : 'replyInsert',       
				type : 'post',        
				data : {bod_num: ${board.bod_num},
						re_contents: contents},
				success : function(data){            
					if(data == 1) {                
						replyList(); //댓글 작성 후 댓글 목록 reload                
						$("#re_contents").val('');
					}        
				}    
			});
		}else{
			$("#re_contents").focus();
		}
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function replyUpdate(re_num, re_contents){
		$('.replies'+re_num).next(".ror_contents").remove();
	    var a ='';        	
		a += `	<div class="input-group mb-3">
	            	<input type="text" id="re_contents\${re_num}" value="\${re_contents}" class="form-control">
	            	<button class="btn btn-primary" type="button" onclick="replyUpdateProc('\${re_num}');">수정</button>
	          	</div>`
		
		$('.replycontents'+re_num).html(a);    
	}
	
	//댓글 수정
	function replyUpdateProc(re_num){   
		var updateContent = $('#re_contents'+re_num).val();
		$.ajax({
	        url : 'replyUpdate?re_num='+re_num,        
			type : 'post',        
			data : {'re_contents' : updateContent, 're_num' : re_num },        
			success : function(data){
	            if(data == 1) replyList(); //댓글 수정후 목록 출력
			}    
		});
	}
	
	//댓글 삭제 
	function replyDelete(re_num){
		 $.ajax({
	        url : 'replyDelete?re_num='+re_num,        
			type : 'post',
			success : function(data){            
				if(data == 1) replyList(); //댓글 삭제후 목록 출력         
			}    
		});
	}
	
	//답글달기 창
	function replyOfReply(re_num){
		$('.replies'+re_num).find(".re_btns").children(":last-child").removeAttr('onclick');
		var a ='';        	
		a += ` 	<div class="input-group mb-3 ror_contents">
					<i class="bi bi-arrow-return-right"></i>
		           	<input type="text" id="re_contents\${re_num}" class="form-control">
		           	<button class="btn btn-primary" type="button" onclick="rorInsert('\${re_num}');">답글달기</button>
		       	</div>`
		$('.replies'+re_num).after(a);
	}
	
	//대댓글 등록
	function rorInsert(re_num){
		replyList();
		var bod_num = ${board.bod_num};
		var pre_re_num = re_num;
		var re_contents = $('#re_contents'+re_num).val();
		if(re_contents != ''){
			$.ajax({
			    url : 'rorInsert',       
				type : 'post',        
				data : {bod_num, pre_re_num, re_contents},        
				success : function(data){
					if(data == 1) {
						replyList(); //댓글 작성 후 댓글 목록 reload
					}        
				}    
			});
		}else{
			$('[name=re_contents'+re_num+']').focus();
		}
	}
	
	//대댓글 수정 - 대댓글 내용 출력을 input 폼으로 변경 
	function rorUpdate(re_num, re_contents){
	    var a ='';        	
		a += `<input type="text" class="form-control" id="re_contents\${re_num}" value="\${re_contents}">
		    <span class="input-group-btn">
	        <button class="btn btn-outline-info" type="button" onclick="rorUpdateProc('\${re_num}');"> 수정 </button>        
	        </span>` 
		
		$('.re_contents'+re_num).html(a);    
	}
	
	//대댓글 수정
	function rorUpdateProc(re_num){   
		var updateContents = $('#re_contents'+re_num).val();
		$.ajax({
	        url : 'rorUpdate?re_num='+re_num,        
			type : 'post',        
			data : {'re_contents' : updateContents, 're_num' : re_num },        
			success : function(data){
	            if(data == 1) replyList(); //댓글 수정후 목록 출력    
				var commentinfo = $('.commentinfo'+ re_num).find('#check').html("(수정됨)");
	
			}    
		});
	}
		
	//대댓글 삭제
	function rorDelete(re_num){
		 $.ajax({
	        url : 'rorDelete?re_num='+re_num,
			type : 'post',        
			success : function(data){            
				if(data == 1) replyList(); //댓글 삭제후 목록 출력         
			}    
		});
	}

	
	$(document).ready(function(){
	    replyList(); //페이지 로딩시 댓글 목록 출력 
	});
	</script>
