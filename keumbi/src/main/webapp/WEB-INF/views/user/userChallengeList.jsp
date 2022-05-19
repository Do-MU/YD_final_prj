<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.m{
		width:80%;
	}
	.all_chall, .a_chall, .b_chall, .s_chall, .r_chall, .contour {
		display:inline-block;
	}
	
	.all_chall{
		text-align:right;
		padding:50px 0px 50px 1070px;
	}
	
	.wrapper{
		padding-left:200px;
	}
   .a{
      padding-top:100px;
      display:flex;
      padding-left:200px;
   }
	
   .a1{
      flex:1;
      height:200px;
	  width:200px;
	  text-align:center;
   }
   .a2{
      flex:3;
      height:200px;
   }
	.g{
		text-align:right;
		padding-top:5px;
	}
	.h{
		text-align:center;
		padding-top:10px;
		height:50px;
	}
	.k{
		padding-top:10px;
	}
	.n{
		height:50px;
		width:830px;
	}
	
	.progress{
		height:25px;
	}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>나의 챌린지</h2>
					<div class="page_link">
						<a href="home">Home</a> <a href=""></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section>
	<div class="m">
		<div class="all_chall">
			<div class="a_chall">전체 챌린지</div>
			<div class="contour">||</div>
			<div class="b_chall">진행중인 챌린지</div>
			<div class="contour">||</div>
			<div class="s_chall">성공한 챌린지</div>
			<div class="contour">||</div>
			<div class="r_chall">실패한 챌린지</div>
		</div>
		
		<div class="wrapper">
		    <div class="a">
		       	<div class="a1">
		         	<img src="resources/img/favicon.png" style="height: 150px; width:150px;"><br>
		         	<div class="k">
		         		<span class="g">기간</span>
		         	</div>
		         </div>
		         <div class="a2">
		         	<span class="left">
		         		챌린지 제목
					</span><br>
		         	<span class="left">
		         		챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용
					</span><br>
					<div class="h">
						<div class="progress">
							<div class="progress-var bg-info" style="width:40%;"></div>
						</div>
					</div>
					<div class="g">
						<span>
							%표시
						</span>
					</div>
		         </div>
	    	</div>
		</div>
		
		<div class="wrapper">
		    <div class="a">
		       	<div class="a1">
		         	<img src="resources/img/favicon.png" style="height: 150px; width:150px;"><br>
		         	<div class="k">
		         		<span class="g">기간</span>
		         	</div>
		         </div>
		         <div class="a2">
		         	<span class="left">
		         		챌린지 제목
					</span><br>
		         	<span class="left">
		         		챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용챌린지 내용
					</span><br>
					<div class="h">
			         	<div class="progress">
							<div class="progress-var bg-danger" style="width:80%;"></div>
						</div>
					</div>
					<div class="g">
						<span>
							%표시
						</span>
					</div>
		         </div>
	    	</div>
		</div>
	</div>
</section>
<script>
	document.getElementsByClassName("progress-var")[1].classList.add("bg-danger");
	$(".bg-danger").html('40%');
</script>