<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
		font-weight:bold;
	}
	.div_img{
		flex:2;
	}
	
	
	
	
	/* MODAL style */
	#challengeJoin_modal {
		position: fixed;
	}
	#challengeJoin_modal .modal-body{
		padding: 50px;
	}
	
	/* back btn */
	#challengeJoin_modal .close{
		float:none;
		font-weight: 500;
	}
	#challengeJoin_modal #mod_back_btn{
		font-size: 10px;
		margin-bottom:50px;
	}
	#challengeJoin_modal #mod_back_btn button.close{
		color: 	#0309bf;
		font-weight:bold;
	}
	#challengeJoin_modal #mod_body_top{
		display:flex;
	}
	#challengeJoin_modal #mod_chal_title{
		flex:3;
		font-size: 35px;
		font-weight: bold;
	}
	#challengeJoin_modal #mod_chal_date{
		font-size:1.2em;
		font-weight:bold;
	}
	#challengeJoin_modal #mod_chal_user{
		font-size:1.2em;
		font-weight:bold;
	}
	#challengeJoin_modal #mod_chal_cont{
		margin: 20px 0 10px;
		font-size:1.2em;
	}
	#challengeJoin_modal #mod_chal_top3{
		margin-top:30px;
	}
	#challengeJoin_modal #mod_goalTitle{
		margin-top:30px;	
	}
	#challengeJoin_modal #mod_goal{		
		text-align:center;
	}
	
	#challengeJoin_modal #mod_goal > div{		
		text-align:center;
		font-size:1.3em;
		font-weight:bold;
	}
	
	/* Slider */
	#challengeJoin_modal #slider{
		width:50%;
	}
	#challengeJoin_modal #goal_price{
		width:50%;
		display:flex;
		margin:0 auto;
	}
	#challengeJoin_modal #goal_min{
		flex:1;
		text-align:left;
		font-size:1.1em;
		font-weight:bold;
	}
	#challengeJoin_modal #goal_now{
		flex:1;
		font-size:1.1em;
		font-weight:bold;
	}
	#challengeJoin_modal #goal_max{
		flex:1;
		text-align:right;
		font-size:1.1em;
		font-weight:bold;
	}
	
	#challengeJoin_modal #challengeJoinBtn{
		width:100%;
	}
	
	#msg_popup .modal-body{
		height: 250px;
		background-color: #F2F2F2;
	}
	
	#msg_popup .modal-body .div_mod_content{
		padding: 50px;
		font-size: 20px;
	}
	
	#btn_confirm,
	#btn_alert{
		width:100%;
		text-align:right;
		position:absolute;
		bottom:30px;
		right:30px;
	}
	.bi-exclamation-octagon-fill,
	.bi-info-circle-fill{
		color:red;
		font-size: 1.5em;
	}
	.swal-modal {
    width: 550px;
    height: 300px;
    text-align-last: center;
	}
	.swal-text:first-child {
	    margin-top: 60px;
	}
	.swal-text {
		font-size: 30px;
		color: black;
		margin-top: 20px;
	}
	.swal-footer {
		margin-top: 20px;
	}
	.swal-button {
		width: 480px;
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
						<div></div>
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
						<div id="mod_chal_date">목표기간 : 1개월</div>
						<div id="mod_chal_user">도전자 : 100명</div>
						
						<div id="mod_chal_top3">
							<h3>월 평균 소비 TOP3</h3>
							<p></p>
						</div>
						
						<div id="mod_goalTitle">
							<h3>목표금액</h3>
						</div>
						<div id="mod_goal">
							<div>추천</div>
							<input id="slider" type="range" min="0" max="0"><br>
							<div id="goal_price">
								<div id="goal_min">0</div>
								<div id="goal_now">0</div>
								<div id="goal_max">0</div>
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
		
		<!-- ALERT/CONFIRM MODAL -->
		<div class="modal" id="msg_popup" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
		    <div class="modal-dialog modal-dialog-centered" role="document">
		        <div class="modal-content">
		        
		            <div class="modal-body">
		            	<div class="div_mod_content"></div>
			            <div class="div_btn_confirm" id="btn_confirm">
			                <button type="button" id="confirm_no"class="btn btn-secondary" data-dismiss="modal">취소</button>
			                <button type="button" id="confirm_yes" class="btn btn-primary" data-dismiss="modal" >도전하기</button>
			            </div>
			            <div class="div_btn_alert" id="btn_alert">
			                <button type="button" id="alert_ok" class="btn btn-primary" data-dismiss="modal"></button>
			            </div>
		            </div>
		        </div>
		    </div>
		</div>
	
	</div>
</section>
<script>
	$(".challs").each(function(){
		var challengers = $(this).children($(".div_etc")).children().children().eq(2);
		$.ajax({
			url:"challTotalUser",
			data:{chall_num : $(this).children($(".div_title")).children().eq(1).data("chall_num")}
		}).done(function(totalUser){
			challengers.html("- 도전자 : "+ addComm(totalUser) +"명");
		})
	})

	$(".chalbtn").on('click',this,function(){
		$("#challengeJoin_modal").modal("show");
		var chall_num = $(this).data("chall_num");
		var i = 0;
		var allSum = 0;
		$.ajax({
			url:"prdChall",
			data:{ num : chall_num }
		}).done(function(chall){
			// modal 내용 > 클릭된 챌린지 내용으로
			$("#mod_chal_img").attr("src","${pageContext.request.contextPath}/resources/img/challenge_img/"+chall.image);
			$("#mod_chal_title").html(chall.title);
			$("#mod_chal_cont").html("<h3>"+chall.content+"</h3>");
			
			$.ajax({
				url:"challTotalUser",
				data:{chall_num : chall_num}
			}).done(function(totalUser){
				$("#mod_chal_user").html("도전자 : " + addComm(totalUser) + "명");				// 챌린지-유저 테이블 count
			});
			$("#mod_chal_top3").html("<h3>월 평균 소비 TOP 3</h3>");
			$.ajax({
				url:"prdChalltransList",
				data:{ category : chall.category,
					   user_id : "${loginUser.id}" }
			}).done(function(list){
				for(vo of list){					// 지출내역 테이블 >> userId + 챌린지키워드 or 검색키워드 >> 금액 합계 >> 확장 for문 사용
					if(i<3){						// 3개 출력시 stop
						$("<div>").html((i+1) + ". " + vo.content + '  ' + addComm(vo.amt) + "원").appendTo($("#mod_chal_top3"));
					}
					allSum += parseInt(vo.amt);		// 불러온 목록의 전체 금액을 다 더함
					i++;
				}
				allSum = Math.ceil(allSum/1000)*1000;
				
				// slider 초기화
				$("#slider").val(0);
				$("#slider").attr("max", allSum);								// max값 설정
				$("#goal_max").html(addComm($("#slider").attr("max")));			// max값 출력
				$("#slider").val(Math.ceil(allSum/2000)*1000);		// 슬라이드 바 중앙으로
				$("#goal_now").html(addComm($("#slider").val()));				// 하단 금액 추천 금액으로
				$("#slider").attr("step", 1000);								// 금액 단위 조정
				
				if(allSum == 0 || !'${loginUser.id}'){								// 비로그인 / 해당 카테고리 총액이 0일 때 [도전하기] 비활성화
					$("#challengeJoinBtn").removeClass("btn-primary");
					$("#challengeJoinBtn").addClass("btn-secondary");
					$("#challengeJoinBtn").attr("disabled", "disabled");
				}else{
					$.ajax({
						url: "myChallCnt",
						data:{	user_id: '${loginUser.id}',
								chall_num: $("#challengeJoinBtn").data("chall_num")	}
					}).done(function(cnt){
						if(cnt){
							$("#challengeJoinBtn").removeClass("btn-primary");
							$("#challengeJoinBtn").addClass("btn-secondary");
							$("#challengeJoinBtn").attr("disabled", "disabled");
						}else{
							$("#challengeJoinBtn").removeClass("btn-secondary");
							$("#challengeJoinBtn").addClass("btn-primary");
							$("#challengeJoinBtn").removeAttr("disabled");
						}
					});
				}
			});
			
			$("#challengeJoinBtn").data("chall_num", chall_num);				// 도전하기 버튼에 챌린지 번호 부여
			
			
		});
	});
	
	$("#slider").mousemove(function(){
		$("#goal_now").html(addComm(Math.round($("#slider").val())));
	})
	
	// [도전하기] 클릭 시 confirm 모달 open
 	$("#challengeJoinBtn").click(function(){
		$("#msg_popup .modal-body .div_mod_content").html(`<i class="bi bi-exclamation-octagon-fill"></i> `+" 챌린지에 도전하시겠습니까?");
		$("#btn_confirm").removeAttr('hidden');
		$("#btn_alert").attr("hidden","hidden");
		$("#msg_popup").modal("show");
	});
	
	// 도전 선택시 챌린지 INSERT
	$("#confirm_yes").click(function(){
		$("#msg_popup").modal("hide");
		$.ajax({
			url:"challInsert",
			data: { user_id : '${loginUser.id}',
					goal : removeComm($("#goal_now").html()),
					chall_num : $("#challengeJoinBtn").data("chall_num")}
		}).done(function(data){
			if(data == 1){
				$("#msg_popup .modal-body .div_mod_content").html(`<i class="bi bi-info-circle-fill"></i> `+" 챌린지 도전!!");
				$("#btn_alert").removeAttr("hidden");
				$("#alert_ok").text("나의 챌린지로");
				$("#btn_confirm").attr("hidden", "hidden");
				$("#msg_popup").modal("show");
				$("#alert_ok").addClass("moveToChall");
			}
		});
	});
	
	$("#msg_popup").on('click', 'button.moveToChall', function(){
		$(location).attr("href","challengeList");
	});
	
	$("#msg_popup").on('click', '#alert_ok', function(){
		$("#challengeJoin_modal").modal("hide");
	});
	
	function addComm(num){
		return num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
	function removeComm(num){
		return num.replace(/,/g, "");
	}
</script>