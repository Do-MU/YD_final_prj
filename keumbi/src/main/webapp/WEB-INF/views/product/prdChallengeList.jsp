<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	/* DIVs style */
	.challs{
		margin-top:100px;
		padding: 50px;
		border : 1px solid #BDBDBD;
		border-radius: 20px;
	}

	.div_title{
		display: flex;
		font-size: 2.3em;
	}
	.chaltitle{
		flex:9;
		color:black;
		font-weight:bold;
	}
	.chalbtn{
		flex:1;
		text-align: right;
	}
	.chalbtn:hover{
		cursor:pointer;
	}
	
	
	.div_cont{
		margin: 10px 0 20px;
		font-size: 1.7em;
	}
	
	
	.div_etc{
		display:flex;
	}
	.div_exp{
		flex:8;
		line-height:50px;
		font-size: 1.3em;
	}
	.div_img{
		flex:2;
	}
	
	
	
	
	/* MODAL style */
	.modal{
		position: fixed;
	}
	.modal-body{
		padding: 50px;
	}
	
	/* back btn */
	.close{
		float:none;
	}
	#mod_back_btn{
		font-size: 10px;
		margin-bottom:50px;
	}
	
	
	#mod_body_top{
		display:flex;
	}
	#mod_chal_title{
		flex:3;
		font-size: 30px;
	}
	#mod_chal_cont{
		margin-bottom: 10px;
		font-size:1.2em;
	}
	#mod_chal_top3{
		margin-top:30px;
	}
	#mod_goalTitle{
		margin-top:30px;	
	}
	#mod_goal{		
		text-align:center;
	}
	
	/* Slider */
	#slider{
		width:50%;
	}
	#goal_price{
		width:50%;
		display:flex;
		margin:0 auto;
	}
	#goal_min{
		flex:1;
		text-align:left;
	}
	#goal_now{
		flex:1;
	}
	#goal_max{
		flex:1;
		text-align:right;
	}
	
	
	#challengeJoinBtn{
		width:100%;
	}
	
	
  }
</style>
<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>챌린지</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="prdChallengeList">챌린지</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
	
		<!-- DIVs -->
		<c:forEach var="prd" items="${prdChall}">
			<div class="challs">
				<div class="div_title">
					<div class="chaltitle">${prd.title }</div>
					<div class="chalbtn" data-chall_num="${prd.num}">
						<i class="bi bi-chevron-right"></i>
					</div>
				</div>
				
				<div class="div_cont">
					<div class="chalcont">${prd.content }</div>
				</div>
				<div class="div_etc">
					<div class="div_exp">
						<div>- 목표기간 : 1개월</div>
						<div>- 도전자 : 100명</div>
					</div>
					<div class="div_img">
						<img src="${pageContext.request.contextPath}/resources/img/challenge_img/${prd.image}" style="height: 150px; width:150px;">
					</div>
				</div>
			</div>
		</c:forEach>
	
	
		<!-- MODAL -->
		<div class="modal fade" id="challengeJoin_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
			<div class="modal-dialog modal-lg" >
				<div class="modal-content">
			
					<!-- MODAL BODY -->
					<div class="modal-body">
						<div id="mod_back_btn">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<i class="bi bi-chevron-left"></i>다른 챌린지 보러가기
							</button>
						</div>
						<div id="mod_body_top">
							<img id="mod_chal_img" src="${pageContext.request.contextPath}/resources/img/challenge_img/delivery.png" height="150px" width="150px">
							<div id="mod_chal_title">챌린지 제목</div>
						</div>
						<div id="mod_chal_cont">문구문구문구문구문구문구문구문구문구문구문구문구문구문구</div>
						<div id="mod_chal_user">도전자 : 100명</div>
						<div>목표기간 : 1개월</div>
						
						<div id="mod_chal_top3">
							<h3>월 평균 소비 TOP3</h3>
						</div>
						
						<div id="mod_goalTitle">
							<h3>목표금액</h3>
						</div>
						<div id="mod_goal">
							<div>추천</div>
							<input id="slider" type="range" min="0" max="10000"><br>
							<div id="goal_price">
								<div id="goal_min">0</div>
								<div id="goal_now">5000</div>
								<div id="goal_max">10000</div>
							</div>
						</div>
					</div>
					
					<!-- MODAL BODY -->
					<div class="modal-footer">
						<button type="button" id="challengeJoinBtn" class="btn btn-primary">도전하기</button>
					</div>
					
				</div>
			</div>
		</div>
	
	</div>
</section>
<script>
	$(".chalbtn").on('click',this,function(){
		$("#challengeJoin_modal").modal("show");
		var chall_num = $(this).data("chall_num");
		$.ajax({
			url:"prdChall",
			data:{ num : chall_num }
		}).done(function(chall){
			console.log(chall);
			$("#mod_chal_img").attr("src","${pageContext.request.contextPath}/resources/img/challenge_img/"+chall.image);
			$("#mod_chal_title").html(chall.title);
			$("#mod_chal_cont").html(chall.content);
			$("#mod_chal_user").html("도전자 : " + 0 + "명");				// 챌린지-유저 테이블 count
			$("#mod_chal_top3").html("");
			for(let i = 1; i < 4; i++){									// 지출내역 테이블 >> userId + 챌린지키워드 or 검색키워드 >> 금액 합계 >> 확장for문 사용
				if(true){												// 3개 출력시 stop
					$("<div>").html(i + ". " + "장소" + "금액" + "원").appendTo($("#mod_chal_top3"));
				}
			}
			// $("#slider").attr("max")									// 불러온 목록의 전체 금액을 다 더하여 max 값으로	
			$("#goal_max").html($("#slider").attr("max"))				// max값 출력
		});
		
		// slider 초기화
		$("#slider").val($('#slider').attr('max')/2);					// 슬라이드 바 중앙으로
		$("#goal_now").html($("#slider").val());						// 하단 금액 추전 금액으로
		$("#slider").attr("step", $('#slider').attr('max')/100);		// 금액 단위 조정
		
	})
	
	$("#slider").mousemove(function(){
		$("#goal_now").html($("#slider").val());
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