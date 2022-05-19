<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>Page Title</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script type="module" src="/tag_create.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
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

			<!-- <h2 class="myH text-center">Notices List</h2>
			<h5 class="text-center">공지사항 리스트</h5>
			<p class="text-center mt20">공지사항 리스트 입니다.</p> -->

			<!-- <hr class="border-bottom border-primary"> -->

			<div class="row text-center justify-content-center mt36">
				<div class="col-7">
					<form id="frm" method="post">
						<div class="row">
							<div class="col-12">
								<table class="table table-hover">
									<thead>
										<tr>
											<th style="width: 140px;">
												<i style="color:rgb(255, 158, 47)" class="material-icons" onclick="sortBorder('A')">
													arrow_drop_down
												</i>
												글번호
												<i style="color:rgb(65, 100, 255)" onclick="sortBorder('D')" class="material-icons">
													arrow_drop_up
												</i>
											</th>
											<th>제목</th>
											<th>날짜</th>
											<th>작성자</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody id="boardBody">
										<c:if test="${empty list }">
											<tr>
												<td colspan="5" class="text-center">게시글이 존재하지 않습니다.</td>
											</tr>
										</c:if>
										<c:if test="${not empty list }">
											<c:forEach items="${list}" var="i">
												<tr onclick='bContent("${i.bod_num }")'>
													<td>${i.bod_num}</td>
													<td>${i.title}</td>
													<td>${i.wdate}</td>
													<td>${i.user_id}</td>
													<td>${i.hit}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>

						<c:if test="${author eq 'admin'}">
							<div class="row mt36 justify-content-center">
								<div class="col-4">
									<button type="button" class="btn btn-primary pull-right" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
								</div>
							</div>
						</c:if>

						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item">
									<a class="page-link" href="#" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>

						<div class="row mt36 justify-content-center g-1">
							<div class="col-auto">
								<select id="searchKey" name="searchKey" class="form-select">
									<option value="전체">전체</option>
									<option value="제목">제목</option>
									<option value="내용">내용</option>
								</select>
							</div>

							<div class="col-auto">
								<span>
									<input type="text" id="searchVal" name="searchVal" class="form-control">
								</span>
							</div>
							<div class="col-auto">
								<input type="button" onclick="searchList()" value="검색" class="btn btn-primary">
							</div>
						</div>
						<input type="hidden" id="nId" name="nId" class="form-control">
					</form>
				</div>
			</div>
			


			<script type="text/javascript">
				function bContent(i) {
					frm.bod_num.value = i;
					frm.action = "./boardView?bod_num=${i.bod_num}";
					frm.submit();
				}

				function searchList() {
					$.ajax({
						url: "ajaxNoticeSearch.do",
						type: "post",
						data: { "key": $("#searchKey").val(), "val": $("#searchVal").val() },
						dataType: "json",
						success: function (result) {
							if (result.length > 0) {
								searchResult(result); // json data를 html로 변환해서 화면에 뿌려주는 메소드 
							} else {
								alert("검색한 결과 존재하지 않습니다.");
							}
						}
					});
				}

				function searchResult(data) { //json 객체를 html로 변환 후 화면에 적용함
					var tb = $("#boardBody");
					$("#boardBody").empty();

					$.each(data, function (index, item) {
						console.log('item val:' + item);
						var html = $("<tr />").attr({
							'onmouseover': 'this.style.background="#fcecae";',
							'onmouseleave': 'this.style.background="#FFFFFF";',
							'onclick': 'Content(' + item.bod_num + ')'
						}).append(
							$("<td align='center'/>").text(item.nid),
							$("<td align='center'/>").text(item.title),
							$("<td align='center'/>").text(item.wdate),
							$("<td align='center'/>").text(item.user_id),
							$("<td align='center'/>").text(item.hit)
						);
						tb.append(html);
					});
					$("#content").append(tb);
				}

				function sortBorder(key) {
					$.ajax({
						url: "ajaxSortNotice.do",
						type: "post",
						data: { "key": key },
						dataType: "json",
						success: function (result) {
							searchResult(result);

						}

					});
				}

			</script>
			
</body>
</html>