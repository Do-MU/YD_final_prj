<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/linericon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/lightbox/simpleLightbox.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/nice-select/css/nice-select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/animate-css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/popup/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendors/flaticon/flaticon.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
<!-- main css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/responsive.css">

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
body {
	background-color: skyblue;
}

#li_name {
	margin-right: 5px;
}

#li_noti {
	width: 30px;
	text-align: center;
}

#noti:hover {
	font-size: 1.5em;
	cursor: pointer;
}
.modal{
	position: fixed;
	top: 6%;
	left: 26%;
}
.modal-content{
	height: 800px;
}
#mod_btns{
	display:flex;
	padding: 0 50px;
}
#mod_readDel, #mod_readAll{
	flex:1;
	padding: 0 10px;
}
#mod_btns p{
	margin:0 auto;
	text-align: center;
}

.mod_notis{
	display:flex;
	height: 60px;
}
.mod_data{
	line-height : 30px;
	flex:4;
}
.mod_title{
	font-size: 1.3em;
	color:black;
}
.mod_status{
	text-align: center;
	line-height : 60px;
	flex:1;
}
.modal:after {
	 border-top:0px solid transparent;
	 border-left: 10px solid transparent;
	 border-right: 10px solid transparent;
	 border-bottom: 10px solid white;
	 content:"";
	 position:absolute;
	 right:50%;
	 top:20px;
}
</style>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container box_1620">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="home"><img
					src="${pageContext.request.contextPath}/resources/img/logo.png"
					alt=""></a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">

						<li class="nav-item"><a class="nav-link" href="#"></a></li>
						<li class="nav-item submenu dropdown" id="li_name"><a
							href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">${loginUser.name}
								님</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="#">나의 정보</a></li>
								<li class="nav-item"><a class="nav-link"
									href="challengeList">나의 챌린지</a></li>
								<li class="nav-item"><a class="nav-link" href="#">지출분석</a></li>
								<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
							</ul></li>
						<li class="nav-item submenu" id="li_noti"><i id="noti"
							class="nav-link bi bi-bell-fill"></i></li>
						<li class="nav-item"><a class="nav-link" href="userLoginForm">로그아웃</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>

<div class="modal fade" id="modal_noti" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">

			<div class="modal-body">
				<div id="mod_btns">
					<p id="mod_readAll">전체 읽음</p>
					<p>|</p>
					<p id="mod_readDel">읽은 알림 지우기</p>
				</div>
				<hr>
				<div class="mod_notis">
					<div class="mod_data">
						<div class="mod_title">관심 키워드 게시글 등록 알림</div>
						<div class="mod_contents">"주식 관련해서 알려준다" 게시글이 등록됐습니다.</div>
					</div>
					<div class="mod_status">읽지 않음</div>
				</div>
				<hr>
				<div class="mod_notis">
					<div class="mod_data">
						<div class="mod_title">관심 키워드 게시글 등록 알림</div>
						<div class="mod_contents">"주식 관련해서 알려준다" 게시글이 등록됐습니다.</div>
					</div>
					<div class="mod_status">읽지 않음</div>
				</div>
				<hr>
				<div class="mod_notis">
					<div class="mod_data">
						<div class="mod_title">관심 키워드 게시글 등록 알림</div>
						<div class="mod_contents">"주식 관련해서 알려준다" 게시글이 등록됐습니다.</div>
					</div>
					<div class="mod_status">읽지 않음</div>
				</div>
				
			</div>

			<div class="modal-footer">
			</div>

		</div>
	</div>
</div>
<script>
	if(${loginUser!=null}){
		$.ajax({
			url:"notiSelect"
		}).done(function(notis){
			if(notis.length != 0){
				$("#noti").css("color", "red");
			}
			console.log(notis)
		});
	}
	$("#noti").click(function(){
		$("#modal_noti").modal("show");
	});

</script>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stellar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/lightbox/simpleLightbox.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/nice-select/js/jquery.nice-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/isotope/imagesloaded.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/isotope/isotope.pkgd.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/popup/jquery.magnific-popup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.ajaxchimp.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/counter-up/jquery.waypoints.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/vendors/counter-up/jquery.counterup.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/mail-script.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/theme.js"></script>