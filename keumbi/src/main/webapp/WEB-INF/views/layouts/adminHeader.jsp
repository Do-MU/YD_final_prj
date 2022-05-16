<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
	#main_logo {
		font-size: 30px;
	}
</style>

<nav class="navbar navbar-dark bg-primary">
	<a class="navbar-brand" href="home">
		<img src="${pageContext.request.contextPath}/resources/img/favicon.png" width="40" height="40">
		<span id="main_logo">KEUMBI</span>
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="home">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="prdUpdate">상품관리</a>
      </li>
    </ul>
    </div>
</nav>