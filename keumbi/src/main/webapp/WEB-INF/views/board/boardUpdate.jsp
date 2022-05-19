<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>뷰</title>

</head>

<body>
<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>게시판 수정하기</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
<br>
<br>

<div class="container">
	<div class="row">
		<form method="post" action="boardView" style="width:1180px; text-align:center;">
			<input type="hidden" id="user_id" name="user_id" value="${up.user_id}">
			<%-- <input type="hidden" id="nid" name="nid" value="${notice.NId }"> --%>



			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2"
							style="background-color: #eeeeee; text-align: center;">게시판 글
							보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${up.wdate}</td>
					</tr>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><input type="text" style="width:900px;" value="${up.title}"
							name="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;"><input
							type="text" style="width:900px; height: 200px;" value="${up.contents}" name="contents"></td>
					</tr>
				</tbody>
			</table>

			<a href="boardList" role="button" class="btn btn-outline-info" style="float: right;">목록보기</a>
			<a href="boardView?bod_num=${up.bod_num}" role="button" class="btn btn-outline-info" style="float: right;" onclick="return confirm('수정을 취소하시겠습니까?')">취소</a>
			<button type="submit" class="btn btn-outline-info" style="float: right;">수정완료</button>

		</form>
	</div>
</div>

	<br>
	<br>

</body>
</html>