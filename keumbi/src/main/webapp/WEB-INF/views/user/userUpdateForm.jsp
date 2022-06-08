<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.banner_area {
	padding-bottom: 100px;
}

table {
	margin-left: auto;
	margin-right: auto;
}

#div_kwd {
	width: 25%;
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

.btn_label {
	padding: 30px;
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
<section>
	<form id="userFrm" action="userUpdate" method="post"
		onsubmit="return false">
		<table>
			<tr>
				<td width="151px">아이디</td>
				<td><input type="text" id="id" name="id"
					value="${loginUser.id}" readonly="readonly"></td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td><input type="password" id="password1" name="pw"
					readonly="readonly" value="${loginUser.pw}" min="8"> <input
					type="button" id="pwUpdate" value="비밀번호 변경"
					class="btn btn-secondary" style="height: 32px"></td>
			</tr>

			<tr id="pw2" style="display: none;">
				<td>비밀번호 확인</td>
				<td><input type="password" id="password2" min="8"></td>
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
					value="${loginUser.name}"></td>
			</tr>

			<tr>
				<td>주민등록번호</td>
				<td>
					<div>
						<input type="text" id="birth" name="birth" readonly="readonly"
							value="${loginUser.birth}">
					</div>
				</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td><input class="mail_input" type="email" id="email"
					name="email" maxlength="30" readonly="readonly"
					value="${loginUser.email}">
					<button class="mail_update_btn btn btn-secondary" type="button"
						style="height: 32px">이메일 변경</button></td>
			</tr>
			<tr id="mail_check" style="display: none;">
				<td>이메일 인증번호</td>
				<td><input id="mail_check_input" disabled="disabled"
					type="text" name="emailCheck" maxlength="6"> <input
					id="mail_check_btn_result" type="button" value="확인"
					class="btn btn-secondary" style="height: 32px"><br> <label
					id="result" style="display: none"></label></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" id="phone" name="phone"
					value="${loginUser.phone}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="addr_1" name="addr_1"> <input
					id="addrBtn" type="button" value="주소검색" class="btn btn-secondary"
					style="height: 32px"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" id="addr_2" name="addr_2" required>
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
							class="keyword"> <label>${c.val}</label>
					</div>
				</c:forEach>
			</div>
		</div>
	</form>
	<div id="btn_div">
		<label class="btn_label">
			<button type="button" class="btn btn-primary" id="userUpdateBtn">수정</button>
		</label> <label class="btn_label"> <c:if
				test="${empty loginUser.signoutdate}">
				<button type="button" class="btn btn-danger" id="userDelete">회원탈퇴</button>
			</c:if> <c:if test="${not empty loginUser.signoutdate}">
				<button type="button" class="btn btn-danger" id="userCancle">탈퇴철회</button>
			</c:if>
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
		swal("회원정보 수정완료", "입력하신 정보로 수정되었습니다.", "success").then((value) => {
			document.getElementById("userFrm").submit();
		});
	}
})

//회원탈퇴
$("#userDelete").click(function(){
 /*  confirm("정말 탈퇴하시겠습니까?");
   $("#userFrm").attr("action", "userDelete");
   $("#userFrm").submit();
   confirm("7일간의 탈퇴 유예기간 후 모든정보가 삭제됩니다."); */
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
			    swal("탈퇴신청을 취소하셨습니다.");
		  	}
		});
	});

//탈퇴철회
$("#userCancle").click(function(){
	swal({
		  title: "철회하시겠습니까?",
		  text: "7일의 유예기간이 지나지않아 철회가 가능합니다.",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		  closeOnClickOutside: false
		}).then((willDelete) => {
		  if (willDelete) {
		    swal("탈퇴철회신청이 완료되었습니다.", {
		      icon: "success",
		      closeOnClickOutside: false
		    }).then((value) => {
		    	$("#userFrm").attr("action", "userCancle");
			    document.getElementById("userFrm").submit();
		    });
		  } else {
		    swal("탈퇴철회를 취소하셨습니다.");
		  }
		});
})

// 탈퇴유저가 페이지 이동시 수정폼으로 감 (수정중)
$(window).on('beforeunload', function(e){
	if(document.getElementById("userCancle")){
		console.log("탈퇴철회");
		window.location = "userUpdateForm";
	}else{
		console.log("페이지를 벗어납니다.")
	}
})
</script>