<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
/* 챌린지 출력 선택 목록 */
#div_challSelect {
	display: flex;
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

#chall_ul a {
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

.div_period>h3 {
	margin:0 auto;
	width: 70px;
	height: 30px;
	color: white;
	background-color: #1E90FF;
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
				<li id="ch_a"><a href="#">전체 챌린지</a></li>
				<li class="contour">||</li>
				<li id="ch_i"><a href="#">진행중인 챌린지</a></li>
				<li class="contour">||</li>
				<li id="ch_s"><a href="#">성공한 챌린지</a></li>
				<li class="contour">||</li>
				<li id="ch_f"><a href="#">실패한 챌린지</a></li>
			</ul>
		</div>
		
		<div id="list">
			<!-- 챌린지 출력 -->
			<c:forEach var="ch" items="${list}">
				<div class="challs" data-chall_num="${ch.chall_num}" data-num="${ch.num}">
					<div class="div_img">
						<img src="" style="height: 180px; width: 180px;"><br>
						<div class="div_period">
							<h3>D-${ch.dday}</h3>
						</div>
					</div>

					<div class="div_detail">
						<div class="div_title"><span class="chal_pro chal_pro_i">${ch.chall_code}</span></div>
						<div class="div_contents"></div>
				
						<div class="progress">
							<div class="progress-label bg-success" style="width: ${ch.progress}%;" data-progress="${ch.progress}"></div>
						</div>
						<div class="div_per">${ch.accum_amt}/${ch.goal} (${ch.progress}%)</div>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
</section>
<script>
	if (!'${loginUser.id}') {
		alert('로그인이 필요합니다.');
		window.location = "userLoginForm";
	}
	
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
		$.ajax({
			url:"challCode",
			data:{chall_code:$(this).html()}
		}).done(function(val){
			div.html(val.substr(4));
			
			if(val.substr(4)=="성공"){
				div.removeClass("chal_pro_i");
				div.addClass("chal_pro_s");
			}else if(val.substr(4)=="실패"){
				div.removeClass("chal_pro_i");
				div.addClass("chal_pro_f");
			}
		});
	});
	
	$(".progress-label").each(function(){
		let progress = $(this).data("progress");
		console.log(progress);
		if(progress>=80){
			$(this).removeClass("bg-success");
			$(this).addClass("bg-danger");
		}else if(progress>=50){
			$(this).removeClass("bg-success");
			$(this).addClass("bg-warning");
		}
	});
</script>