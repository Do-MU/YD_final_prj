<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
#board{
	width: 100%;
}
#contents{
	min-height: 300px;
}
#btns{
	width: 100%;
	margin-top: 50px;
}
#btns *{
	margin: 0 10px;
	color: black;
}
#btns *:hover{
	cursor: pointer;
	text-decoration: underline;
}
#reply{
	margin-top: 50px;
}
#re_contents{
	width: 90%;
	height: 50px;
}
#reply form button{
	height: 50px;
	width: 8%;
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
				<c:if test="${loginUser.id ne board.user_id}">
					<a onclick="calls_submit()" style="float: right;">신고</a>
				</c:if>
				<a href="boardList" style="float: right;">목록</a>
				<c:if test="${loginUser.id eq board.user_id}">
					<a href="boardDelete?bod_num=${board.bod_num}" onclick="return confirm('정말로 삭제하시겠습니까?')" style="float: right;">삭제</a>
					<a href="boardUpdateForm?bod_num=${board.bod_num}" style="float: right;">수정</a>
				</c:if>
			</div>
		</div>

		<div id="reply">
			<div>
				<h4>댓글</h4>
			</div>
			<div>
				<form name=replyInsertForm action="/boardView/replyInsert" method="post">
					<input type="hidden" name="bod_num" value='${board.bod_num}'>
					<input id="re_contents" name="re_contents">
					<button type="button" class="btn btn-primary" name=replyInsertBtn style="float: right;" onclick="return confirm('댓글을 등록하시겠습니까?')">등록</button>
				</form>
			</div>
		</div>
		

		<br> <br>

		<div class="container">
			<div class="row">
				<form>
					<hr>
					<div class="replyList" id="replyList" style="width: 1150px;"></div>
				</form>
			</div>
		</div>

	</div>

</section>


<br>
<br>
<br>
<br>

<script>
	
	function calls_submit() {
		if(confirm("신고하시겠습니까?"))
		frm.submit();
	} 
	
	function callss_submit() {
		if(confirm("신고하시겠습니까?"))
		frmm.submit();
	}
	
	</script>


<script>
	
	var bod_num = '${view.bod_num}'; //게시글 번호 
	$('[name=replyInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시     
		var insertData = $('[name=replyInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴    
		replyInsert(insertData); //Insert 함수호출(아래)});
	})
		
	//댓글 목록 
	function replyList(){
	    $.ajax({
	        url : 'replyList',       
			type : 'get', 
			async : false,       
			data : {'bod_num' : bod_num},       
			success : function(data){            
				var a ='';  
				$(".replyList").empty();           
				$.each(data, function(key, value){
	                 	
					 var user = '';
					 
					 if('${loginUser.id}'== value.user_id){
					 
						 user =	`<button type="button" class="btn btn-outline-dark" onclick="replyDelete('\${value.re_num}');" style="float: right;"> 삭제 </button>
					 			 <button type="button" class="btn btn-outline-info" onclick="replyUpdate('\${value.re_num}','\${value.re_contents}');" style="float: right;"> 수정 </button>`					 							  		  					 								 
					 
				     }					 					 
						          
      				 a += `<div class="commentinfo\${value.re_num}">
   						  ∥ 작성자 : \${value.user_id} ∥&nbsp;  날짜 : \${value.re_date} ∥ <div id="check"></div> 
   						  \${user}  <input type="button" id="submit" role="button" class="btn btn-outline-danger" onclick="callss_submit()" style="float: right;" value="신고">
   						  			<button type="button" class="btn btn-outline-success" onclick="replyOfReply('\${value.re_num}');" style="float: right;"> 댓글 </button>
   						  <div class="re_contents\${value.re_num}">&nbsp;<p>&nbsp; &nbsp;&nbsp;\${value.re_contents}</p></div><hr>`
   						  
						  
   					//대댓글
   					$.each(value.pre_re, function(index, item){
   						
   						var users ='';
   						
   						if('${loginUser.id}'== item.user_id){
   							
   							users = `<button type="button" class="btn btn-outline-dark" onclick="rorDelete('\${item.re_num}');" style="float: right;"> 삭제 </button>
					                 <button type="button" class="btn btn-outline-info" onclick="rorUpdate('\${item.re_num}','\${item.re_contents}');" style="float: right;"> 수정 </button>`							
   							
   						}
   						
   						a += `
							
							<div type="hidden" name="bod_num" class="re_contents\${item.re_num}">
							<div class="commentinfo\${item.re_num}">
							<div class="st">
							↳ &nbsp;&nbsp;&nbsp; ∥ 작성자 : \${item.user_id} ∥&nbsp;  날짜 : \${item.re_date} ∥ <div id="check"></div> \${users}
							<div class="stt">
							<br><p> \${item.re_contents}</p> 				    		   		
						   	</div></div></div></div><hr>`
   					});
				 }); 
				
				 $(".replyList").html(a); 
				                       

				        
			}    
		});
	}
	
	//댓글 등록
	function replyInsert(insertData){
	    $.ajax({
	        url : 'replyInsert',       
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
	
	//대댓글 등록
	function rorInsert(re_num){
		
		var bod_num = '${view.bod_num}';
		var pre_re_num = re_num;
		var re_contents =event.target.parentElement.previousElementSibling.value
		    $.ajax({
		        url : 'rorInsert',       
				type : 'post',        
				data : {bod_num, pre_re_num, re_contents},        
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
		a += `<input type="text" class="form-control" name="re_contents\${re_num}" value="\${re_contents}">
		    <span class="input-group-btn">
	        <button class="btn btn-outline-info" type="button" onclick="replyUpdateProc('\${re_num}');"> 수정 </button>        
	        </span>` 
		
		$('.re_contents'+re_num).html(a);    
	}
	
	//댓글 수정
	function replyUpdateProc(re_num){   
		var updateContent = $('[name=re_contents'+re_num+']').val();  
		//var check = ${'value.Alram'}       		
		$.ajax({
	        url : 'replyUpdate?re_num='+re_num,        
			type : 'post',        
			data : {'re_contents' : updateContent, 're_num' : re_num },        
			success : function(data){
				
	            if(data == 1) replyList(); //댓글 수정후 목록 출력    
				var commentinfo = $('.commentinfo'+ re_num).find('#check').html("(수정됨)");
	
		}    
	});
}

	
	//대댓글 수정 - 대댓글 내용 출력을 input 폼으로 변경 
	function rorUpdate(re_num, re_contents){
		
	    var a ='';        	
		a += `<input type="text" class="form-control" name="re_contents\${re_num}" value="\${re_contents}">
		    <span class="input-group-btn">
	        <button class="btn btn-outline-info" type="button" onclick="rorUpdateProc('\${re_num}');"> 수정 </button>        
	        </span>` 
		
		$('.re_contents'+re_num).html(a);    
	}
	
	//대댓글 수정
	function rorUpdateProc(re_num){   
		var updateContents = $('[name=re_contents'+re_num+']').val();  
		//var check = ${'value.Alram'}       		
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
	
	function replyOfReply(re_num){
		$('.commentinfo'+ re_num).find("#ROR").remove()
		    var a ='';        	
			a += ` <div id="ROR" action="/boardView/rorInsert" name= "rorInsertForm"> <input type="hidden" class="form-control" name="bod_num" value="${view.bod_num}">
				<input name="re_contents" class="form-control"> <span class="input-group-btn">
		        <button class="btn btn-outline-info" type="button" onclick="rorInsert('\${re_num}');"> 댓글달기 </button>        
		        </span>
		        </input></div>` 
			
			$('.re_contents'+re_num).append(a);    
		}

	
	</script>
