<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script>
function goUp(){
	
console.log($("#user_id").val());
 
 $frm =  $("#id");
 $frm.attr("action","boardUpdate");
 $frm.attr("target","_self");
 $frm.submit(); 
 
 }
</script> 
<div class="container">
	<div class="row">
	<form id="user_id" name="id" method="post">
		<input type="hidden" id="user_id" name="user_id" value="${list}">
		

		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${list.wdate }</td>
					</tr>
					<tr>
						<td style="width: 20%; ">글 제목</td>
						<td colspan="2">${list.title }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: center;">${list.contents }</td>
					</tr>
				</tbody>
			</table>
			<a href="boardList" class="btn btn-primary">목록보기</a>
			<c:if test="${author eq 'admin'}">				
				<!-- <a href="noticeUpdate.do" class="btn btn-primary">수정</a>
				<a href="noticeDelete.do" type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')"  class="btn btn-primary">삭제</a>  -->
				<button type="button" class="btn btn-primary" onclick="goUp()">수정</button>
				<button type="submit" onclick="return confirm('정말로 삭제하시겠습니까?')" formaction="boardDelete.do?id=${view.user_id }" class="btn btn-primary">삭제</button>
			</c:if>
	</form>
	</div>
	</div>