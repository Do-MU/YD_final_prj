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
	flex:1;
	display: block;
	width: 50px;
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
#loanView{
	margin-top:150%;
	
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
.prds{
   display: none;
   border-bottom: solid 1px;
}

#read{
	width: 500px;
    margin: auto;
    display: block;
    margin-top: 30px;
}
.div_bestImg{
	text-align: left;
	height:50px;
	flex:1;
}
.wel_item{
	border: 1px solid #212529;
    padding: 15px 15px;
    border-radius: 20px
}
.row{
	padding-bottom: 50px
}
.div_intr2{
	color: red;
}
.div_dep{
	flex: 0 0 33.333333%;
}
.main_title{
	text-align: center;
    max-width: 670px;
    margin: 0px auto 30px;
}
.p_121{
	padding-top: 100px;
	padding-bottom: 0px;
}
#titleList{
	text-align: left;
    font-size: 36px;
    color: black;
    font-weight: bold;
    margin-bottom: 50px;
}
.testimonials_area, .testi_inner{
	background-color: white;
}
#popLoanView{
   margin-top: 10px;
    width: 100%;
}

table {
	width : 100%;
}

th, td {
    border-bottom: 1px solid #777777;
    padding: 10px;
}

#loanOpt > div > hr{
	border-top: 1px solid black;
}
.main_title > h1{
	align: center;
	color: black;
}
.main_title > h4{
	font-size: 20px;
}
</style>

<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>??????????????????</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="prdLoanList">??????????????????</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="testimonials_area p_121">
		<div class="container">
			<c:if test="${empty loginUser.name}">
			<div class="main_title">
				<h1>?????? ????????? ????????????????</h1>
				<h4>???????????? ?????? ?????? ???????????? ???????????????</h4>
			</div>
			<div class="testi_inner">
				<div class="testi_slider owl-carousel">
					<c:forEach var="b" items="${loanRandomList }">
						<div class="div_loan" data-loan_id="${b.loan_id }">
							<div class="wel_item">
								<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${b.kor_co_nm}.jpg" width="50px" height="50px"></div>
								<div class="div_bank">${b.kor_co_nm }</div>
								<div class="div_intr2"></div>
								<div class="div_prdNm">${b.fin_prdt_nm }</div>
								<div class="div_btn">
									<button type="button" class="btn btn-outline-primary" id="popLoanView">????????????</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			<c:if test="${not empty loginUser.name}">
			<div class="main_title">
				<h1>?????? ????????? ????????????????</h1>
				<h4>${loginUser.name} ?????? ????????? ???????????? ?????? ???????????? ???????????????</h4>
			</div>
			<div class="testi_inner">
				<div class="testi_slider owl-carousel">
					<c:forEach var="b" items="${loanBestList}">
						<div class="div_loan" data-loan_id="${b.loan_id}">
							<div class="wel_item">
								<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${b.kor_co_nm}.jpg" width="50px" height="50px"></div>
								<div class="div_bank">${b.kor_co_nm }</div>
								<div class="div_intr2"></div>
								<div class="div_prdNm">${b.fin_prdt_nm }</div>
								<div class="div_btn">
									<button type="button" class="btn btn-outline-primary" id="popLoanView">????????????</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div id="titleList">?????? ????????????</div>
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
						<button type="button" class="btn btn-outline-primary" id="loanView">????????????</button>
					</div>
				</div>
			</c:forEach>
			<div id="read_more">
				<button type="button" class="btn btn-outline-primary" id="read">10??? ?????????</button>
			</div>
		</div>
	</div>
	<!-- ???????????? Modal -->
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="bankName"></h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<div class="modal-body" id="modal-body">
					<!-- <div id="loanBase1"></div> -->
					<div id="loanBase1">
						<table class="table table-striped">
							<tr>
								<th width="150px">?????????</th>
								<td id="fin_prdt_nm"></td>
							</tr>
							<tr>
								<th>???????????????</th>
								<td id="crdt_prdt_type_nm"></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td id="join_way"></td>
							</tr>
						</table>
					</div>
					<div id="loanBase2"></div>
					<div id="loanBase3"><h4>?????? ????????? ??????</h4></div>
					<div id="loanOpt"></div>
				</div>
				
				<div class="modal-footer" style="display: inline;">
					<div id="etc">??????????????? ?????? ????????? ?????? ???????????????.</div>
				</div>
			</div>
		</div>
	</div>
