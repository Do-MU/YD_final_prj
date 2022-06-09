<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.contact_area>.container {
	min-height: 410px;
}
.btnGroup {
	float : right;
}
</style>
<body>

	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>1:1 문의 작성</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">

			<form id="qnaInsertFrm" name="qnaForm" method="post"
				action="qnaInsert">
				<input type="hidden" name="user_id" value="${loginUser.id}">

				<div class="form-group">
					<label for="exampleFormControlTextarea1">제목</label> <input
						type="text" class="form-control" id="titleArea"
						placeholder="제목을 입력하세요." name="title" required="required"></input>
				</div>
				<br>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						placeholder="내용을 입력하세요." name="qcontents" rows="7"
						required="required"></textarea>
				</div>
			</form>
			<div class="btnGroup">
				<button id="backBtn" type="button" class="btn btn-secondary">뒤로가기</button>
				<input id="insertBtn" type="submit" class="btn btn-primary"
					value="등록하기">
			</div>
		</div>
	</section>
	<script type="text/javascript">
		//뒤로가기 버튼
		$("#backBtn").click(function() {
			history.back();
		})

		//등록 버튼
		$("#insertBtn").click(function() {
			var form = document.qnaForm;
			if (form.title.value) {
				if(form.qcontents.value){
					swal("등록하시겠습니까?").then((value) => {
						swal("등록되었습니다.", {icon: 'success'}).then((value) => {
							qnaInsertFrm.action = "qnaInsert";
							qnaInsertFrm.method = "post";
							qnaInsertFrm.submit();
						})
					})
				}else{
					swal("내용을 입력하세요", {icon: 'error'}).then((value) => {
						$("#exampleFormControlTextarea1").focus();
						return;
					})				
				}
			}else{
				swal("제목을 입력해주세요", {icon: 'error'}).then((value) => {
					$("#titleArea").focus();
					return;
				});		
			}
		})
	</script>

</body>
</html>