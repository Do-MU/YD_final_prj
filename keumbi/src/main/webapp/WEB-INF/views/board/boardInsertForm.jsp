<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script type="module" src="/tag_create.js"></script>
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

* {
	text-align: center;
}

#editor {
	border: 1px solid;
	width: 50%;
	margin: 0 auto;
}

#contents {
	border : 1px solid;
 	width: 50%;
 	margin : 0 auto;
 	

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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<link rel="stylesheet" type="text/css" href="/tag_create.css">

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
			<form id="frm" name="frm" method="post" action="insertBoard" style="width:1180px; text-align:center;">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; ">
					<!-- <thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead> -->
					<tbody>
						<tr>
							<td>
							<input type="text" class="form-control" placeholder="글 제목" id="title" name="title" maxlength="50" style="float:left; width:900px; padding-right: 50em;">
							<input type="date" class="form-control" id="wdate" name="wdate" required="required" maxlength="50" style="width:250px;"></td>
						</tr>
						<tr>
							<td><div id="editor" style="width:1150px; height: 100px;"></div>
							<div id="contents"></div>
							<div><ul id="tag-list" style="float:left;" ></ul> </div></td>
							
						</tr>
					</tbody>
					
				</table>
				<br>
				<!-- 글쓰기 버튼 생성 -->
				<div class="row" id="tag-list" style="margin:auto;">
				<input type="button" class="btn btn-primary pull-right hashtag" value="#차"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#애완동물"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#카페"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="주식"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#코인"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#게임"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#여행"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#전자제품"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#영화"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#옷"  style="width:95px;">
				</div>
				<br>
				<div class="row" style="margin:auto;">
				<input type="button" class="btn btn-primary pull-right hashtag" value="#신발"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#의약품"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#SNS"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#스포츠"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#부동산"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#문화생활"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#교육"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#보험"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#앤티크"  style="width:95px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-primary pull-right hashtag" value="#외식"  style="width:95px;">
				</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<input type="submit" id="submit" class="btn  pull-right" value="글쓰기" style="margin:auto; width:600px;">
			</form>
				<!--<input type="submit" id="submit" class="btn  pull-right" onclick="frm.submit();" value="글쓰기" style="margin:auto; width:600px;">-->
		</div>
	</div>
	<br>
	
	<!-- 게시판 글쓰기 양식 영역 끝 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TOAST UI Editor 생성 JavaScript 코드 -->

<!-- <script>

function submit(num){
	
	let contents = editor.getHTML();
	
	if(num==1){
		
		$("#insertColumn").children(3).attr("value",contents);
		$("insertColumn").attr("action","insertBoard").submit();
	}
}

</script> -->

<script>
const editor = new toastui.Editor({
el: document.querySelector('#editor'),
previewStyle: 'vertical',
height: '500px',
initialValue: '',
initialEditType: 'wysiwyg'
});
// !!여기!! editor.getHtml()을 사용해서 에디터 내용 받아오기
document.querySelector('#contents').insertAdjacentHTML('afterbegin' ,editor.getHtml()); 
console.log(editor.getHtml()); 
</script>


<script>

$(document).ready(function () {

  var tag = {};
  var counter = 0;

  // 태그를 추가한다.
  function addTag(value) {
    tag[counter] = value; // 태그를 Object 안에 추가
    counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
  }

  // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
  function marginTag() {
    return Object.values(tag)
      .filter(function (word) {
        return word !== "";
      });
  }

$(".hashtag").on("click", function (){

        var tagValue = this.value; // 값 가져오기

        // 값이 없으면 동작 안합니다.
        if (tagValue !== "") {

          // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
          var result = Object.values(tag)
            .filter(function (word) {
              return word === tagValue;
            })

          // 태그 중복 검사
          if (result.length == 0) {
            $("#tag-list")
              .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
            addTag(tagValue);
          } else {
            alert("태그값이 중복됩니다.");
          }
        }
	
})  

  $("#tag")
    .on("keyup", function (e) {
      var self = $(this);
      console.log("keypress");

      // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
      if (e.key === "Enter" || e.keyCode == 32) {

        var tagValue = self.val(); // 값 가져오기

        // 값이 없으면 동작 안합니다.
        if (tagValue !== "") {

          // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
          var result = Object.values(tag)
            .filter(function (word) {
              return word === tagValue;
            })

          // 태그 중복 검사
          if (result.length == 0) {
            $("#tag-list")
              .append("<li class='tag-item'>" + tagValue + "<span class='del-btn' idx='" + counter + "'>x</span></li>");
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
  $(document)
    .on("click", ".del-btn", function (e) {
      var index = $(this)
        .attr("idx");
      tag[index] = "";
      $(this)
        .parent()
        .remove();
    });
})

</script>

<!-- <script>
function submit(num) {
	
	let $title = $("#content-title").val()
	let contents = editor.getHTML();
	
	// 등록하기
	if (num==1){
		
		$("insertColumn").children().eq(2).attr("value",$title);
		$("insertColumn").children().eq(3).attr("value",contents);
		$("#insertColumn").attr("action","#").submit();
	
	}
}

</script> -->

	
</body>
</html>