</section>


<script>
	$(".prds").on("click", "#loanView", function(){
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
			makeLoanBase(loa);
		});
		
		$.ajax({
			url:"prdLoanOpt",
			data:{ loan_id : loan_id }
		}).done(function(result){
			makeLoanOpt(result);
		});
	})
	
	// ???????????? ???????????? ??????
	$(".testi_inner").on("click", "#popLoanView", function(){
		$("#modal").modal("show");
		$(".modal-body").animate({scrollTop: 0}, 400);
		$("#savingOpt").html("");
		
		var bank_name = $(this).parent().prev(2).html();
		$("#bankName").html(bank_name);
			
		var loan_id = $(this).parent().parent().parent().data("loan_id");
		
		$.ajax({
			url:"prdLoanBase",
			data:{ loan_id : loan_id }
		}).done(function(loa){
			makeLoanBase(loa);
		});
		
		$.ajax({
			url:"prdLoanOpt",
			data:{ loan_id : loan_id }
		}).done(function(result){
			makeLoanOpt(result);
		});
	})
	
	// ??????????????? ???????????? ??????
	for(prd of $("#list").find(".prds")){
		var loan_id = prd.getAttribute("data-loan_id");

		$.ajax({
			url:"prdLoanOpt",
			data:{loan_id : loan_id},
			async: false
		}).done(function(result){
			for(opt of result){
				if(loan_id == opt.loan_id){
					prd.children[1].children[2].innerText = "???????????? " + opt.crdt_grad_avg + "%";
				}
			}
		});
	};
	
	for(prd of $(".testi_inner").find(".div_loan")){
		var loan_id = prd.getAttribute("data-loan_id");

		$.ajax({
			url:"prdLoanOpt",
			data:{loan_id : loan_id},
			async: false
		}).done(function(result){
			for(opt of result){
				if(loan_id == opt.loan_id){
					prd.children[0].children[2].innerText = "???????????? " + opt.crdt_grad_avg + "%";
				}
			}
		});
	};
	
	function makeLoanBase(loa){
		$("#fin_prdt_nm").html(loa.fin_prdt_nm);
		$("#crdt_prdt_type_nm").html(loa.crdt_prdt_type_nm);
		$("#join_way").html(loa.join_way);
	}
	
	function makeLoanOpt(result){
		for(opt of result){
			$("<div>").append( $("<hr>") )
			  .append( $("<div>").html("???????????? : " + opt.crdt_lend_rate_type_nm)).appendTo($("#loanOpt"))
			 if(opt.crdt_grad_1 != null){
				  $("<div>").html("900??? ??????   : " + opt.crdt_grad_1 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_4 != null){
				  $("<div>").html("801 ~ 900??? : " + opt.crdt_grad_4 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_5 != null){
				  $("<div>").html("701 ~ 800??? : " + opt.crdt_grad_5 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_6 != null){
				  $("<div>").html("601 ~ 700??? : " + opt.crdt_grad_6 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_10 != null){
				  $("<div>").html("501 ~ 600??? : " + opt.crdt_grad_10 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_11 != null){
				  $("<div>").html("401 ~ 500??? : " + opt.crdt_grad_11 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_12 != null){
				  $("<div>").html("301 ~ 400??? : " + opt.crdt_grad_12 + "%").appendTo($("#loanOpt"));
		      }
			if(opt.crdt_grad_13 != null){
				  $("<div>").html("300??? ??????   : " + opt.crdt_grad_13 + "%").appendTo($("#loanOpt"));
		      }
			  $("<div>").html("?????? ?????? : " + opt.crdt_grad_avg + "%").appendTo($("#loanOpt"));
		}
	}
	// ?????????
	   $(window).ready(function(){
	      $("#list").children("div").slice(0,10).show().css("display", "flex");
	      
	      $("#read").click(function(e){
	         if( $("#list").children("div:hidden").length == 0){
	        	 $("#read").hide();
	         }else{
		         e.preventDefault();
		         $("#list").children("div:hidden").slice(0,10).show().css("display", "flex");
	         }
	      })
	   })
</script>

