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
.loanView{
	margin-top:100%;
	
}
#loanBase1, #loanBase2{
	font-size:1.25em;
	line-height:40px;
}
#loanBase3{
	margin-top: 40px;
	font-size: 20px;
}

#modal .modal-body{
	max-height: 500px;
	overflow: auto;
}

.modal-footer>:not(:first-child){
	text-align: right;
}

#etc{
	text-align: center;
	color: black;
	font-size: 25px;
}

</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>대출상품추천</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="prdLoanList">대출상품추천</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div id="list">
			<c:forEach var="l" items="${loanList}">
				<div class="prds" data-loan_id="${l.loan_id}">
					<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${l.kor_co_nm}.jpg" width="150px" height="150px"></div>
					<div class="div_exp">
						<div class="div_banknm">${l.kor_co_nm}</div>
						<div class="div_prdnm">${l.fin_prdt_nm}</div>
						<div class="div_intr"></div>
						<div class="div_joinway">${l.join_way}</div>
					</div>
					<div class="div_btn">
						<button class="loanView">자세히 보기</button>
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
					<div id="loanBase1"></div>
					<div id="loanBase2"></div>
					<div id="loanBase3">대출 기간별 금리</div>
					<div id="loanOpt"></div>
				</div>
				
				<div class="modal-footer" style="display: inline;">
					<div id="etc">신용점수에 따라 금리가 차등 적용됩니다.</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	$(".prds").on("click", ".loanView", function(){
		$("#modal").modal("show");
		$(".modal-body").animate({scrollTop: 0}, 400);
		
		$("#loanOpt").html("");
		var bank_name = $(this).parent().prev().children().eq(0).html();
		$("#bankName").html(bank_name);
		
		var loan_id = $(this).parent().parent().data("loan_id");
		
		$.ajax({
			url:"prdLoanBase",
			data:{ loan_id : loan_id }
		}).done(function(loa){
			$("#loanBase1").html("<상품명><br>" + loa.fin_prdt_nm
								+"<br><대출종류명><br>" + loa.crdt_prdt_type_nm
								+"<br><가입방법><br>" + loa.join_way)
		});
		
		
		$.ajax({
			url:"prdLoanOpt",
			data:{ loan_id : loan_id }
		}).done(function(result){
			for(opt of result){
				$("<div>").append( $("<hr>") )
				  .append( $("<div>").html("금리구분 : " + opt.crdt_lend_rate_type_nm)).appendTo($("#loanOpt"))
				 if(opt.crdt_grad_1 != null){
					  $("<div>").html("900점 초과   : " + opt.crdt_grad_1 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_4 != null){
					  $("<div>").html("801 ~ 900점 : " + opt.crdt_grad_4 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_5 != null){
					  $("<div>").html("701 ~ 800점 : " + opt.crdt_grad_5 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_6 != null){
					  $("<div>").html("601 ~ 700점 : " + opt.crdt_grad_6 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_10 != null){
					  $("<div>").html("501 ~ 600점 : " + opt.crdt_grad_10 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_11 != null){
					  $("<div>").html("401 ~ 500점 : " + opt.crdt_grad_11 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_12 != null){
					  $("<div>").html("301 ~ 400점 : " + opt.crdt_grad_12 + "%").appendTo($("#loanOpt"));
			      }
				if(opt.crdt_grad_13 != null){
					  $("<div>").html("300점 이하   : " + opt.crdt_grad_13 + "%").appendTo($("#loanOpt"));
			      }
				  $("<div>").html("평균 금리 : " + opt.crdt_grad_avg + "%").appendTo($("#loanOpt"));
				}
		});
	})
	
	
		// 상품리스트 평균금리 출력
		for(prd of $("#list").find(".prds")){
			var loan_id = prd.getAttribute("data-loan_id");

			$.ajax({
				url:"prdLoanOpt",
				data:{loan_id : loan_id},
				async: false
			}).done(function(result){
				for(opt of result){
					if(loan_id == opt.loan_id){
						prd.children[1].children[2].innerText = "평균금리 " + opt.crdt_grad_avg + "%";
					}
				}
			});
		};
</script>

