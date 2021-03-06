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
	.h2_disable{
		margin: 90px auto;
		text-align: center;
	}
</style>
<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>?????????</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="prdChallengeList">?????????</a>
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
						<div>- ???????????? : 1??????</div>
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
								<i class="bi bi-chevron-left"></i>?????? ????????? ????????????
							</button>
						</div>
						<div id="mod_body_top">
							<img id="mod_chal_img" src="${pageContext.request.contextPath}/resources/img/challenge_img/delivery.png" height="150px" width="150px">
							<div id="mod_chal_title">????????? ??????</div>
						</div>
						<div id="mod_chal_cont">????????????????????????????????????????????????????????????????????????????????????</div>
						<div id="mod_chal_date">???????????? : 1??????</div>
						<div id="mod_chal_user">????????? : 100???</div>
						
						<div id="mod_chal_top3">
							<h3>??? ?????? ?????? TOP3</h3>
							<p></p>
						</div>
						
						<div id="mod_goalTitle">
							<h3>????????????</h3>
						</div>
						<div id="mod_goal">
							<div>??????</div>
							<input id="slider" type="range" min="0" max="0"><br>
							<div id="goal_price">
								<div id="goal_min"></div>
								<div id="goal_now"></div>
								<div id="goal_max"></div>
							</div>
						</div>
					</div>
					
					<!-- MODAL BODY -->
					<div class="modal-footer">
						<button type="button" id="challengeJoinBtn" class="btn btn-primary">????????????</button>
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
			                <button type="button" id="confirm_no"class="btn btn-secondary" data-dismiss="modal">??????</button>
			                <button type="button" id="confirm_yes" class="btn btn-primary" data-dismiss="modal" >????????????</button>
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
			challengers.html("- ????????? : "+ addComm(totalUser) +"???");
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
			// modal ?????? > ????????? ????????? ????????????
			$("#mod_chal_img").attr("src","${pageContext.request.contextPath}/resources/img/challenge_img/"+chall.image);
			$("#mod_chal_title").html(chall.title);
			$("#mod_chal_cont").html("<h3>"+chall.content+"</h3>");
			
			$.ajax({
				url:"challTotalUser",
				data:{chall_num : chall_num}
			}).done(function(totalUser){
				$("#mod_chal_user").html("????????? : " + addComm(totalUser) + "???");				// ?????????-?????? ????????? count
			});
			$.ajax({
				url:"prdChalltransList",
				data:{ category : chall.category,
					   user_id : "${loginUser.id}" }
			}).done(function(list){
				if(list.length > 0){		// ????????? ????????? ?????? ????????? ?????? ??? 
					$("#mod_chal_top3").html("<h3>??? ?????? ?????? TOP 3</h3>");
					for(vo of list){					// ???????????? ????????? >> userId + ?????????????????? or ??????????????? >> ?????? ?????? >> ?????? for??? ??????
						if(i<3){						// 3??? ????????? stop
							$("<div>").html((i+1) + ". " + vo.content + '  ' + addComm(vo.amt) + "???").appendTo($("#mod_chal_top3"));
						}
						allSum += parseInt(vo.amt);		// ????????? ????????? ?????? ????????? ??? ??????
						i++;
					}
					allSum = Math.ceil(allSum/1000)*1000;
					
					// slider ?????????
					$("#slider").val(0);
					$("#goal_min").html("0");			// max??? ??????
					$("#slider").attr("max", allSum);								// max??? ??????
					$("#goal_max").html(addComm($("#slider").attr("max")));			// max??? ??????
					$("#slider").val(Math.ceil(allSum/2000)*1000);		// ???????????? ??? ????????????
					$("#goal_now").html(addComm($("#slider").val()));				// ?????? ?????? ?????? ????????????
					$("#slider").attr("step", 1000);								// ?????? ?????? ??????
					
					$.ajax({
						url: "myChallCnt",
						data:{	user_id: '${loginUser.id}',
								chall_num: $("#challengeJoinBtn").data("chall_num")	}
					}).done(function(cnt){
						if(cnt){			// ?????? ??????????????????
							$(".h2_disable").remove();
							$("#challengeJoinBtn").removeClass("btn-primary");
							$("#challengeJoinBtn").addClass("btn-secondary");
							$("#challengeJoinBtn").attr("disabled", "disabled");
							$("#mod_chal_top3").attr("hidden","hidden");
							$("#mod_goalTitle").attr("hidden","hidden");
							$("#mod_goal").attr("hidden","hidden");
							$("#mod_chal_user").after($("<div class='h2_disable'>").html("<h2>?????? ???????????? ????????? ?????????.</h2>"));
						}else{
							$(".h2_disable").remove();
							$("#challengeJoinBtn").removeClass("btn-secondary");
							$("#challengeJoinBtn").addClass("btn-primary");
							$("#challengeJoinBtn").removeAttr("disabled");
							$("#mod_chal_top3").removeAttr("hidden");
							$("#mod_goalTitle").removeAttr("hidden");
							$("#mod_goal").removeAttr("hidden");
						}
					});
				}else if(list.length == 0 && '${loginUser.id}'){					// ?????? ???????????? ????????? 0??? ??? [????????????] ????????????
					$(".h2_disable").remove();
					$("#challengeJoinBtn").removeClass("btn-primary");
					$("#challengeJoinBtn").addClass("btn-secondary");
					$("#challengeJoinBtn").attr("disabled", "disabled");
					$("#mod_chal_top3").attr("hidden","hidden");
					$("#mod_goalTitle").attr("hidden","hidden");
					$("#mod_goal").attr("hidden","hidden");

					$("#mod_chal_user").after($("<div class='h2_disable'>").html("<h2>?????? ??????????????? ??????????????? ????????????.</h2>"));
				}else{																// ??????????????? ????????????
					$(".h2_disable").remove();
					$("#challengeJoinBtn").removeClass("btn-primary");
					$("#challengeJoinBtn").addClass("btn-secondary");
					$("#challengeJoinBtn").attr("disabled", "disabled");
					$("#mod_chal_top3").attr("hidden","hidden");
					$("#mod_goalTitle").attr("hidden","hidden");
					$("#mod_goal").attr("hidden","hidden");

					$("#mod_chal_user").after($("<div class='h2_disable'>").html("<h2>????????? ??? ?????? ????????????.</h2>"));
				}
			});
			
			$("#challengeJoinBtn").data("chall_num", chall_num);				// ???????????? ????????? ????????? ?????? ??????
			
			
		});
	});
	
	$("#slider").mousemove(function(){
		$("#goal_now").html(addComm(Math.round($("#slider").val())));
	})
	
	// [????????????] ?????? ??? confirm ?????? open
 	$("#challengeJoinBtn").click(function(){
		$("#msg_popup .modal-body .div_mod_content").html(`<i class="bi bi-exclamation-octagon-fill"></i> `+" ???????????? ?????????????????????????");
		$("#btn_confirm").removeAttr('hidden');
		$("#btn_alert").attr("hidden","hidden");
		$("#msg_popup").modal("show");
	});
	
	// ?????? ????????? ????????? INSERT
	$("#confirm_yes").click(function(){
		$("#msg_popup").modal("hide");
		$.ajax({
			url:"challInsert",
			data: { user_id : '${loginUser.id}',
					goal : removeComm($("#goal_now").html()),
					chall_num : $("#challengeJoinBtn").data("chall_num")}
		}).done(function(data){
			if(data == 1){
				$("#msg_popup .modal-body .div_mod_content").html(`<i class="bi bi-info-circle-fill"></i> `+" ????????? ??????!!");
				$("#btn_alert").removeAttr("hidden");
				$("#alert_ok").text("?????? ????????????");
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