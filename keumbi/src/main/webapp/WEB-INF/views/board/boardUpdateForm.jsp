<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>뷰</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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


#editor {
	border: 1px solid;
	width: 50%;
	margin: 0 auto;
}

#contents {
	border: 1px solid;
	width: 50%;
	margin: 0 auto;
}

ul {
	padding: 16px 0;
}

ul li {
	display: inline-block;
	margin: 0 5px;
	font-size: 14px;
	letter-spacing: -.5px;
}

form {
	padding-top: 16px;
}

ul li.tag-item {
	padding: 4px 8px;
	background-color: #777;
	color: #000;
}

.tag-item:hover {
	background-color: #262626;
	color: #fff;
}

.del-btn {
	font-size: 12px;
	font-weight: bold;
	cursor: pointer;
	margin-left: 8px;
}
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

</head>

<body>
	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>커뮤니티</h2>
						<div class="page_link">
							<a href="home">Home</a> <a href="boardList">커뮤니티</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	
<section class="contact_area p_120">
	<div class="container">
		<div class="row">
			<form id="frm" name="frm" method="post" action="boardUpdate?bod_num=${b.bod_num}" onsubmit="return call_submit()">
				<input type="hidden" id="user_id" name="user_id" value="${b.user_id}">
				<table class="table table-striped"
					style="border: 1px solid #dddddd">
						<tr>
							<td>
								<input type="text" style="width: 100%;" value="${b.title}" name="title"> 
								<input type="hidden" name="contents">
							</td>
						</tr>
						<tr>
							<td>
								<div id="editor" style="width: 100%; height: 100px; text-align: left;">${b.contents}</div>

								<div>
									<ul id="tag-list" style="float: left;">
									<c:forEach items="${tags}" var="t" varStatus="status">
										<li class='tag-item' data-code="${t.kwd_code}">#${t.val}<span class='del-btn' idx='${status.index}'>x</span></li>
									</c:forEach>
									</ul>
								</div>
							</td>
						</tr>
				</table>
				<br>

				<div class="row" id="tag-list" style="margin: auto;">
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#차"
						data-code="K001" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#애완동물"
						data-code="K002" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#카페"
						data-code="K003" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#주식"
						data-code="K004" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#코인"
						data-code="K005" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#게임"
						data-code="K006" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#여행"
						data-code="K007" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#전자제품"
						data-code="K008" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#영화"
						data-code="K009" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#옷"
						data-code="K010" style="width: 95px;">
				</div>
				<br>
				<div class="row" style="margin: auto;">
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#신발"
						data-code="K011" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#의약품"
						data-code="K012" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#SNS"
						data-code="K013" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#스포츠"
						data-code="K014" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#부동산"
						data-code="K015" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#문화생활"
						data-code="K016" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#교육"
						data-code="K017" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#보험"
						data-code="K018" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#앤티크"
						data-code="K019" style="width: 95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" role="button"
						class="btn btn-outline-info pull-right hashtag" value="#외식"
						data-code="K020" style="width: 95px;">
				</div>

				<br> <br> <input name="bod_num" type="hidden"
					value="${b.bod_num}"> <a
					href="boardView?bod_num=${b.bod_num}" role="button"
					class="btn btn-outline-info" style="float: right;"
					onclick="return confirm('수정을 취소하시겠습니까?')">취소</a>
				<button type="submit" id="submit" class="btn btn-outline-info" style="float: right;">수정완료</button>

			</form>
		</div>
	</div>

	<br>
	<br>
</section>
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

	<script>
		const editor = new toastui.Editor({
			el : document.querySelector('#editor'),
			previewStyle : 'vertical',
			height : '500px',
			initialValue : '',
			initialEditType : 'wysiwyg',
			language : 'ko-KR'			
		});
		console.log($("#tag-list").find("li"))
		// !!여기!! editor.getHtml()을 사용해서 에디터 내용 받아오기
		//document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHtml()); 

		function call_submit() {
			//event.preventDefault();
			frm.contents.value = editor.getHTML();
			
			var tagObj = $("#tag-list").find("li");

			for (i = 0; i < tagObj.length; i++) {

				var input1 = document.createElement('input');
				input1.setAttribute("name", "keyword");
				input1.setAttribute("value", tagObj.eq(i).data('code'));
				input1.setAttribute("hidden", "hidden");

				frm.appendChild(input1);

			}
			
			frm.submit();
			
			return true;
		}
	</script>

	<script>
		$(document)
				.ready(
						function() {
							//console.log(editor.getHtml()); 
							var tag = {};
							var counter = 0;
							
							$("#tag-list .tag-item").each(function(){
								addTag($(this).text().substr(0,$(this).text().length-1))
							})

							// 태그를 추가한다.
							function addTag(value) {
								tag[counter] = value; // 태그를 Object 안에 추가
								counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
							}

							// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
							function marginTag() {
								return Object.values(tag).filter(
										function(word) {
											return word !== "";
										});
							}

							$(".hashtag").on("click",function() {

								var tagValue = this.value; // 값 가져오기
								var tagCodeValue = $(this).data('code')

												// 값이 없으면 동작 안합니다.
												if (tagValue !== "") {

													// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
													var result = Object.values(tag).filter(function(word) {
														return word === tagValue;
													})

													// 태그 중복 검사
													if (result.length == 0) {
														$("#tag-list")
																.append(
																		"<li class='tag-item' data-code='"+ tagCodeValue  +"'>"
																				+ tagValue
																				+ "<span class='del-btn' idx='" + counter + "'>x</span></li>");
														addTag(tagValue);
													} else {
														alert("태그값이 중복됩니다.");
													}
												}

											})

							$("#tag")
									.on(
											"keyup",
											function(e) {
												var self = $(this);
												console.log("keypress");

												// input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
												if (e.key === "Enter"
														|| e.keyCode == 32) {

													var tagValue = self.val(); // 값 가져오기

													// 값이 없으면 동작 안합니다.
													if (tagValue !== "") {

														// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
														var result = Object
																.values(tag)
																.filter(
																		function(
																				word) {
																			return word === tagValue;
																		})

														// 태그 중복 검사
														if (result.length == 0) {
															$("#tag-list")
																	.append(
																			"<li class='tag-item' data-code='"+ tagCodeValue  +"'>"
																					+ tagValue
																					+ "<span class='del-btn' idx='" + counter + "'>x</span></li>");
															addTag(tagValue);
															self.val("");
														} else {
															alert("태그값이 중복됩니다.");
														}
													}
													e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
												}
											});

							// 삭제 버튼
							// 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
							$(document).on("click", ".del-btn", function(e) {
								var index = $(this).attr("idx");
								tag[index] = "";
								$(this).parent().remove();
							});
						})
	</script>

</body>
</html>