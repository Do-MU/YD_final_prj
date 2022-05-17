<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
input {
	width: 300px;
}

.banner_area_login {
	position: relative;
	z-index: 1;
	min-height: 120px;
	background-image: -moz-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
	background-image: -webkit-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
	background-image: -ms-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
	margin-bottom: 300px;
}

#icon {
	margin-bottom: 50px;
}

#join, #idFind, #pwFind {
	color: black;
	margin: 0 10px;
}
#join:hover, #idFind:hover, #pwFind:hover {
	color: red;
	cursor: pointer;
}

footer {
	width : 100%;
	position : fixed;
	bottom : 0;
}

</style>

<section class="banner_area_login"></section>
<section class="login">
	<form action="userLogin" method="POST">
		<div align="center">
			<div id=icon>
				<img src="resources/img/favicon.png" style="height: 80px;"><br>
				<h1>KEUMBI LOGIN</h1>
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
				<span onclick="location.href='userJoinForm'" id="join">회원가입</span> <span
					id="idFind">아이디 찾기</span> <span id="pwFind">비밀번호 찾기</span>
			</div>
		</div>
	</form>
	<div class="modal fade" id="findIDModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">ID 찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td>이름</td>
							<td><input></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input>
								<button>이메일인증</button></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">ID찾기</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="findPWModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">PW 찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"><span aria-hidden="true">&times;</span></button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<td>이름</td>
							<td><input></td>
						</tr>
						<tr>
							<td>ID</td>
							<td><input></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input>
								<button>이메일인증</button></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">ID찾기</button>
				</div>
			</div>
		</div>
	</div>
</section>


	
	
<script>
	$("#idFind").click(function() {
		$("#findIDModal").modal("show");
	})
	$("#pwFind").click(function() {
		$("#findPWModal").modal("show");
	})
</script>