<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	body{
		background-color:#EEFAFA;
	}
	section{
		text-align: center;
	}
	
	#header{
		margin: 0 auto;
		padding: 60px 0;
		font-size: 60px;
	}
	#keumbi{
		color:skyblue;
		font-weight: bolder;
	}
	
	.wrapper{
		margin: 0px auto;
		width: 30%;
	}
	.labels{
		margin-top: 20px;
		text-align: left;
	}
	.inputA_div{
		display:flex;
	}
	.inputA{
		flex:1;
		width: 100%;
		height: 60px;
		font-size: 20px;
		padding: 10px;
	}
	
	.inputB_div{
		display:flex;
	}
	.inputB{
		flex:3;
		height: 60px;
		font-size: 20px;
		padding: 10px;
	}
	.buttonB{
		flex:1;
		margin-left: 5%;
	}
	.warnings{
		font-size: 15px;
		color: red;
		display:none;
	}
	#term{
		width:100%;
		height: 150px;
    	resize: none;
    	overflow-y:scroll;
	}
	#div_btn{
		margin: 50px auto;
	}
	.btn{
		width: 100px;
		height: 60px;
		font-size: 15px;
	}
	#div_kwd{
		margin-top: 50px;
	}
	
	a:hover{
		text-decoration:none;
	}
	.red{
		color:red;
	}
	.swal-text{
	font-size: 25px;
	margin-top: 20px;
}
.swal-footer{
	text-align: center;
	margin-top: 5px;
}
.swal-button{
	width: 400px;
}
</style>

<section>
	<div id="header">
		<a href="home">
			<img src="${pageContext.request.contextPath}/resources/img/favicon.png" width="70px" height="70px">
			<span id="keumbi">KEUMBI</span>
		</a>
	</div>
</section>
<section>
	<div id="container">
		<form id="joinFrm" action="userJoin" method="POST">
			<!-- ID 입력 -->
			<div class="wrapper" id="div_id">
				<div class="labels">
					<h3><label><span class="red">*</span>아이디</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="text" id="id" name="id">
				</div>
				<div class="labels">
					<label id="warn_id" class="warnings"></label>
				</div>
			</div>
			
			<!-- PW 입력 -->
			<div class="wrapper" id="div_pw">
				<div class="labels">
					<h3><label><span class="red">*</span>비밀번호</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="password" id="pw" name="pw">
				</div>
				<div class="labels">
					<label id="warn_pw" class="warnings">필수 입력 사항입니다.</label>
				</div>
				<div class="labels">
					<h3><label><span class="red">*</span>비밀번호 확인</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="password" id="pw1" name="pw1">
				</div>
				<div class="labels">
					<label id="warn_pw1" class="warnings"></label>
				</div>
			</div>
			
			<!-- 이름 입력 -->
			<div class="wrapper" id="div_name">
				<div class="labels">
					<h3><label><span class="red">*</span>이름</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="text" id="name" name="name">
				</div>
				<div class="labels">
					<label id="warn_name" class="warnings"></label>
				</div>
			</div>
			
			<!-- 생년월일 입력 -->
			<div class="wrapper" id="div_birth">
				<div class="labels">
					<h3><label><span class="red">*</span>생년월일</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="date" id="birth" name="birth">
				</div>
				<div class="labels">
					<label id="warn_birth" class="warnings"></label>
				</div>
			</div>
			
			<!-- 성별 선택 -->
			<div class="wrapper" id="div_gender">
				<div class="labels">
					<h3><label><span class="red">*</span>성별</label></h3>
				</div>
				<div class="inputA_div">
					<select class="inputA" id="gender" name="gender_code">
					    <option value="">성별</option>
					    <option value="G1">남성</option>
					    <option value="G2">여성</option>
					</select>
				</div>
				<div class="labels">
					<label id="warn_gender" class="warnings"></label>
				</div>
			</div>
			
			<!-- 이메일 입력 및 인증-->
			<div class="wrapper" id="div_email">
				<div class="labels">
					<h3><label><span class="red">*</span>이메일</label></h3>
				</div>
				<div class="inputB_div">
					<input class="inputB" type="email" id="email" name="email">
					<button class="btn buttonB btn-success" id="btn_email" type="button">인증번호 발송</button>
				</div>
				<div class="labels">
					<label id="warn_email" class="warnings"></label>
				</div>
				<div class="labels">
					<h3><label><span class="red">*</span>인증번호</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="text" id="emailChk" readonly="readonly">
				</div>
				<div class="labels">
					<label id="warn_emailChk" class="warnings"></label>
				</div>
			</div>
			
			<!-- 전화번호 입력 -->
			<div class="wrapper" id="div_phone">
				<div class="labels">
					<h3><label>휴대전화</label></h3>
				</div>
				<div class="inputA_div">
					<input class="inputA" type="text" name="phone">
				</div>
			</div>
			
			<!-- 주소 입력 -->
			<div class="wrapper" id="div_email">
				<div class="labels">
					<h3><label>주소</label></h3>
				</div>
				<div class="inputB_div">
					<input class="inputB" type="text" name="addr1" id="addr1">
					<button class="btn buttonB btn-success" id="btn_addr" type="button">검색</button>
				</div>
				<div class="labels">
					<h3><label>상세주소</label></h3>
				</div>
				<div class="inputB_div">
					<input class="inputA" type="text" id="addr2">
				</div>
				<div>
					<input  class="inputA" id="addr" name="addr" type="hidden">
				</div>
			</div>
			
			<!-- 관심 키워드 -->
			<div class="wrapper" id="div_kwd">
				<div class="labels">
					<h3><label>관심키워드</label></h3>
				</div>
				<hr>
				<div class="row">
					<c:forEach var="c" items="${code}">
		            	<div class="col-md-3" style="width:25%; text-align:left;">
		            		<input type="checkbox" value="${c.code}" name="keyword">
						  	<label>${c.val}</label>
		            	</div>
		            </c:forEach>
				</div>
			</div>
			
			<!-- 이용약관 -->
			<div class="wrapper" id="div_term">
				<div class="labels">
					<h3><label><span class="red">*</span>약관 동의</label></h3>
				</div>
				<div class="inputA_div">
					<textarea id="term">${term.term_contents}</textarea>
				</div>
				<div>
					<input type="checkbox"  id="termChk" disabled>
					<label>위 약관을 확인하였으며, 이에 동의합니다.</label>
				</div>
			</div>
	
			<div class="wrapper" id="div_btn">
	        	<input id="btn_back" class="btn-secondary btn" type="button" value="취소" onClick="history.back()">
				<input class="btn-primary btn" type="button" id="btn_join" value="회원가입"/>
			</div>
		</form>
	</div>
