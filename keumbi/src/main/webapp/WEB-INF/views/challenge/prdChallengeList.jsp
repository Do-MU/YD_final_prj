<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	section{
		text-align : center;
	}
	
	.modal-body{
		padding-bottom:50px;
	}
	
	.con{
		display:flex;
		justify-content: center;
		padding-top:20px;
	}

	#challenge_title{
		padding-top:100px;
	}
	
	
	#challenge_con{
		display:inline-block;
		width:500px;
	}
	
	#challengeJoinBtn{
		width:500px;
	}

	#slider{
		width:200px;
	}
	
	#min_price{
		position:relative;
		right:50px;
	}

	#max_price{
		position:relative;
		left:60px;
	}
	
	#goal_price{
		position:relative;
		left:20px;
	}
	
	#goal_price_title, #top3{
		padding-top:30px;
		padding-bottom:20px;
	}
	

</style>
<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>챌린지 목록</h2>
					<div class="page_link">
						<a href="home">Home</a> <a href=""></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section>
	<c:forEach var="prd" items="${prdChall }">
		<div id="challenge_title">
			<span>${prd.title }</span>
			<span><button class="joinBtn" style="height:30px; width:30px; background-color:white; border:0; font-size:3em">></button></span>
		</div>
		<div class="con">
			<div id="challenge_con">
				<span>${prd.content }</span><br>
				<span>목표기간 : 1개월</span><br>
				<span>도전자 : 100명</span>
			</div>

			<div>
				<img src="resources/img/favicon.png" style="height: 100px; width:100px;">
			</div>
		</div>
		<input type="hidden" id="prdNum" data-chall_num ='${prd.num}'>
	</c:forEach>
	
	<div class="modal fade" id="challengeJoin_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">챌린지 가입하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div>
						<span><button style="height:30px; width:30px; background-color:white; border:0; font-size:3em"><</button></span>
						<span>다른 챌린지 보러가기</span>
					</div>
					<div>
						<img src="resources/img/favicon.png" style="height: 100px; width:100px;">
						<span>챌린지 제목</span>
					</div>
					<div>
						<span>도전자 : 100명</span>
					</div>
					<div>
						<span>목표기간 : 1개월</span>
					</div>
					<div id="top3">
						<h3>월 평균 소비 TOP3</h3>
						<span>1.메가커피 동성로점 10000원</span><br>
						<span>2.메가커피 동성로점 10000원</span><br>
						<span>3.메가커피 동성로점 10000원</span>
					</div>
					<div id="goal_price_title">
						<h3>목표금액</h3>
					</div>
					<div>
						<span>추천</span><br><br>
						<input id="slider" type="range" min="0" max="18000"><br>
						<span id="min_price">0</span>
						<span id="goal_price">10000</span>
						<span id="max_price">100000</span>
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" id="challengeJoinBtn" class="btn btn-primary">도전하기</button>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(".joinBtn").click(function(){
		$("#challengeJoin_modal").modal("show");
	})
	
	
	$("#slider").mousemove(function(){
		$("#goal_price").html($("#slider").val());
		$("#slider").attr("step", $('#slider').attr('max')/100);
	})
	
 	$("#challengeJoinBtn").click(function(){
		var result = confirm("정말로 도전하시겠습니까?"); 
 		if(result){
 			console.log($("#goal_price").html());
 			console.log($("#prdNum").data("chall_num"));
			$("#challengeJoin_modal").modal("hide");
			$.ajax({
				url:"challInsert",
				data: {
					goal : $("#goal_price").html(),
					chall_num : $("#prdNum").data("chall_num")
				}
			}).done(function(data){
				
			})
 		}
	})
	
</script>	