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
#savView{
	margin-top:150%;
	
}
#savingBase1, #savingBase2{
	font-size:1.25em;
	line-height:40px;
}
#savingBase3{
	margin-top: 40px;
	font-size: 20px;
}

#modal .modal-body{
	max-height: 500px;
	overflow: auto;
}

.modal-footer>:not(:first-child){
	text-align: right;
	margin-top: 15px;
}


#total, #taxPercent, .div_intr2{	
	color: red;
}
#totalText{
	text-align: center;
	font-size: 30px;
	margin-top: 20px;
	margin-bottom: 20px;
}

#cal{
    font-weight: bold;
    font-size: 25px;
    color: black;
    padding-top: 10px;
}

#savMoney{
	background-color: white;
  	color: black;
  	border: 2px solid #e7e7e7;
  	padding: 6px;
  	border-radius: 5px;
  	text-align: right;
}

#tax{
	font-weight: bold;
    font-size: 20px;
    color: black;
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
.div_sav{
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
#popSavView{
   margin-top: 10px;
    width: 100%;
}

table {
	width : 100%;
}

#savingOpt > div{
	display: inline-block;
    margin-right: 20px;
    margin-left: 20px;
    margin-bottom: 20px;
}

#savingOpt > div > hr{
	border-top: 1px solid black;
}
.main_title > h1{
	align: center;
	color: black;
}
.main_title > h4{
	font-size: 20px;
}
#savingOpt > div > #optName{
	font-weight: bold;
    color: black;
    font-size: large;
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
						<a href="prdSavingList">??????????????????</a>
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
					<c:forEach var="b" items="${savRandomList }">
						<div class="div_sav" data-sav_id="${b.sav_id }">
							<div class="wel_item">
								<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${b.kor_co_nm}.jpg" width="50px" height="50px"></div>
								<div class="div_bank">${b.kor_co_nm }</div>
								<div class="div_intr2"></div>
								<div class="div_prdNm">${b.fin_prdt_nm }</div>
								<div class="div_btn">
									<button type="button" class="btn btn-outline-primary" id="popSavView">????????????</button>
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
					<c:forEach var="b" items="${savBestList }">
						<div class="div_sav" data-sav_id="${b.sav_id }">
							<div class="wel_item">
								<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${b.kor_co_nm}.jpg" width="50px" height="50px"></div>
								<div class="div_bank">${b.kor_co_nm }</div>
								<div class="div_intr2"></div>
								<div class="div_prdNm">${b.fin_prdt_nm }</div>
								<div class="div_btn">
									<button type="button" class="btn btn-outline-primary" id="popSavView">????????????</button>
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
			<c:forEach var="s" items="${savList}">
				<div class="prds" data-sav_id="${s.sav_id}">
					<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${s.kor_co_nm}.jpg" width="150px" height="150px"></div>
					<div class="div_exp">
						<div class="div_banknm">${s.kor_co_nm}</div>
						<div class="div_prdnm">${s.fin_prdt_nm}</div>
						<div class="div_intr"></div>
						<div class="div_joinway">${s.join_way}</div>
					</div>
					<div class="div_btn">
						<button type="button" class="btn btn-outline-primary" id="savView">????????????</button>
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
<!-- 					<div id="savingBase1"></div> -->
					<div id="savingBase1">
						<table class="table table-striped">
							<tr>
								<th width="160">?????????</th>
								<td id="fin_prdt_nm"></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td id="join_way"></td>
							</tr>
							<tr>
								<th>?????? ??? ?????????</th>
								<td id="mtrt_int"></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td id="spcl_cnd"></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td id="join_member"></td>
							</tr>
							<tr>
								<th>????????????</th>
								<td id="etc_note"></td>
							</tr>
							<tr>
								<th>????????? ??????</th>
								<td></td>
							</tr>
						</table>
					</div>
					<div id="savingOpt"></div>
				</div>
				
				<div class="modal-footer alert-primary" style="display: inline;">
					<div id="cal" style="float: left;">?????? ?????????<br><p id="tax">???????????? <span id="taxPercent">15.4%</span>??? ???????????????.</p></div>
					<div class="savOpt" style="float: right" onchange="savMoney()">
						<select id="date">
							<option value="" selected>??????</option>
						</select>
						<input type="text" id="savMoney" name="savMoney" placeholder="????????? ??????????????????">???
					</div>
				</div>
				<p id="totalText" hidden></p>
			</div>
		</div>
	</div>
</section>

