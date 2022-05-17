<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<c:forEach var="pd" items="${prdDepBase}">
		<div id="bankName">${pd.kor_co_nm}</div>
		<div id="depName">${pd.fin_prdt_nm}</div>
		<div id="group" style="border-bottom: 1px solid; display: inline-block;">
			${pd.join_way }
			<input type="button" class="btn btn-join" value="가입하기">
			<input type="button" class="btn btn-insert" onclick="openDiv()" value="상세보기">
		</div>
		
		<c:forEach var="optpd" items="${prdDepOpt}" varStatus="status">
			<c:if test="${pd.dep_id eq optpd.dep_id }">
				<div id="open_div">
					<div>${pd.join_member}</div>
					<div>${pd.spcl_cnd}</div>
					<div>${optpd.intr_rate_type_nm}</div>
					<div>${optpd.save_trm}</div>
					<br>
				</div>
			</c:if> 
		</c:forEach>
	</c:forEach>
	 <script>
	 	function openDiv(){
	 		document.getElementById('open_div').style.display = "block";
	 	}
	 </script>
</body>
</html>