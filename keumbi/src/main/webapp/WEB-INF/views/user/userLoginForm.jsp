<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	input{
		width:300px;
	}
	
	.login{
		height:602px;
	}
	
	.banner_area_login {
		position: relative;
		z-index: 1;
		min-height: 120px;
		background-image: -moz-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
		background-image: -webkit-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
		background-image: -ms-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
		margin-bottom: 80px;
	}
	
	#icon{
		margin-bottom:50px;
	}
</style>
</head>
<section class="banner_area_login">

</section>
<section class="login">
	<form action="userLogin" method="POST">
		<div align="center">
			<div id=icon>
				<img src="resources/img/favicon.png" style=height:80px;>
			</div>
			<div>
				<div>
					<label>
						<span>
							<input id="id" type="text" name="id" placeholder="아이디">
						</span>
					</label>
				</div>
				<div>
					<label>
						<span>
							<input id="pw" type="password" name="pw" placeholder="비밀번호는 8자 이상">
						</span>
					</label>
				</div>
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
			<hr width="17%" color="gray" noshade/>
			<div>
				<a href="">회원가입</a> <a href="">아이디 찾기</a> <a href=""/>비밀번호 찾기</a>
			</div>
		</div> 
	</form>
</section>