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

</style>
</head>
<body>
<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>예금상품추천</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<c:forEach var="pd" items="${prdDepBase}" varStatus="status">
		<div class="depositList">
			<div id="bankName">${pd.kor_co_nm}</div>
			<div id="depName">${pd.fin_prdt_nm}</div>
			<div id="group" style="border-bottom: 1px solid; display: inline-block;">
				${pd.join_way }
				<button type="button" class="btn btn-join">가입하기</button>
				<button type="button" class="btn btn-select" data-toggle="modal" id="selModal">상세보기</button>
				<input type="button" class="btn btn-select" data-toggle="modal" value="상세보기" class="selModal">	
			</div>
		</div>
		<br>
		
		<div class="modal fade" id="modal" tabindex="-1"
		 role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">${pd.kor_co_nm}</h3>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<div id="depositOpt"></div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">가입하러가기</button>
					</div>
				</div>
			</div>
  		</div>
	</c:forEach>
	
	<script>
		
	</script>
</body>
</html>