</section>
<script>
	let joinEid = false;
	let joinEpw = false;
	let joinEpw1 = false;
	let joinEnm = false;
	let joinEbth = false;
	let joinEgd = false;
	let joinEem = false;
	let joinEem1 = false;
	
	//아이디 중복체크 및 빈칸 방지
	$("#id").change(function(){
		if($("#id").val() == ''){
			$("#warn_id").html("필수 입력 사항입니다.");
			$("#warn_id").css("color", "red");
			$("#id").focus();
			joinEid = false;
		} else{
			$.ajax({
				url:"idCheck",
				data: {
					id: $("#id").val()
					}
			}).done(function(id){
				if($("#id").val() == id){
					$("#warn_id").html("이미 사용중인 아이디 입니다.");
					$("#warn_id").css("color", "red");
					joinEid = false;
				} else{
					$("#warn_id").html("사용 가능한 아이디 입니다.");
					$("#warn_id").css("color", "blue");
					joinEid = true;
				}
			});
		}
		$("#warn_id").show();
	});
	
	// 비밀번호 빈칸 방지
	$("#pw").change(function(){
		let pwval = $("#pw").val();
		if($("#pw").val() == ''){
			$("#warn_pw").html("필수 입력 사항입니다.");
			$("#warn_pw").show();
			$("#pw").focus();
			joinEpw = false;
		}else if(pwval.length < 8){
			$("#warn_pw").html("8자리 이상 입력바랍니다.");
			$("#warn_pw").show();
			joinEpw = false;
		}else{
			$("#warn_pw").hide();
			joinEpw = true;
		}
	});
	
	// 비밀번호 일치 확인
	$("#pw1").keyup(function(){
		if($("#pw1").val() == ''){
			$("#warn_pw1").html("필수 입력 사항입니다.");
			$("#warn_pw1").show();
			$("#pw1").focus();
			joinEpw1 = false;
		}else if($("#pw").val() != $("#pw1").val()){
			$("#warn_pw1").html("비밀번호가 일치하지 않습니다.");
			$("#warn_pw1").show();
			joinEpw1 = false;
		}else{
			$("#warn_pw1").hide();
			joinEpw1 = true;
		}
	});
	
	// 이름 빈칸 방지
	$("#name").change(function(){
		if($("#name").val() == ''){
			$("#warn_name").html("필수 입력 사항입니다.");
			$("#warn_name").css("color", "red");
			$("#warn_name").show();
			$("#name").focus();
			joinEnm = false;
		}else{
			$("#warn_name").hide();
			joinEnm = true;
		}
	});
	
	// 생년월일 빈칸 방지
	$("#birth").change(function(){
		if($("#birth").val() == ''){
			$("#warn_birth").html("필수 입력 사항입니다.");
			$("#warn_birth").css("color", "red");
			$("#warn_birth").show();
			joinEbth = false;
		}else{
			$("#warn_birth").hide();
			joinEbth = true;
		}
	});
	
	// 성별 빈칸 방지
	$("#gender").change(function(){
		if($("#gender").val() == ''){
			$("#warn_gender").html("필수 입력 사항입니다.");
			$("#warn_gender").css("color", "red");
			$("#warn_gender").show();
			joinEgd = false;
		}else{
			$("#warn_gender").hide();
			joinEgd = true;
		}
	});
	
	// 이메일 빈칸 방지
	$("#email").change(function(){
		if($("#email").val() == ''){
			$("#warn_email").html("필수 입력 사항입니다.");
			$("#warn_email").css("color", "red");
			$("#warn_email").show();
			joinEem = false;
		}else{
			$("#warn_email").hide();
			joinEem = true;
		}
	});
	
	// 인증번호 메일 전송
	var code = "";												// 인증번호를 저장하기 위한 코드
	$("#btn_email").click(function(){
		var email_addr = $("#email").val();						// 입력한 이메일 주소
		if( email_addr != '' ){
			$.ajax({
				url:"mailCheck?email=" + email_addr
			}).done(function(data){
				$("#emailChk").attr("readonly", false);			// 인증번호 입력란 활성화
				$("#btn_email").html("재전송");
				code = data;
		    });
		 } else{
				$("#warn_email").html("필수 입력 사항입니다.");
				$("#warn_email").css("color", "red");
				$("#warn_email").show();
				$("#email").focus();
		 }
	});
	
	// 인증번호 비교
	$("#emailChk").change(function(){
		if($("#emailChk").val() == code){			// 일치 
	    	$("#warn_emailChk").html("인증번호가 일치합니다.");
			$("#warn_emailChk").css("color", "blue");
	        $("#email").attr("readonly", "readonly");
	        $("#btn_email").attr("disabled", "disabled");
	        $('#emailChk').attr("readonly", "readonly");
			joinEem1 = true;
	    } else if($("#emailChk").val()==''){
	    	$("#warn_emailChk").html("인증번호를 입력해주세요.");
			$("#warn_emailChk").css("color", "red");
			joinEem1 = false;
	    } else {									// 불일치
	    	$("#warn_emailChk").html("인증번호를 다시 확인해주세요.");
			$("#warn_emailChk").css("color", "red");
			joinEem1 = false;
	    }
		$("#warn_emailChk").show();
	});
	
	// 주소 검색 API
	$("#btn_addr").click(function(){
		new daum.Postcode({
			oncomplete: function(data) { //선택시 입력값 세팅
				document.getElementById("addr1").value = data.address; // 주소 넣기
				$("#addr2").focus();									// 상세주소 입력 포커싱
			}
		}).open();
	})
	
	// 약관 스크롤 확인
	$("#term").scroll(function(){
	    var scrollTop = $(this).scrollTop();
	    var innerHeight = $(this).innerHeight();
	    var scrollHeight = $(this).prop('scrollHeight');
	    
	    if (scrollTop + innerHeight+1 > scrollHeight) {
	    	$("#termChk").attr('disabled', false);
	    }
	});
	
	// 회원가입 버튼 클릭시
	$("#btn_join").click(function(){
		$("#addr").val($("#addr1").val() + ', ' +$("#addr2").val());
		if(joinEid){
			if(joinEpw){
				if(joinEpw1){
					if(joinEnm){
						if(joinEbth){
							if(joinEgd){
								if(joinEem){
									if(joinEem1){
										if($("#termChk").is(":checked")){
											joinFrm.submit();
										}else{
											//alert("약관에 동의해주십시오.");
											swal("약관에 동의해주십시오.", {icon: "error"})
										}
									}else{
										//alert("인증번호를 입력해주세요.");
										swal("인증번호를 입력해주세요",{icon: "error"}).then((value) =>{
											$("#emailChk").focus();
										})
									}
								}else{
									//alert("이메일을 입력해주세요.");
									swal("이메일을 입력해주세요",{icon: "error"}).then((value) =>{
										$("#email").focus();										
									})
								}
							}else{
								//alert("성별을 입력해주세요.");
								swal("성별을 입력해주세요",{icon: "error"}).then((value) =>{
									$("#gender").focus();									
								})
							}
						}else{
							//alert("생년월일을 입력해주세요.");
							swal("생년월일을 입력해주세요",{icon: "error"}).then((value) =>{
								$("#birth").focus();								
							})
						}
					}else{
						//alert("이름을 입력해주세요.");
						swal("이름을 입력해주세요",{icon: "error"}).then((value) =>{
							$("#name").focus();							
						})
					}
				}else{
					//alert("비밀번호를 확인해주세요.");
					swal("비밀번호를 확인해주세요",{icon: "error"}).then((value) =>{
						$("#pw1").focus();						
					})
				}
			}else{
				//alert("비밀번호를 입력해주세요.");
				swal("비밀번호를 입력해주세요.",{icon: "error"}).then((value) =>{
					$("#pw").focus();					
				})
			}
		}else{
			//alert("아이디를 입력해주세요.");
			swal("아이디를 입력해주세요",{icon: "error"}).then((value) =>{
				$("#id").focus();				
			})
		}
	});
</script>