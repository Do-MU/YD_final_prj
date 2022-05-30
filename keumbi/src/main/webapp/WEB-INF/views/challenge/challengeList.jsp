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
}

.chal_pro{
	font-size: 25px;
	margin-left: 20px;
	color: white;
	padding: 3px;
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
	margin-bottom: 75px;
}

.progress {
	height: 25px;
	text-align: center;
	color: white;
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
						<a href="home">Home</a> <a href="challengeList">나의 챌린지</a>
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

		<!-- 챌린지 출력 -->
		<div class="challs">
			<div class="div_img">
				<img src="resources/img/favicon.png"
					style="height: 180px; width: 180px;"><br>
				<div class="div_period">
					<h3>D-30</h3>
				</div>
			</div>

			<div class="div_detail">
				<div class="div_title"><span class="chal_pro chal_pro_i">진행중</span></div>
				<div class="div_contents">챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용
					챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지</div>

				<div class="progress">
					<div class="progress-var bg-info" style="width: 50%;">50%</div>
				</div>
				<div class="div_per"></div>
			</div>
		</div>
		<hr>

		<div class="challs">
			<div class="div_img">
				<img src="resources/img/favicon.png"
					style="height: 180px; width: 180px;"><br>
				<div class="div_period">
					<h3>D-30</h3>
				</div>
			</div>
			
			<div class="div_detail">
				<div class="div_title">챌린지 제목<span class="chal_pro chal_pro_s">성공</span></div>
				<div class="div_contents">챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용
					챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지</div>

				<div class="progress">
					<div class="progress-var bg-danger" style="width: 80%;"></div>
				</div>
				<div class="div_per">목표금액 100,000원</div>
			</div>
		</div>
		<hr>
		
		<div class="challs">
			<div class="div_img">
				<img src="resources/img/favicon.png"
					style="height: 180px; width: 180px;"><br>
				<div class="div_period">
					<h3>D-30</h3>
				</div>
			</div>

			<div class="div_detail">
				<div class="div_title">챌린지 제목<span class="chal_pro chal_pro_f">실패</span></div>
				<div class="div_contents">챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용
					챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지</div>

				<div class="progress">
					<div class="progress-var bg-danger" style="width: 100%;">100%</div>
				</div>
				<div class="div_per">목표금액 100,000원</div>
			</div>
		</div>
		<hr>
		
		
	</div>
</section>
<script>
//유저 챌린지 정보 가져오기
$.ajax({
	type:"GET",
	url:"userChallList",
	data:{id:"${loginUser.id}"}
}).done(function(chall){
	$.each(chall, function(index, item){
		//상품 챌린지 정보 가져오기
		var i = item.chall_code;
		var html = '';
		if(i == 'CH1'){
			html = "진행중";
		}else if(i == "CH2"){
			html = "성공";
		}else if(i == "CH3"){
			html = "실패";
		}
		
		$(".challs").data("chall_num", item.chall_num);											//챌린지 번호 부여
		
		$.ajax({
			type:"GET",
			url:"prdChall",
			data:{num: $(".challs").data("chall_num")}
		}).done(function(pchall){
			$(".div_title").html(pchall.title);													//챌린지 제목
			$(".div_title").append($(`<span class='chal_pro chal_pro_i'></span>`).html(html));	//진행,성공,실패
			$(".div_contents").html(pchall.content);											//챌린지 내용
			$(".div_per").html(item.goal+"원");													//목표금액
			$(".div_period").children('h3').html("D-"+item.dday);								//남은일자
		})
	})
})
</script>