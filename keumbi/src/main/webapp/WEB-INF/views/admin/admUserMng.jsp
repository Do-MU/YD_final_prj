<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.container{
	text-align:center;
}

table{
	margin:0 auto;
	width:90%;
	border:1px solid;
}

th{
	border:1px solid;
}

td{
	border:1px solid;
}
</style>

<div class="container">
	<h3>회원관리</h3>
	<div>
		<select>
			<option>전체회원</option>
			<option>일반회원</option>
			<option>제재회원</option>
			<option>탈퇴요청</option>
		</select>
		<select>
			<option>아이디</option>
			<option>제재일자</option>
			<option>제재기간</option>
		</select>
		<input type="text" placeholder="내용을 입력해주세요.">
		<button type="button">검색</button>
	</div>
	<div>
		<table>
			<tr>
				<th>#</th>
				<th>아이디</th>
				<th>회원상태</th>
				<th>제재사유</th>
				<th>제재일자</th>
			</tr>
			<c:forEach var="u" items="${userList}">
				<tr>
					<td><input type="checkbox"></td>
					<td>${u.id}</td>
					<td>${u.uval}</td>
					<td>${u.sval}</td>
					<c:set var="sdate" value="${u.sdate}"/>
					<td><fmt:formatDate value="${sdate}" dateStyle="default"/></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<script>

</script>