<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	margin-bottom: 200px;
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
	width: 100%;
	position: fixed;
	bottom: 0;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

.certification{
	display: none;
}

.correct{
    color : blue;
	}
	
.incorrect{
    color : red;
}

#idf{
	font-size:2rem;
	color:red;
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
					<label> <span> <input type="text" name="id"
							placeholder="아이디">
					</span>
					</label>
				</div>
				<div>
					<label> <span> <input type="password" name="pw" placeholder="비밀번호">
					</span>
					</label>
				</div>
			</div>
			<div>
				<input type="submit" value="로그인">
			</div>
			<hr width="300px" color="gray" noshade />
			<div>
				<span onclick="location.href='joinForm'" id="join">회원가입</span> <span
					id="idFind">아이디 찾기</span> <span id="pwFind">비밀번호 찾기</span>
			</div>
		</div>
	</form>
	
	<!-- 아이디 찾기 MODAL창 -->
	<div class="modal fade" id="findIDModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">ID 찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<table>
						<tr>
							<td>이름</td>
							<td><input id="namei" name="name"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" id="emaili" name="email" class="mail_input1">
								<button class="mail_btn1">이메일인증</button>
							</td>						
						</tr>
						<tr class="hidden1" style="display:none;">
							<td><span>인증</span></td>
							<td>
								<input type="text" class="mail_check_input1">
								<button class="mail_check_btn1">확인</button><br>
								<label id="result1" style="display:none"></label>
							</td>
						</tr>
						<tr id="find1" style="display:none;">
							<td></td>
							<td><label id="idf"></label></td>
						</tr>
					</table>
				</div>
				
				<div class="modal-footer">
					<button type="button" id="iFind" class="btn btn-primary">ID찾기</button>
				</div>
				
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 MODAL창 -->
	<div class="modal fade" id="findPWModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">PW 찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<table>
						<tr>
							<td>아이디</td>
							<td><input id="idp" name="id"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input id="namep" name="name"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>
								<input type="text" id="emailp" name="email" class="mail_input2">
								<button class="mail_btn2">이메일인증</button>
							</td>						
						</tr>
						<tr class="hidden2" style="display:none;">
							<td><span>인증</span></td>
							<td>
								<input type="text" class="mail_check_input2">
								<button class="mail_check_btn2">확인</button><br>
								<label id="result2" style="display:none"></label>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="modal-footer">
					<button type="button" id="pUpdate1" class="btn btn-primary">PW변경하기</button>
				</div>
				
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 변경 MODAL창 -->
	<div class="modal fade" id="updatePWModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">PW 찾기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<div class="modal-body">
					<table>
						<tr>
							<td>PW</td>
							<td><input type="password" id="pw1" name="pw" min="8" placeholder="8자이상 입력해주세요."></td>
						</tr>
						<tr>
							<td>PW확인</td>
							<td>
								<input type="password" id="pw2" placeholder="8자이상 입력해주세요."><br>
								<p style=color:red id="fail" style="display:none;">비밀번호가 일치하지 않습니다.</p>
                				<p style=color:blue id="success" style="display:none;">비밀번호가 일치합니다.</p>
							</td>
						</tr>
					</table>
				</div>
				
				<div class="modal-footer">
					<button type="button" id="pUpdate2" class="btn btn-primary">변경</button>
				</div>
				
			</div>
		</div>
	</div>
	
</section>




