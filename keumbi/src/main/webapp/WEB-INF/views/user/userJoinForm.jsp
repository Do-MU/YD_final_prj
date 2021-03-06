<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	#btn_con{
		text-align:center;
		margin-bottom:50px;
	}
	
	table{
		margin-left:auto;
		margin-right:auto;
	}
	
	table td{
		padding:5px 0px 0px 5px;
	}
	.banner_area {
		position: relative;
		z-index: 1;
		min-height: 120px;
		background-image: -moz-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
		background-image: -webkit-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
		background-image: -ms-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
		margin-bottom: 50px;
	}

	h1{
		margin-top:50px;
		margin-bottom:50px;
		text-align:center;
	}
	
	#birth{
        width:70px;
    }
    
    #gender_code{
        width:20px;
    }
    
    #keyword td{
    	padding:0px 5px;
    }
    
    textarea{
    	width:100%;
    	height: 6.25em;
    	border: none;
    	resize: none;
    	overflow-y:scroll;
    }
    
    .correct{
    	color : blue;
	}
	
	.incorrect{
    	color : red;
	}
	
	#addr{
		display:none;
	}
	
	footer {
		width : 100%;
		position : fixed;
		bottom : 0;
	}
	
	.col-3{
		margin: auto;
	}
</style>

<section class="banner_area">

</section>

<section class="Insert">
    <form action="userJoin" id="userJoin" name="userJoin" method="post">
    	<h1>금비 회원가입</h1>
        <table>
            <tr>
                <td>아이디</td>
                <td>
                    <input type="text" id="id" name="id" required>
                    <input type="button" id="idCheck" value="아이디중복확인">
                </td>
            </tr>
                        
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" id="password1" name="pw" required>
                </td>
            </tr>
             
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" id="password2" required>
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
                    <input type="text" name="name" required>
                </td>
            </tr>
                    
            <tr>
    	        <td>주민등록번호</td>
                <td>
        	 	   <div>
                   	   <input type="text" id="birth" name="birth" maxlength="6" required>
                   	   <span>-</span>
                       <input type="text" id="gender_code" name="gender_code" maxlength="1" required>
                       <span>* * * * * *</span>
                    </div>
                </td>
            </tr>
                    
            <tr>
                <td>이메일</td>
                <td>
                   <input class="mail_input" type="email" name="email" maxlength="30" required>
                   <input class="mail_check_btn" type="button" value="인증번호 전송"> 
                </td>
            </tr>
            <tr>
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
                    <input type="text" name="phone" required>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td>
                    <input type="text" id="addr_1" name="addr_1" required>
                    <input id="addrBtn" type="button" value="주소검색">
                </td>
            </tr>
            <tr>
            	<td>상세주소</td>
            	<td>
            		<input type="text" id="addr_2" name="addr_2" required>
            		<input type="text" id="addr" name="addr">
            	</td>
            </tr>
            <tr>
            	<td>관심키워드</td>
            	<td>
            		<table id="keyword">
	            		<tr>
	            			<td>
			            		<input type="checkbox" value="K001" name="keyword">
			  					<label>차</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K002" name="keyword">
			  					<label>애완동물</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K003" name="keyword">
			  					<label>카페</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K004" name="keyword">
			  					<label>주식</label>
			  				</td>
			  			</tr>
			  			<tr>
							<td>
			            		<input type="checkbox" value="K005" name="keyword">
			  					<label>코인</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K006" name="keyword">
			  					<label>게임</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K007" name="keyword">
			  					<label>여행</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K008" name="keyword">
			  					<label>전자제품</label>
			  				</td>
			  			</tr>
			  			<tr>
			  				<td>
			            		<input type="checkbox" value="K009" name="keyword">
			  					<label>영화</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K010" name="keyword">
			  					<label>옷</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K011" name="keyword">
			  					<label>신발</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K012" name="keyword">
			  					<label>의약품</label>
			  				</td>
			  			</tr>
			  			<tr>
			  				<td>
			            		<input type="checkbox" value="K013" name="keyword">
			  					<label>SNS</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K014" name="keyword">
			  					<label>스포츠</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K015" name="keyword">
			  					<label>부동산</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K016" name="keyword">
			  					<label>문화생활</label>
			  				</td>
			  			</tr>	
			  			<tr>
			  				<td>
			            		<input type="checkbox" value="K017" name="keyword">
			  					<label>교육</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K018" name="keyword">
			  					<label>보험</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K019" name="keyword">
			  					<label>앤티크</label>
			  				</td>
			  				<td>
			            		<input type="checkbox" value="K020" name="keyword">
			  					<label>외식</label>
			  				</td>
			  			</tr>
            		</table>
            	</td>
            </tr>
            <tr>
            	<td>이용약관</td>
            	<td>
            		<textarea id="terms" name="terms">
        
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		asdsadasddasdassadd
            		
            		</textarea><br>
					<input type="checkbox"  id="termsCheck" disabled>
					<label>위 약관을 확인하였으며, 이에 동의합니다.</label>
				</td>
        </table>
        <br>
		<div id="btn_con">
        	<input id="back" type="button" value="취소">  <input class="btn-primary" type="button" id="join" value="회원가입"/>
		</div>
    </form>
</section>
</html>
<script>
	//비밀번호 확인
	$(function(){ 
		$("#success").hide();
		$("#fail").hide();
		$("input").keyup(function(){
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

	
	//약관 스크롤
	$("#terms").scroll(function(){
	    var scrollTop = $(this).scrollTop();
	    var innerHeight = $(this).innerHeight();
	    var scrollHeight = $(this).prop('scrollHeight');
	    
	    if (scrollTop + innerHeight+1 <= scrollHeight) {
	    	$("#termsCheck").attr('disabled', true);
	    } else {
	    	$("#termsCheck").attr('disabled', false);
	    }
	});
	
	//아이디 중복체크
	$("#idCheck").on('click', function(){
		$.ajax({
			url:"idCheck",
			data: { id: $("#id").val() }
		}).done(function(message){
			if(message == "이미 사용중인 아이디 입니다."){
				alert(message);
			}else{
				$("#idCheck").attr("disabled", "disabled");
				$("#id").attr("readonly", "readonly");
				$("#password1").focus();
				alert(message);
			}
		});
	});
	
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
	        checkResult.attr("class", "correct");
	        inputCode.attr("readonly", "readonly");
	        codeBtn.attr("disabled", "disabled");
	        resultCode.attr("readonly", "readonly");
	        resultBtn.attr("disabled", "disabled");
	    } else {                                            // 일치하지 않을 경우
	    	checkResult.html("인증번호를 다시 확인해주세요.");
	        checkResult.attr("class", "incorrect");
	        resultCode.val('');
	    }
	});
	
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
	
	//취소버튼(이전페이지)
	$("#back").click(function(){
		history.back();
	})
	
	
	//회원가입버튼
	$("#join").click(function(){
		var idBtn = document.getElementById("idCheck").getAttribute("disabled");
		var emailBtn = $(".mail_check_btn_result").attr("disabled");
		var tCheck = $("#termsCheck").prop('checked');
		
		if(idBtn == 'disabled'){
			if(emailBtn == 'disabled'){
				if(tCheck == true){
					$("#addr").val($("#addr_1").val() + ', ' +$("#addr_2").val());  
					document.getElementById("userJoin").submit();
				}else{
					alert("약관동의 체크를 해주세요.");
				}
			}else{
				alert("이메일 인증을 해주세요.");
			}	
		}else{
			alert("아이디 중복체크를 해주세요.");
		}
		
	})
	
	
</script>