<script>
	//?????? ???????????? ??????
	$(".prds").on("click", "#savView", function(){
		$("#modal").modal("show");
		$(".modal-body").animate({scrollTop: 0}, 400);
		$("#savingOpt").html("");
		
		var bank_name = $(this).parent().prev().children().eq(0).html();
		$("#bankName").html(bank_name);
		
		var sav_id = $(this).parent().parent().data("sav_id");
		
		$.ajax({
			url:"prdSavBase",
			data:{ sav_id : sav_id }
		}).done(function(sav){
			makeSavBase(sav);
		});
		
		$.ajax({
			url:"prdSavOpt",
			data:{ sav_id : sav_id }
		}).done(function(result){
			makeSavOpt(result);
		});
		
		// modal ?????? ?????????
		closeModal();
	})
	
	// ???????????? ???????????? ??????
	$(".testi_inner").on("click", "#popSavView", function(){
		$("#modal").modal("show");
		$(".modal-body").animate({scrollTop: 0}, 400);
		$("#savingOpt").html("");
		
		var bank_name = $(this).parent().prev(2).html();
		$("#bankName").html(bank_name);
			
		var sav_id = $(this).parent().parent().parent().data("sav_id");
		
		$.ajax({
			url:"prdSavBase",
			data:{ sav_id : sav_id }
		}).done(function(sav){
			makeSavBase(sav);
		});
		
		$.ajax({
			url:"prdSavOpt",
			data:{ sav_id : sav_id }
		}).done(function(result){
			makeSavOpt(result);
		});
		
		// modal ?????? ?????????
		closeModal();
	})
	
		// ??????????????? ???????????? ??????
		for(prd of $("#list").find(".prds")){
			var sav_id = prd.getAttribute("data-sav_id");

			$.ajax({
				url:"prdSavOpt",
				data:{sav_id : sav_id},
				async: false
			}).done(function(result){
				for(opt of result){
					if(sav_id == opt.sav_id){
						prd.children[1].children[2].innerText = "???????????? " + opt.intr_rate2 + "%";
					}
				}
			});
		};
		
		// ???????????? ???????????? ??????
		for(prd of $(".testi_inner").find(".div_sav")){
			var sav_id = prd.getAttribute("data-sav_id");

			$.ajax({
				url:"prdSavOpt",
				data:{sav_id : sav_id},
				async: false
			}).done(function(result){
				for(opt of result){
					if(sav_id == opt.sav_id){
						prd.children[0].children[2].innerText = "???????????? " + opt.intr_rate2 + "%";
					}
				}
			});
		};
		// ?????? ?????? ??????
		function calculator(){
			document.getElementById("totalText").removeAttribute("hidden");
			var type = $("#type").text(); //???????????? ??????
			var month = $("#date option:selected").attr('name'); //????????? ??????
			var intr = $("#date option:selected").val(); // ????????? ?????? ???????????? ??????
			var saving = document.getElementById("savMoney").value; // ?????? ??????
			
			var month1 = month / 12 	// ???????????? ????????? ??????
			var money = Number(saving); // ?????? number??? ??????
			var num2 = Number(intr); 	// ???????????? number??? ??????
			var month2 = Number(month); // ?????? number??? ??????
			var money1 = money;
			
			if(type == 'S'){ //???????????????
				var interest = (intr/100) * (month2 + 1)/24;
				var tax = (interest*100) * (1-(15.4 / 100));
				var taxMoney = (money*month) * (tax/100); // ?????? ?????????
				var total = (money*month) + taxMoney // ?????? ??????
				document.getElementById("totalText").innerHTML = "<div id='totalText'>?????????????????? <span id='total'>" + Math.round(total) + "??? </span>?????????.</div>";
			}else if(type == 'M'){ //???????????????
					var interest = money * ( (1+(intr/100)) ** ((month2+1)/12) - (1+(intr/100)) ** (1/12)) / ( (1+(intr/100)) ** (1/12) - 1) - (money * month) // ?????? ??????
					var taxMoney = interest * (1- (15.4/100)); // ?????? ?????????
					var total = (money * month) + taxMoney; // ?????? ??????
				
				document.getElementById("totalText").innerHTML = "<div id='totalText'>?????????????????? <span id='total'>" + Math.round(total) + "??? </span>?????????.</div>";
			}
			//????????? ??????
			$("#totalText").html($("#totalText").html().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		}
		
		// ?????? ????????? ??????
		function savMoney() {
			calculator();
			
			$("#savMoney").keyup(function savMoney(){
				calculator();
			})
		}
		// ?????? ???????????? ??????
		function makeSavBase(sav){
			var mtrt_int = sav.mtrt_int.replace(/(\n|\r\n)/g, '<br>');
			var spcl_cnd = sav.spcl_cnd.replace(/(\n|\r\n)/g, '<br>');
			var etc_note = sav.etc_note.replace(/(\n|\r\n)/g, '<br>');
			
			$("#fin_prdt_nm").html(sav.fin_prdt_nm);
			$("#join_way").html(sav.join_way);
			$("#mtrt_int").html(mtrt_int);
			$("#spcl_cnd").html(spcl_cnd);
			$("#join_member").html(sav.join_member);
			$("#etc_note").html(etc_note);
			
			if(sav.max_limit != 0){
				let tr = `<tr>
							<th>????????????</th>
							<td id="savingBase2">\${sav.max_limit}</td>
						</tr>`;
				$("#etc_note").parent().after(tr);
				//$("#savingBase2").html(dep.max_limit);
				
				for(amt of $("#savingBase2")){
					amt.innerHTML = amt.innerHTML.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " ???";
				}
			}
		}
		
		// ?????? ???????????? ??????
		function makeSavOpt(result){
			$('#date').empty();
	        let opthtml = '<option value="">??????</option>';
			for(opt of result){
				$("<div>").append( $("<div id='optName'>").html(opt.rsrv_type_nm))
						  .append( $("<div>").html("???????????? : " + opt.save_trm + "??????"))
						  .append( $("<div>").html("?????? " + opt.intr_rate + "%") )
						  .append( $("<div>").html("?????? " + opt.intr_rate2 + "%") )
						  .append( $("<div style='display:none;' id='type'>").html(opt.intr_rate_type))
						  .appendTo($("#savingOpt"));

	            opthtml += "<option value='"+opt.intr_rate2+"' name='"+opt.save_trm+"'>"+opt.rsrv_type_nm+" "+opt.save_trm+"??????</option>"
			}		
	        $("#date").html(opthtml);
	        $("#date").niceSelect("update");
		}
		
		// ?????? ??? ?????? ?????????
		function closeModal(){
			$("#modal").on("hidden.bs.modal", function(){
				$(".list > li").remove(); // select????????? ?????????
				$("#date > option").remove(); // select????????? ?????????
				$("#totalText").html(""); // ???????????? ?????????
				$(".savOpt > #savMoney").val(""); // ???????????? ?????????
				$("#savingBase2").closest('tr').remove(); // ???????????? ?????????
				$("#totalText").attr("hidden","hidden");
			})
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