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
	margin-bottom: 40px;
}
.div_joinway{
	font-size:1.5em;
}
.depView{
	margin-top:100%;
	
}
#depositBase1, #depositBase2{
	font-size:1.25em;
	line-height:40px;
}
#depositBase3{
	margin-top: 40px;
	font-size: 20px;
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>예금상품추천</h2>
					<div class="page_link">
						<a href="home">Home</a> <a href="prdDepositList">예금상품추천</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
${intr}
<section class="contact_area p_120">
	<div class="container">
		<div id="list">
			<c:forEach var="d" items="${depList}">
			<div class="prds" data-dep_id="${d.dep_id}">
				<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/favicon.png" width="150px" height="150px"></div>
				<div class="div_exp">
					<div class="div_banknm">${d.kor_co_nm}</div>
					<div class="div_prdnm">${d.fin_prdt_nm}</div>
					<div class="div_intr">${intr}</div>
					<div class="div_joinway">${d.join_way}</div>
				</div>
				<div class="div_btn">
					<button class="depView">자세히 보기</button>
				</div>
			</div>
			<hr>
			</c:forEach>
		</div><br>
	</div>
	
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
				<div class="modal-header">
					<h3 class="modal-title" id="bankName"></h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body">
					<div id="depositBase1"></div>
					<div id="depositBase2"></div>
					<div id="depositBase3">저축 기간별 금리</div>
					<div id="depositOpt"></div>
				</div>
				
				<div class="modal-footer">
					<div id="depButton">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="joinButton">가입하러가기</button>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</section>

<script>	
	//상세보기시 옵션 출력
	$(".prds").on("click", ".depView", function(){
		$("#depositOpt").html("");
	
		var bank_name = $(this).parent().prev().children().eq(0).html();
		$("#bankName").html(bank_name);
			
		var dep_id = $(this).parent().parent().data("dep_id");
		$.ajax({
			url:"prdDepBase",
			data:{ dep_id : dep_id }
		}).done(function(dep){
			$("#depositBase1").html("<상품명><br>" + dep.fin_prdt_nm
									+"<br><가입방법><br>" + dep.join_way
									+"<br><만기 후 이자율><br>" + dep.mtrt_int
									+"<br><우대조건><br>" + dep.spcl_cnd
									+"<br>가입대상 : " + dep.join_member
									+"<br><유의사항><br>" + dep.etc_note)
			$("#depButton").data("dep_id", dep.dep_id);
			if(dep.max_limit != null){
				$("#depositBase2").html("최고한도 : " + dep.max_limit+"원")
			}
			
		});
		$.ajax({
			url:"prdDepOpt",
			data:{ dep_id : dep_id }
		}).done(function(result){
			for(opt of result){
				$("<div>").append( $("<hr>") )
						  .append( $("<div>").html("저축기간 : " + opt.save_trm + "개월"))
						  .append( $("<div>").html("최소 " + opt.intr_rate + "%") )
						  .append( $("<div>").html("최대 " + opt.intr_rate2 + "%") )
						  .appendTo($("#depositOpt")) 
			}
		});
		
		$("#modal").modal("show");
	});
	
	$("#joinButton").on("click", function(){
		$(this).parent().data("dep_id");
		console.log($(this).parent().data("dep_id"))
		window.location.href = "depositJoinForm?dep_id="+$(this).parent().data("dep_id");
	})
</script>