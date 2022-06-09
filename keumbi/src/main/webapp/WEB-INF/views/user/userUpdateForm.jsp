<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
table {
	margin-left: auto;
	margin-right: auto;
}

#div_kwd {
	width: 33%;
	margin: 0 auto;
	padding-bottom: 50px;
}

.correct {
	color: blue;
}

.incorrect {
	color: red;
}

#btn_div {
	text-align: center;
}

.btn_label{
	padding: 30px;
}

tr > td {
	font-size:1.5em;
	font-weight:bold;
}

td {
	padding-bottom: 20px;
}

td > #id {
	background: #dcdcdc;
}

td > #name {
	background: #dcdcdc;
}

div > #birth {
	background: #dcdcdc;
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
input[type="checkbox"]{
	width: 25px;
	height: 25px;
	cursor: pointer;
}
.keywordval{
	font-size:1.5em;
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>회원정보 수정</h2>
					<div class="page_link">
						<a href="home">Home</a> <a href="userUpdateForm">회원정보 수정</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<form id="userFrm" action="userUpdate" method="post"
		onsubmit="return false">
		<table>
			<tr>
				<td width="250px">아이디</td>
				<td width="450px"><input type="text" id="id" name="id"
					value="${loginUser.id}" readonly="readonly" style="width:300px; height:40px"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password1" name="pw"
					readonly="readonly" value="${loginUser.pw}" min="8" style="width:300px; height:40px"> <input
					type="button" id="pwUpdate" value="비밀번호 변경" style="width:130px; height:40px; margin-bottom:5px;"
					class="btn btn-secondary"></td>
			</tr>

			<tr id="pw2" style="display: none;">
				<td>비밀번호 확인</td>
				<td><input type="password" id="password2" min="8" style="width:300px; height:40px"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<p style="color: red" id="fail">비밀번호가 일치하지 않습니다.</p>
					<p style="color: blue" id="success">비밀번호가 일치합니다.</p>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="name" name="name" readonly="readonly"
					value="${loginUser.name}" style="width:300px; height:40px"></td>
			</tr>

			<tr>
				<td>주민등록번호</td>
				<td>
					<div>
						<input type="text" id="birth" name="birth" readonly="readonly"
							value="${loginUser.birth}" style="width:300px; height:40px">
					</div>
				</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input class="mail_input" type="email" id="email"
					name="email" maxlength="30" readonly="readonly"
					value="${loginUser.email}" style="width:300px; height:40px">
					<button class="mail_update_btn btn btn-secondary" type="button"
						style="width:130px; height:40px; margin-bottom:5px;">이메일 변경</button></td>
			</tr>
			<tr id="mail_check" style="display: none;">
				<td>이메일 인증번호</td>
				<td><input id="mail_check_input" disabled="disabled"
					type="text" name="emailCheck" maxlength="6" style="width:300px; height:40px"> <input
					id="mail_check_btn_result" type="button" value="확인"
					class="btn btn-secondary" style="height: 32px"><br> <label
					id="result" style="display: none"></label></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone"
					value="${loginUser.phone}" style="width:300px; height:40px"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="addr_1" name="addr_1" style="width:300px; height:40px"> <input
					id="addrBtn" type="button" value="주소검색" class="btn btn-secondary"
					style="width:130px; height:40px; margin-bottom:5px;"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" id="addr_2" name="addr_2" required style="width:300px; height:40px">
					<input type="hidden" id="addr" name="addr"></td>
			</tr>
			<tr>
				<td>관심키워드</td>
			</tr>
		</table>
		<!-- 관심 키워드 -->
		<div class="wrapper" id="div_kwd">
			<hr>
			<div class="row">
				<c:forEach var="c" items="${code}">
					<div class="col-md-3" style="width: 25%; text-align: left;">
						<input type="checkbox" value="${c.code}" name="keyword"
							class="keyword"> <label class="keywordval">${c.val}</label>
					</div>
				</c:forEach>
			</div>
		</div>
	</form>
	<div id="btn_div">
		<label class="btn_label">
			<button type="button" class="btn btn-primary" id="userUpdateBtn" style="width:130px; height:50px; font-size:20px; font-weight:bold;">수정</button>
		</label> 
		<label class="btn_label"> 
				<button type="button" class="btn btn-danger" id="userDelete" style="width:130px; height:50px; font-size:20px; font-weight:bold;">회원탈퇴</button>
		</label>
	</div>
</section>

<script>
   //비밀번호 변경
   $("#success").hide();
   $("#fail").hide();
   $("#pwUpdate").click(function(){
      $("#pw2").css("display", "");
      $("#password1").removeAttr("readonly");
      $("#password1").val("");
      $("#password1").attr("placeholder", "새비밀번호를 입력하세요.");
      $("#password2").keyup(function(){
         pwCheck();
      })
      $("#password1").keyup(function(){
         pwCheck();
      })
   });

   function pwCheck(){
      var pwd1=$("#password1").val();
      var pwd2=$("#password2").val();
      if(pwd2 != ""){ 
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
   }

	//이메일 체크버튼
	var code = "";					//이메일전송 인증번호 저장위한 코드
	$(".mail_update_btn").on('click', function(){
		
	    if($(".mail_update_btn").hasClass("mail_check_btn")){
	    	$(".mail_check_btn").text("재전송");
	    	$("#mail_check").css("display", "");
		    
		    var email = $(".mail_input").val();         // 입력한 이메일
	        var checkBox = $("#mail_check_input");        // 인증번호 입력란
	        var mailbtn = $("#mail_check_btn");         //인증번호 발송 버튼
	        
	        $.ajax({
	            type:"GET",
	            url:"mailCheck?email=" + email,
	            success:function(data){
	                checkBox.attr("disabled", false);
	                code = data;
	            }
	        });
	        
	    }else{
	    	$(".mail_input").removeAttr("readonly");
		    $(".mail_input").val("");
		    $(".mail_input").focus();
		    $(".mail_update_btn").text("인증번호 전송");
		    $(".mail_update_btn").addClass("mail_check_btn btn btn-secondary");
	    }
	})
	
   
/* 인증번호 비교 */
   $('#mail_check_btn_result').on('click',function(){
       var inputCode = $(".mail_input");              // 이메일 입력값   
       var iCode = $("#mail_check_input").val();        // 인증코드 값  
       var codeBtn = $("#mail_check_btn");            //인증번호 발송 버튼
       var checkResult = $("#result");                // 인증번호 결과
       var resultCode = $("#mail_check_input");          // 인증번호 입력란
       var resultBtn = $("#mail_check_btn_result");         // 인증번호 확인 버튼
       checkResult.css("display", "");
       
       if(iCode != code){   	                         // 일치하지 않을 경우
    	   checkResult.html("인증번호를 다시 확인해주세요.");
           checkResult.attr("class", "incorrect");
           resultCode.val('');
       } else {                                            // 일치할 경우    	   
           checkResult.html("인증번호가 일치합니다.");
           checkResult.attr("class", "correct");
           inputCode.attr("readonly", "readonly");
           codeBtn.attr("disabled", "disabled");
           resultCode.attr("readonly", "readonly");
           resultBtn.attr("disabled", "disabled");
       }
   });

// 주소
var addr = "${loginUser.addr}";
var addr1 = addr.split(", ");
$("#addr_1").val(addr1[0]); 
$("#addr_2").val(addr1[1]); 

//주소api
window.onload = function(){
   $("#addrBtn").click(function(){
      new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
               document.getElementById("addr_1").value = data.address; // 주소 넣기
                $("#addr_2").focus(); //상세입력 포커싱
            }
        }).open();
   })
}

