<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시판</title>

<style>

   
 .num {
 	text-align: center;
 
 }  
 
 .btn {
 	text-align: center;
 	width:150px;
 	align: right;
 }
 
 .pull-right {
 	position: absolute;
 	right: 365px;
 }
 
 .form-control {
 	right: 640px;
 }
 
 .btn-primary {
 	position: absolute;
 	right: 365px;
 	margin-top:150px
 }
 
 .form-control3 {
 	height:40px;
 }
 
 .btn-success {
 	height:42px;
 }
   
</style>

</head>
<body>
	<section class="banner_area">
		<div class="container box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>게시판</h3>
					</div>
				</div>
			</div>
		</div>
	</section>

	
	<!-- 네비게이션 영역 끝 -->

    <br>
    <br>
    <br>
					
	<div class="container">
		<div class="row">
			<form method="post" name="search" action="#">
				<table class="pull-right">																				
					<tr>
					
					<td><select class="form-control" name="searchField">
								<option value="0">10페이지</option>
								<option value="0">20페이지</option>
								<option value="0">30페이지</option>
						</select></td>	
																																			    			    
						<td><select class="form-control2" name="searchField">						
								<option value="">제목</option>
								<option value="0">내용</option>
								<option value="0">제목 + 내용</option>
								<option value="0">태그</option>
						</select></td>
						<td><input type="text" class="form-control3"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	
	<br>
	<br>
	<br>
<!-- 게시판 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">날짜</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- 테스트 코드 -->
						<td>1</td>
						<td>안녕하세요</td>
						<td>22/05/13</td>
						<td>홍길동</td>
						<td>0</td>
					</tr>
				</tbody>
			</table>
			<!-- 글쓰기 버튼 생성 -->
			<a href="boardList/boardWriter" class="btn btn-primary">게시글 작성</a>								
		</div>
		
		<br>
        <br>
        <br>
        <br>
        
        
        <div class="num">
        	<span>${(empty param.p)? 1 : param.p }</span> /  pages &nbsp&nbsp
        	
            <c:set var = "page" value = "${(param.p==null)? 1: param.p}"/>
            <c:set var ="startNum" value = "${page-(page-1)%5}"/>    
            <c:set var ="lastNum" value = "23"/>    
            
            <c:if test="${startNum > 1}">
                <a href="?p=${startNum-1}&t=&q=" >이전</a>                
            </c:if>
            <c:if test="${startNum <= 1}">
                <span onclick="alert('이전 페이지가 없습니다.');">이전</span>            
            </c:if>
                            
            <span>
                <c:forEach var = "i" begin= "0" end = "4">
                    <a  class = "${((page) == (startNum+i)) ?'text-orange' : '' } text-bold" href="?p=${startNum+i}&f=${param.f}&q=${param.q}" >${startNum+i}</a>
                </c:forEach>
            </span>    
            
            <c:if test="${startNum+5 < lastNum}">
                <a href="?p=${startNum+5}&t=&q=" >다음</a>
            </c:if>
            <c:if test="${startNum+5 >= lastNum}">
                <span onclick="alert('다음 페이지가 없습니다.');">다음</span>            
            </c:if>
        </div>
        
		
	</div>
	<br>
	<!-- 게시판 메인 페이지 영역 끝 -->
</body>
</html>