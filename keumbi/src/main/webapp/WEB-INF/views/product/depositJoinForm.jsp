<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<section class="banner_area"></section>

<section class="insert">
	<form action="depositJoin" id="depositJoin" name="depositJoin" method="post">
		<h1>예금상품 약관</h1>
		
		<table>
			<tr>
				<td>
					<textarea id="terms" name="terms">
						${depTerms}
					</textarea><br>
					<input type="checkbox" id="termsCheck" disabled>
					<label>위 약관을 확인하였으며, 이에 동의합니다.</label>
				</td>
			</tr>
		</table>
		<br>
		<div id="btn_con">
			<input id="back" type="button" value="취소">  <input class="btn-primary" type="button" id="join" value="상품가입"/>
		</div>
	</form>
</section>
</body>
</html>