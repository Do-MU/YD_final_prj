<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<!-- 보기 편하게 CSS추가해주었습니다. -->
<style>
* {
text-align: center;
}
#editor {
/* border : 1px solid; */
width : 50%;
margin : 0 auto;
}
/* !!여기!! 새로운 div태그 스타일 추가해줫습니다. */
#contents {
width:50%;
height: 100px;
margin : 30px auto;
border : 1px solid;
}
</style>
<!-- TOAST UI Editor CDN URL(CSS)-->
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


				
<!-- TOAST UI Editor가 들어갈 div태그 -->
<div id="editor"></div>
<!-- !!여기!! 에디터 내용을 받을 div태그-->
<div id="contents"></div>
<!-- TOAST UI Editor CDN URL(JS) -->
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
