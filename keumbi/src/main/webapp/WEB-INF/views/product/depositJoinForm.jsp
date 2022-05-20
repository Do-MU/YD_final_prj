<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
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
	table{
		margin-left: auto;
		margin-right: auto;
	}
	table td{
		padding:5px 0px 0px 5px;
	}
	textarea{
    	width:100%;
    	height: 6.25em;
    	border: 1px;
    	resize: none;
    	overflow-y:scroll;
    }
	footer {
		width : 100%;
		position : fixed;
		bottom : 0;
	}
	#btn_con{
		text-align:center;
		margin-bottom:50px;
	}
	
	#bank_name,
	#bank_code_std,
	#product_name,
	#bankCodeStd{
		display: none;
	}
	#terms{
		width:500px;
		height:300px;
	}
</style>
</head>
<body>
<section class="banner_area"></section>

<section class="insert">
	<form action="depositJoin" id="depositJoin" name="depositJoin" method="post">
		<h1>예금상품 약관</h1>
		<table>
			<tr>
				<td>
					<c:forEach var="dt" items="${depTerms }">
						<c:if test="${dt.term_name eq 'AD'}">	
							<textarea id="terms" name="terms">이 예금거래기본약관(이하 '이 약관'이라 합니다)은 ${depBase.kor_co_nm}${dt.term_contents}
							</textarea><br>
						</c:if>
					</c:forEach>
					<input type="checkbox" id="termsCheck" disabled>
					<label>위 약관을 확인하였으며, 이에 동의합니다.</label>
				</td>
				<td>
					<input type="text" id="bank_name" name="bank_name" value="${depBase.kor_co_nm }">
					<c:forEach var="code" items="${code}">
						<c:if test="${code.val eq depBase.kor_co_nm}">
							<input type="text" id="bank_code_std" name="bank_code_std" value="${code.code}">
						</c:if>
					</c:forEach>
					<input type="text" id="product_name" name="product_name" value="${depBase.fin_prdt_nm }">
				</td>
			</tr>
		</table>
		<br>
		<div id="btn_con">
			<button type="button" id="back" type="button">취소</button>
			<button type="button" class="btn-primary" id="join">상품가입</button>
		</div>
	</form>
</section>
<script>
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
	
	//취소버튼(이전페이지)
	$("#back").click(function(){
		history.back();
	});
	
	//가입하기버튼
	$("#join").click(function(){
		if (!'${loginUser}') {
			alert('로그인이 필요합니다.');
			window.location = "userLoginForm";
		} 
		
		var tCheck = $("#termsCheck").prop('checked');
		
		
		if(tCheck == true){	
				alert("가입이 완료되었습니다.");
				
				document.getElementById("depositJoin").submit();
		}
	})
</script>
</body>
</html>