<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input {
	width: 300px;
}

.login {
	height: 602px;
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

#icon {
	margin-bottom: 50px;
}

#join, #idFind, #pwFind {
	color: blue;
	text-decoration: underline;
}
</style>
</head>
<section class="banner_area_login"></section>
<section class="login">
	<form action="userLogin" method="POST">
		<div align="center">
			<div id=icon>
				<img src="resources/img/favicon.png" style="height: 80px;">
			</div>
			<div>
				<div>
					<label> <span> <input id="id" type="text" name="id"
							placeholder="아이디">
					</span>
					</label>
				</div>
				<div>
					<label> <span> <input id="pw" type="password"
							name="pw" placeholder="비밀번호는 8자 이상">
					</span>
					</label>
				</div>
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
			<hr width="17%" color="gray" noshade />
			<div>
				<span onclick="location.href='userJoinForm'" id="join">회원가입</span>
				<span id="idFind">아이디 찾기</span> <span id="pwFind">비밀번호 찾기</span>
			</div>
			<div class="modal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Modal title</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>Modal body text goes here.</p>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</form>
</section>
<script>
	$("#idFind").click(function(){
		$(".modal").modal("show");
	})
</script>