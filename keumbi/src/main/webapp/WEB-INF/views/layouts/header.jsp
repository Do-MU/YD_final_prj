<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#li_name{
	margin-right:5px;
}
#li_noti{
	width: 30px;
	text-align:center;
}
#noti:hover {
	font-size:1.5em;
	cursor:pointer;
}
</style>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container box_1620">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="home"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">계좌</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="accountView">내 계좌 목록</a></li>
								<li class="nav-item"><a class="nav-link" href="#">송금</a></li>
								<li class="nav-item"><a class="nav-link" href="prdDepositList">상품추천</a></li>
							</ul>
						</li>
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">카드</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="#">내 카드 목록</a></li>
								<li class="nav-item"><a class="nav-link" href="#">상품추천</a></li>
							</ul>
						</li>
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">대출</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="#">상품추천</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="monthView">가계부</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="#">팁</a></li>
						<li class="nav-item"><a class="nav-link" href="prdChallengeList">챌린지</a></li>
						<li class="nav-item"><a class="nav-link" href="#"></a></li>
						<c:if test="${empty loginUser}">
							<li class="nav-item"><a class="nav-link" href="userLoginForm">로그인</a></li>
						</c:if>
							
						<c:if test="${not empty loginUser}">
							<li class="nav-item submenu dropdown" id="li_name">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${loginUser.name} 님</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="#">나의 정보</a></li>
									<li class="nav-item"><a class="nav-link" href="challengeList">나의 챌린지</a></li>
									<li class="nav-item"><a class="nav-link" href="#">지출분석</a></li>
									<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
								</ul>
							</li>
							<li class="nav-item" id="li_noti"><i id="noti" class="nav-link bi bi-bell-fill"></i></li>
							<li class="nav-item"><a class="nav-link" href="userLoginForm">로그아웃</a></li>
						</c:if>
					</ul>
				</div> 
			</div>
		</nav>
	</div>
</header>
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
</script>