<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container box_1620">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="home"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">계좌</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="#">내 계좌 목록</a></li>
								<li class="nav-item"><a class="nav-link" href="#">송금</a></li>
								<li class="nav-item"><a class="nav-link" href="#">상품추천</a></li>
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
						<li class="nav-item"><a class="nav-link" href="#">가계부</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="#">팁</a></li>
						<li class="nav-item"><a class="nav-link" href="#"></a></li>
						<c:if test="${empty loginUser}">
							<li class="nav-item"><a class="nav-link" href="userLoginForm">로그인</a></li>
						</c:if>
							
						<c:if test="${not empty loginUser}">
							<li class="nav-item"><a class="nav-link" href="#">${loginUser.name} 님</a></li>
							<li class="nav-item"><a class="nav-link" href="userLoginForm">로그아웃</a></li>
						</c:if>
					</ul>
				</div> 
			</div>
		</nav>
	</div>
</header>