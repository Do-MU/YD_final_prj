<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	section{
		text-align : center;
	}
	.a{
		padding-right:150px;
	}
</style>
<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>챌린지 목록</h2>
					<div class="page_link">
						<a href="home">Home</a> <a href=""></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section>
	<c:forEach var="prd" items="${prdChall }">
		<div>
			<span>${prd.title }</span>
			<span><button style="height:30px; width:30px; background-color:white; border:0; font-size:3em">></button></span>
		</div>
		<div>
			<span>${prd.content }</span>
			<div>
				<span>목표기간</span>
				<span>
					<img src="resources/img/favicon.png" style="height: 150px; width:150px;">
				</span>
			</div>
			<div class="a">도전자</div>
		</div>
	</c:forEach>
</section>
<script>

</script>