<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.banner_area{
	padding-bottom:100px;
}

table{
	margin-left:auto;
	margin-right:auto;
}

#div_kwd{
	width:25%;
	margin:0 auto;
}

#correct{
  	color : blue;
}
	
#incorrect{
  	color : red;
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>회원정보 수정</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="userUpdateForm">회원정보 수정</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section>
        <table>
            <tr>
                <td width="151px">아이디</td>
                <td>
                    <input type="text" id="id" name="id" value="${loginUser.id}" readonly="true">
                </td>
            </tr>
                        
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" id="password1" name="pw" readonly="true" value="${loginUser.pw}">
                    <input type="button" id="pwUpdate" value="비밀번호 변경">
                </td>
            </tr>
             
            <tr id="pw2" style="display:none;">
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" id="password2">
                </td>
            </tr>
            <tr>
            	<td>
            	</td>
            	<td>
					<p style=color:red id="fail">비밀번호가 일치하지 않습니다.</p>
                	<p style=color:blue id="success">비밀번호가 일치합니다.</p>
            	</td>
            </tr>    
            <tr>
                <td>이름</td>
                <td>
                    <input type="text" name="name" readonly="true" value="${loginUser.name}">
                </td>
            </tr>
                    
            <tr>
    	        <td>주민등록번호</td>
                <td>
        	 	   <div>
                   	   <input type="text" id="birth" name="birth" readonly="true" value="${loginUser.birth}">
                   </div>
                </td>
            </tr>
                    
            <tr>
                <td>이메일</td>
                <td>
                   <input class="mail_input" type="email" name="email" maxlength="30" readonly="true" value="${loginUser.email}">
                   <input class="mail_check_btn" type="button" value="이메일 변경"> 
                </td>
            </tr>
            <tr id="mail_check" style="display:none;">
            	<td>이메일 인증번호</td>
                <td>
                	<input class="mail_check_input" disabled="disabled" type="text" name="emailCheck" maxlength="6">
                	<input class="mail_check_btn_result" type="button" value="확인"><br>
                	<label id="result" style="display:none"></label>
                </td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>
                    <input type="text" name="phone" value="${loginUser.phone}">
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" id="addr_1" name="addr_1">
                    <input id="addrBtn" type="button" value="주소검색">
                </td>
            </tr>
            <tr>
            	<td>상세주소</td>
            	<td>
            		<input type="text" id="addr_2" name="addr_2" required>
            	</td>
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
		            	<div class="col-md-3" style="width:25%; text-align:left;">
		            		<input type="checkbox" value="${c.code}" name="keyword">
						  	<label>${c.val}</label>
		            	</div>
		            </c:forEach>
				</div>
			</div>
</section>
<script>
//비밀번호 확인
$(function(){ 
	$("#success").hide();
	$("#fail").hide();
	$("#password1").keyup(function(){
		var pwd1=$("#password1").val();
		var pwd2=$("#password2").val();
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

//비밀번호 변경
$("#pwUpdate").click(function(){
	$("#pw2").css("display", "");
	$("#password1").removeAttr("readonly");
})


$(".mail_check_btn").click(function(){
	$(".mail_input").removeAttr("readonly");
	$(".mail_check_btn").val("인증번호 발송");
	$("#mail_check").css("display", "");
	
})

//인증번호 메일 전송
	var code = "";                //이메일전송 인증번호 저장위한 코드
	$(".mail_check_btn").click(function(){
		 var email = $(".mail_input").val();			// 입력한 이메일
		 var cehckBox = $(".mail_check_input");        // 인증번호 입력란
		 var mailbtn = $(".mail_check_btn");			//인증번호 발송 버튼
		 $.ajax({
		        type:"GET",
		        url:"mailCheck?email=" + email,
		        success:function(data){
		        	cehckBox.attr("disabled", false);
		        	mailbtn.val("재전송");
		        	code = data;
		        }
		 });
	});
	
/* 인증번호 비교 */
	$('.mail_check_btn_result').click(function(){
		var inputCode = $(".mail_input");        		// 이메일 입력값   
		var iCode = $(".mail_check_input").val();        // 인증코드 값  
	    var codeBtn = $(".mail_check_btn");				//인증번호 발송 버튼
	    var checkResult = $("#result");    				// 인증번호 결과
	    var resultCode = $(".mail_check_input");    		// 인증번호 입력란
	    var resultBtn = $(".mail_check_btn_result");			// 인증번호 확인 버튼
	    checkResult.css("display", "");
	    
	    if(iCode == code){                            // 일치할 경우
	    	checkResult.html("인증번호가 일치합니다.");
	        checkResult.attr("id", "correct");
	        inputCode.attr("readonly", "readonly");
	        codeBtn.attr("disabled", "disabled");
	        resultCode.attr("readonly", "readonly");
	        resultBtn.attr("disabled", "disabled");
	    } else {                                            // 일치하지 않을 경우
	    	checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("id", "incorrect");
	        resultCode.val('');
	    }
	});

// 주소
var addr = "${loginUser.addr}";
var addr1 = addr.split(", ");
$("#addr_1").val(addr1[0]); 
$("#addr_2").val(addr1[1]); 

// 코드

</script>