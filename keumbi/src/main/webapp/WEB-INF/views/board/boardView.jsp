<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>뷰</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

</style>

</head>
<body>
<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>게시판 보기</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
<br>
<br>

<!-- <script>
function goUp(){
	
console.log($("#user_id").val());
 
 $frm =  $("#id");
 $frm.attr("action","boardUpdate");
 $frm.attr("target","_self");
 $frm.submit(); 
 
 }
</script>  -->
<div class="container">
	<div class="row">
	<form id="id" name="id" method="post" style="width:1180px; text-align:center;">
		<input type="hidden" id="user_id" name="user_id" value="${list}">
		

		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd ">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center; height: 50px;"><strong>${view.user_id}</strong>님의 &nbsp 게시글</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2" >${view.wdate }</td>
					</tr>
					<tr>
						<td style="width: 20%; ">글 제목</td>
						<td colspan="2">${view.title }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;">${view.contents }</td>
					</tr>
				</tbody>
			</table>
			<a href="boardList" role="button" class="btn btn-outline-info" style="float: right;">목록보기</a>
			<%-- <c:if test="${author eq 'admin'}">	 --%>			
				<!-- <a href="noticeUpdate.do" class="btn btn-primary">수정</a>
				<a href="noticeDelete.do" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')"  class="btn btn-primary">삭제</a>  -->
				<!-- <button role="button" class="btn btn-outline-info" onclick="goUp()" style="float: right;">수정</button> -->
				<a href="./delete?bod_num=${view.bod_num}" role="button" class="btn btn-outline-info pull-right delete_btn"  onclick="return confirm('정말로 삭제하시겠습니까?')" style="float: right;">삭제</a>
				<a href="./update?bod_num=${view.bod_num}" role="button" class="btn btn-outline-info" style="float: right;" onclick="return confirm('수정페이지로 이동하시겠습니까?')">수정</a>
				<%-- <button role="button" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')" formaction="./boardDelete?id=${view.user_id }" class="btn btn-outline-info pull-right delete_btn" style="float: right;">삭제</button> --%>
			<%-- </c:if> --%>
	</form>
	</div>
	</div>
	
	<br>
	<br>
	
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
	</script> -->		
	
</body>
</html>