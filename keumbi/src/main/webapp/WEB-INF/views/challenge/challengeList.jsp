<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.contact_area .container{
	min-height: 660px;
}
/* 챌린지 출력 선택 목록 */
#div_challSelect {
	display: flex;
	font-size: 1.2em;
}

#chall_ul {
	list-style: none;
	margin-left: auto;
	padding: 0;
	display: flex;
}

#ch_a, #ch_i, #ch_s, #ch_f, .contour {
	margin-left: 10px;
}

.ch_btns.active a{
	color: skyblue;
}
.ch_btns a {
	color: black;
}

#chall_ul a:hover {
	color: skyblue;
}

/* DIVs */
.challs {
	display: flex;
	margin: 50px 0;
}

.div_img {
	flex: 1;
	text-align: center;
}

.div_period {
	margin-top: 10px;
}

.div_period>h3,
.div_period>h5{
	margin:0 auto;
	width: 70px;
	height: 30px;
	color: white;
	background-color: #1E90FF;
	line-height:30px;
}

.div_detail {
	flex: 3;
}

.div_detail>div {
	margin-top: 10px;
}
.div_title{
	font-size:30px;
	margin-bottom: 20px;
}

.chal_pro{
	font-size: 25px;
	margin-left: 20px;
	color: white;
	padding: 5px;
}
.chal_pro_i{
	background-color: green;
}
.chal_pro_s{
	background-color: blue;
}
.chal_pro_f{
	background-color: red;
}

.div_contents {
	margin-bottom: 65px;
	font-size: 1.5em;
}

.progress {
	height: 40px;
	text-align: center;
	color: white;
	font-size: 25px;
	line-height:40px;
}

.div_per {
	text-align: right;
	font-size: 25px;
}

.challs_s{
	background-color: #00000088;
}
#div_nochall{
	font-size: 50px;
	text-align: center;
	font-weight: bold;
	margin-top: 150px;
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>나의 챌린지</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="challengeList">나의 챌린지</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Content -->
<section class="contact_area p_120">
	<div class="container">

		<!-- 챌린지 출력 구분 -->
		<div id="div_challSelect">
			<ul id="chall_ul">
				<li id="ch_a" class="ch_btns"><a href="#">전체 챌린지</a></li>
				<li class="contour">||</li>
				<li id="ch_i" class="ch_btns"><a href="#">진행중인 챌린지</a></li>
				<li class="contour">||</li>
				<li id="ch_s" class="ch_btns"><a href="#">성공한 챌린지</a></li>
				<li class="contour">||</li>
				<li id="ch_f" class="ch_btns"><a href="#">실패한 챌린지</a></li>
			</ul>
		</div>
		
		<div id="list">
			<!-- 챌린지 출력 -->
			<c:forEach var="ch" items="${list}">
				<div class="challs" data-chall_num="${ch.chall_num}" data-num="${ch.num}">
					<div class="div_img">
						<img src="" style="height: 180px; width: 180px;"><br>
						<div class="div_period">
							<c:choose>
								<c:when test="${ch.dday>0}">
									<h3>D-${ch.dday}</h3>
								</c:when>
								<c:otherwise>
									<h5>기간만료</h5>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="div_detail">
						<div class="div_title"><span class="chal_pro chal_pro_i">${ch.chall_code}</span></div>
						<div class="div_contents"></div>
				
						<div class="progress">
							<c:choose>
								<c:when test="${ch.progress>=100}">
									<div class="progress-label bg-success" style="width: 100%;" data-progress="${ch.progress}"></div>
								</c:when>
								<c:otherwise>
									<div class="progress-label bg-success" style="width: ${ch.progress}%;" data-progress="${ch.progress}"></div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="div_per" data-accum_amt="${ch.accum_amt}" data-goal="${ch.goal}" data-progress="${ch.progress}">${ch.accum_amt}/${ch.goal} (${ch.progress}%)</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<script>