<script>
	// 송금 view -> 로그인메세지
	if('${loginMsg}'){
		alert('${loginMsg}');
	}
	
	//아이디 찾기 모달창
	$("#idFind").click(function() {
		$("#findIDModal").modal("show");
	})
	
	//비밀번호 찾기 모달창
	$("#pwFind").click(function() {
		$("#findPWModal").modal("show");
	})
	
	//아이디 찾기 인증번호 메일 전송
	var code = "";               						 //이메일전송 인증번호 저장위한 코드
	$(".mail_btn1").click(function(){
		 var email = $(".mail_input1").val();			// 입력한 이메일
		 $.ajax({
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
					$(".hidden1").css("display", "");
		        	code = data;
		        }
		 });
	});
	
	/* 아이디 찾기 인증번호 비교 */
	$('.mail_check_btn1').click(function(){
		var inputCode = $(".mail_input1");        		// 이메일 입력값
		var iCode = $(".mail_check_input1").val();      // 인증코드 값
	    var codeBtn = $(".mail_btn1");					//인증번호 발송 버튼
	    var checkResult = $("#result1");   				// 인증번호 결과
	    var resultCode = $(".mail_check_input1");    	// 인증번호 입력란
	    var resultBtn = $(".mail_check_btn1");			// 인증번호 확인 버튼
	    
	    checkResult.css("display", "");
	    
	    if(iCode == code){                            	// 일치할 경우
	    	checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");
	        inputCode.attr("readonly", "readonly");
	        codeBtn.attr("disabled", "disabled");
	        resultCode.attr("readonly", "readonly");
	        resultBtn.attr("disabled", "disabled");
	        $("#iFind").click(function(){				//아이디 찾기
				$.ajax({
					url:"userIdFind",
					data:{
						name : $("#namei").val(),
						email : $("#emaili").val()
					}
				}).done(function(data){
			        $("#find1").css("display", "");
			        $("#idf").html('" '+data.id+' " '+'입니다.');
				});
	        });
	    } else {                                       	// 일치하지 않을 경우
	    	checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        resultCode.val('');
	    }
	});
	
	//비밀번호 찾기 인증번호 메일 전송
              						 					// 이메일전송 인증번호 저장위한 코드
	$(".mail_btn2").click(function(){
		 var email = $(".mail_input2").val();			// 입력한 이메일
		 $.ajax({
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
					$(".hidden2").css("display", "");
		        	code = data;
		        }
		 });
	});
	
	/* 비밀번호 찾기 인증번호 비교 */
	$('.mail_check_btn2').click(function(){
		var inputCode = $(".mail_input2");        		// 이메일 입력값
		var iCode = $(".mail_check_input2").val();      // 인증코드 값
	    var codeBtn = $(".mail_btn2");					//인증번호 발송 버튼
	    var checkResult = $("#result2");   				// 인증번호 결과
	    var resultCode = $(".mail_check_input2");    	// 인증번호 입력란
	    var resultBtn = $(".mail_check_btn2");			// 인증번호 확인 버튼
	    
	    checkResult.css("display", "");
	    
	    if(iCode == code){                            	// 일치할 경우
	    	checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("class", "correct");
	        inputCode.attr("readonly", "readonly");
	        codeBtn.attr("disabled", "disabled");
	        resultCode.attr("readonly", "readonly");
	        resultBtn.attr("disabled", "disabled");
	        $("#pUpdate1").click(function(){					//비밀번호 변경하러 가기 버튼
				$.ajax({
					url:"userPwFind",
					data:{
						id : $("#idp").val(),
						name : $("#namep").val(),
						email : $("#emailp").val()
					}
				}).done(function(data){
					if(data != null){
						$("#findPWModal").modal("hide");		//비밀번호 찾기 모달창 닫기
						$("#updatePWModal").modal("show");		//비밀번호 변경 모달 띄우기
						$("#pUpdate2").click(function(){
							var pwd1=$("#pw1").val();
							var pwd2=$("#pw2").val();
							if(pwd1 == pwd2 && pwd1.length >= 8){
								$.ajax({
									url:"userPwUpdate",
									data:{
										id : data.id,
										pw : $("#pw1").val()
									}
								}).done(function(data){
									if(data == 1){
										$("#updatePWModal").modal("hide");						
									}
								})
							}else{
								alert("비밀번호가 일치하지 않거나 8자 이상이 아닙니다.");
							}
						})
					}
				});
	        });
	    } else {                                            // 일치하지 않을 경우
	    	checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        resultCode.val('');
	    }
	});
	
	//비밀번호 확인
	$(function(){ 
		$("input").change(function(){
			var pwd1=$("#pw1").val();
			var pwd2=$("#pw2").val();
			if(pwd1 != "" || pwd2 != ""){ 
				if(pwd1 == pwd2){ 
					$("#success").show();
					$("#fail").hide();
				}else{ 
					$("#success").hide();
					$("#fail").show();
				}
			}else{
				$("#fail").hide();
				$("#success").hide();
			}
		});
	});

</script>