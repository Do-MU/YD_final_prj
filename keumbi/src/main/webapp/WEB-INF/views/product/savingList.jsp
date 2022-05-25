<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>

<style>
.prds{
	display:flex;
	padding: 20px;
}
.div_img{
	text-align: center;
	height:150px;
	flex:1;
}
.div_exp{
	flex:3;
}
.div_banknm{
	font-size:1.5em;
	margin-bottom: 20px;
}
.div_prdnm{
	font-size:2em;
	margin-bottom: 30px;
}
.div_intr{
	color: red;
	font-size: 1.5em;
	margin-bottom: 20px;
}
.div_joinway{
	font-size:1.5em;
}
.depView{
	margin-top:100%;
	
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>적금상품추천</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="prdSavingList">적금상품추천</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div id="list">
			<c:forEach var="s" items="${savList}">
				<div class="prds" data-dep_id="${s.sav_id}">
					<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${s.kor_co_nm}.jpg" width="150px" height="150px"></div>
					<div class="div_exp">
						<div class="div_banknm">${s.kor_co_nm}</div>
						<div class="div_prdnm">${s.fin_prdt_nm}</div>
						<div class="div_intr"></div>
						<div class="div_joinway">${s.join_way}</div>
					</div>
					<div class="div_btn">
						<button class="savView">자세히 보기</button>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
	</div>
	
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="bankName"></h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body" id="modal-body">
					<div id="savingBase1"></div>
					<div id="savingBase2"></div>
					<div id="savingBase3">저축 기간별 금리</div>
					<div id="savingOpt"></div>
				</div>
				
				<div class="modal-footer" style="display: inline;">
					<div id="cal" style="float: left;">금리 계산기<br><p id="tax">일반세율 <span id="total">15.4%</span>가 적용됩니다.</p></div>
					<div class="savOpt" style="float: right" onchange="savMoney()">
						<select id="date">
							<option value="" selected>선택</option>
						</select>
						<input type="text" id="savMoney" name="savMoney" placeholder="숫자만 입력해주세요">원
					</div>
				</div>
				<div id="totalText"></div>
			</div>
		</div>
	</div>
</section>

<script>
	$(".prds").on("click", ".savView", function(){
		$("#modal").modal("show");
		
		
		
		
		
	})

</script>