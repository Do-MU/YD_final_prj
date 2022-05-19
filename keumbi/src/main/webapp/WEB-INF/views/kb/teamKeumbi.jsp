<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
	.container>div>h1{margin-bottom: 50px;}
</style>

<section class="banner_area">
	<div class="box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>TEAM KEUMBI</h2>
						<div class="page_link">
							<a href="home">Home</a>
							<a href="teamKeumbi">Team KEUMBI</a>
						</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<c:forEach var="mem" items="${team}">
			<div align="center">
				<h1>${mem.name}</h1>
			</div>
		</c:forEach>
	</div>
</section>