$(window).ready(function(){
	if (!"${loginUser.id}") {
		swal({
			text:"로그인이 필요합니다.",
			button: "확인",
			icon: "error",
			closeOnClickOutside: false
		}).then((value) => {
			window.location = "userLoginForm";
		});
	}
	if($("div.challs").length == 0){
		console.log($("div.challs").length)
		$("<div id='div_nochall'>").html("도전 중인 챌린지가 없어요..").appendTo($("#list"))
	}
})
	
	$(".challs").each(function(){
		let div = $(this);
		$.ajax({
			url:"prdChall",
			data:{num:$(this).data("chall_num")}			
		}).done(function(chall){
			// 이미지 변경
			div.children(".div_img").children("img").attr("src", "${pageContext.request.contextPath}/resources/img/challenge_img/"+chall.image);
			// 챌린지 제목
			div.children(".div_detail").children(".div_title").prepend($("<span>").text(chall.title));
			// 챌린지 내용
			div.children(".div_detail").children(".div_contents").text(chall.content);
		});
	});
	
	$(".chal_pro").each(function(){
		let div = $(this);
		let div_ch = $(this).closest("div.challs");
		$.ajax({
			url:"challCode",
			data:{chall_code:$(this).html()}
		}).done(function(val){
			div.html(val.substr(4));
			
			if(val.substr(4)=="성공"){
				div.removeClass("chal_pro_i");
				div.addClass("chal_pro_s");
				div_ch.addClass("ch_s");
			}else if(val.substr(4)=="실패"){
				div.removeClass("chal_pro_i");
				div.addClass("chal_pro_f");
				div_ch.addClass("ch_f");
			}else{
				div_ch.addClass("ch_i");
			}
		});
	});
	
	$(".progress-label").each(function(){
		let progress = $(this).data("progress");
		if(progress>=80){
			$(this).removeClass("bg-success");
			$(this).addClass("bg-danger");
		}else if(progress>=50){
			$(this).removeClass("bg-success");
			$(this).addClass("bg-warning");
		}
	});
	
	$(".div_per").each(function(){
		var accum_amt = $(this).data("accum_amt");
		var goal = $(this).data("goal");
		var progress = $(this).data("progress")
		$(this).text(addComm(accum_amt)+'원 / '+addComm(goal) +'원 ('+progress+'%)');
	});
	
	$("#ch_a").on('click',function(){
		$("div.challs").removeAttr("hidden");
		$("div#div_nochall").remove();
		$(".ch_btns").removeClass("active");
		$("#ch_a").addClass("active");
		if($("div.challs").length == 0){
			$("<div id='div_nochall'>").html("도전 중인 챌린지가 없어요..").appendTo($("#list"));
		}
	});
	
	$("#ch_i").on('click',function(){
		$("div.challs").attr("hidden","hidden");
		$("div.ch_i").removeAttr("hidden");
		$("div#div_nochall").remove();
		$(".ch_btns").removeClass("active");
		$("#ch_i").addClass("active");
		if($("div.ch_i").length == 0){
			$("<div id='div_nochall'>").html("도전 중인 챌린지가 없어요..").appendTo($("#list"));
		}
	});
	
	$("#ch_s").on('click',function(){
		$("div.challs").attr("hidden","hidden");
		$("div.ch_s").removeAttr("hidden");
		$("div#div_nochall").remove();
		$(".ch_btns").removeClass("active");
		$("#ch_s").addClass("active");
		if($("div.ch_s").length == 0){
			$("<div id='div_nochall'>").html("성공한 챌린지가 없어요..").appendTo($("#list"));
		}
	});
	
	$("#ch_f").on('click',function(){
		$("div.challs").attr("hidden","hidden");
		$("div.ch_f").removeAttr("hidden");
		$("div#div_nochall").remove();
		$(".ch_btns").removeClass("active");
		$("#ch_f").addClass("active");
		if($("div.ch_f").length == 0){
			$("<div id='div_nochall'>").html("실패한 챌린지가 없어요..").appendTo($("#list"));
		}
	});
	
	function addComm(num){
		return num.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}
</script>