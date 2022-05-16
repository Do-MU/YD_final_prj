<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>

<style>
.banner_area_login {
	position: relative;
	z-index: 1;
	min-height: 120px;
	background-image: -moz-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
	background-image: -webkit-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
	background-image: -ms-linear-gradient(0deg, #766dff 0%, #88f3ff 100%);
	margin-bottom: 80px;
}

* {
	text-align: center;
}

#editor {
	border: 1px solid;
	width: 50%;
	margin: 0 auto;
}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</head>
<body>

<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">											
				<div class="container">
					<div class="banner_content text-center">
					<h3>글쓰기</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
						
						<div class="container" style="margin:auto;">
		<div class="row" >
			<form method="post" action="#" style="width:1200px;">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><div id="editor" style="width:1200px"></div></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<div class="row" style="margin:auto;">
				<input type="button" class="btn btn-primary pull-right" value="#차"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#애완동물"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#카페"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="주식"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#코인"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#게임"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#여행"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#전자제품"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#영화"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#옷"  style="width:95px;">
				</div>
				<br>
				<div class="row" style="margin:auto;">
				<input type="button" class="btn btn-primary pull-right" value="#신발"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#의약품"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#SNS"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#스포츠"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#부동산"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#문화생활"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#교육"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#보험"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#앤티크"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right" value="#외식"  style="width:95px;">
				</div>
			</form>
			<br>
			<br>
			<br>
			<br>
			<br>
				<input type="submit" class="btn  pull-right" value="글쓰기" style="margin:auto; width:600px;">
		</div>
	</div>
	<br>
	
	<!-- 게시판 글쓰기 양식 영역 끝 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TOAST UI Editor 생성 JavaScript 코드 -->
<script>
const editor = new toastui.Editor({
el: document.querySelector('#editor'),
previewStyle: 'vertical',
height: '500px',
initialValue: ''
});
// !!여기!! editor.getHtml()을 사용해서 에디터 내용 받아오기
document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHtml());
console.log(editor.getHtml());
</script>


	
</body>
</html>
