<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<header id="header" class="header fixed-top d-flex align-items-center">

	<div class="d-flex align-items-center justify-content-between">
		<a href="${pageContext.request.contextPath}/admin/" class="logo d-flex align-items-center"> <img
			src="${pageContext.request.contextPath}/resources/img/favicon.png"
			alt=""> <span class="d-none d-lg-block">KEUMBI</span>
		</a> <i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
</header>


<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-item"><a class="nav-link collapsed"
			href="admUserMng"> <i class="bi bi-person"></i> <span>회원목록 관리</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="prdUpdate"> <i class="bi bi-menu-button-wide"></i> <span>상품관리</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="admReportList"> <i class="bi bi-dash-circle"></i> <span>신고목록 관리</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="admQnaList"> <i class="bi bi-question-circle"></i> <span>고객센터 관리</span>
		</a></li>
	</ul>
</aside>