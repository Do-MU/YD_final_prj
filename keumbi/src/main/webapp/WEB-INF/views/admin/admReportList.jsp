<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	background-color:#e9ecef;
}

td{
	border:1px solid;
}
</style>
<div class="container">
	<h1>신고목록</h1>
	<table>
		<thead>
			<tr>
				<th>#</th>
				<th>신고내용</th>
				<th>신고일자</th>
				<th>제재대상</th>
				<th>신고자</th>
				<th>정지일수</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>