// 유저 키워드
$.ajax({
   type:"GET",
   url:"selectUserKwdCode",
}).done(function(data){
   for(d of data){
      for(k of $(".keyword")){
         if(d.code == k.value){
            k.setAttribute("checked", true);
         }
      }
   }
})

//회원정보 수정
$("#userUpdateBtn").click(function(){
	$("#addr").val($("#addr_1").val() + ', ' + $("#addr_2").val());
	var pwd1=document.getElementById("password1").value;
	var pwd2=$("#password2").val();
	var pwdMin=$("#password1").val().length;
	if(pwd2 != ''){
		if(pwd1 == pwd2){
			if(pwdMin >= 8){
				swal("회원정보 수정완료", "입력하신 정보로 수정되었습니다.", "success").then((value) => {
					document.getElementById("userFrm").submit();
				});
			}else{
				swal("비밀번호는 8자 이상 입력해주세요", {icon:"error"});
			}
		}else{
			swal("비밀번호가 일치하지않습니다.", {icon:"error"});
		}
	}else{
		swal("비밀번호를 확인해주세요.", {icon:"error"}).then((value) => {
			$("#password2").focus();
		});
	}
})

//회원탈퇴
$("#userDelete").click(function(){
	swal({
		  title: "탈퇴하시겠습니까?",
		  text: "탈퇴하시면 금비혜택을 더이상 받을 수 없게됩니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		  closeOnClickOutside: false
		}).then((willDelete) => {
		  	if (willDelete) {
		    	swal("7일간의 유예기간 후 모든정보가 삭제됩니다.", {
			      	icon: "success",
			      	closeOnClickOutside: false
		    	}).then((value) => {
		    		if(value){
					    $("#userFrm").attr("action", "userDelete");
					    document.getElementById("userFrm").submit();
		    		}
		    	});
		  	} else {
			    swal("탈퇴신청을 취소하셨습니다.", {icon: "success"});
		  	}
		});
	});
</script>