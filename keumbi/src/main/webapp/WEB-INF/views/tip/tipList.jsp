<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="https://ssl.pstatic.net/sstatic/search/pc/css/sp_nreview_220210.css">
<style>
.api_save_group,
.total_tag_area,
.total_link_area,
.total_comment,
.thumb_count {		/* 출력에 필요없는 사항들 출력X */
	display: none;
}

.total_wrap{		/* 팁 목록 wrapper */
	display: flex;
	/* border: 1px solid; */
	padding: 50px;
}
._svp_item{			/* 목록 deco 삭제 */
	list-style:none;
}
/* 게시글 제목 */
.total_tit{
	font-size: 20px;
}

/* 게시글 내용 */
.total_dsc_wrap{
	width: 80%;
}

a{
	text-decoration:none;
	color: black;
}

a:hover{
	color: black;
}

mark{
	font-weight:bold;
	background-color:white;
}

#div_btns{
	width:80%;
	display: flex;
	justify-content: space-between;
	margin: 0 auto 50px;
}

#div_btns button{
	width: 100px;
	padding: 10px;
	border: none;
}


.tabnav{
	background-color:#f8f8f8;
	font-size:0;
	padding:0;
	margin:0;
	display:flex;
	justify-content: space-between;
}
.tabnav li{
	display: inline-block;
	height:46px;
	width: 16.6%;
	text-align:center;
}
.tabnav li a:before{
	content:""; 
	position:absolute; 
	left:0; 
	top:0px; 
	width:100%; 
	height:3px; 
}
.tabnav li a.active:before{
	background:#2E2EFE;
}
.tabnav li a{ 
	position:relative;
	display:block;
	background: #f8f8f8;
	color: #000;
	padding:0 30px;
	line-height:46px;
	text-decoration:none;
	font-size:16px;
}
.tabnav li a:hover,
.tabnav li a.active{
	background:#fff; 
	color:#2E2EFE; 
}
.tabcontent{
	padding: 20px;
	border-top:none;
}
</style>
</head>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>오늘의 머니팁</h2>
						<div class="page_link">
							<a href="home">Home</a>
							<a href="tips">팁</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">
			<div class="tab">
				<ul class="tabnav">
					<li><a href="#tip1">자산관리</a></li>
					<li><a href="#tip2">주식</a></li>
					<li><a href="#tip3">부동산</a></li>					
					<li><a href="#tip4">대출</a></li>
					<li><a href="#tip5">신용점수</a></li>
					<li><a href="#tip6">보험</a></li>
				</ul>
				<div class="tabcontent">
					<div id="div_crawling">
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$('.tabnav a').on('click', function() {
			$('.tabnav a').removeClass('active');
			$(this).addClass('active');
			let url = $(this).attr("href");
			url = url.substr(1, url.length);
			console.log(url);
			$.ajax({
				url:"webCrawling",
				data: {tip:url}
			}).done(function(contents){
				$("#div_crawling").html(contents)
			})
		}).filter(':eq(0)').click();
		
		
		// 게시글 작성자와 게시글 작성일 위치 변경
		$(".etc_dsc_inner").each(function() {
			$(this).insertBefore( $(this).prev() );
			$(this).after($("<span>").html(" | "))
		});
	</script>
</body>
</html>