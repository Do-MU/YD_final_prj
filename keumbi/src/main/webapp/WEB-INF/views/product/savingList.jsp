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
	margin-top:100%;
	
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
}


#total, #taxPercent, .div_intr2{	
	color: red;
}
#totalText{
	text-align: center;
	font-size: 30px;
	margin-top: 5px;
	margin-bottom: 10px;
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
#div_content{
	font-size: 30px;
    padding-bottom: 30px;
    color: black;
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
	text-align: center;
    font-size: 30px;
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

th, td {
    border-bottom: 1px solid #777777;
    padding: 10px;
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
<section class="testimonials_area p_121">
		<div class="container">
			<c:if test="${empty loginUser.name}">
			<div class="main_title">
				<div id="div_content">이런 상품은 어떠신가요?</div>
				<p>회원들이 가장 많이 이용하는 상품이에요</p>
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
									<button type="button" class="btn btn-outline-primary" id="popSavView">상세보기</button>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			</c:if>
			<c:if test="${not empty loginUser.name}">
			<div class="main_title">
				<div id="div_content">이런 상품은 어떠신가요?</div>
				<p>${loginUser.name} 님과 비슷한 연령대가 많이 이용하는 상품이에요</p>
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
									<button type="button" class="btn btn-outline-primary" id="popSavView">상세보기</button>
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
		<div id="titleList">전체 적금상품</div>
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
						<button type="button" class="btn btn-outline-primary" id="savView">상세보기</button>
					</div>
				</div>
			</c:forEach>
			<div id="read_more">
				<button type="button" class="btn btn-outline-primary" id="read">10개 더보기</button>
			</div>
		</div>
	</div>
	
	<!-- 상세보기 Modal -->
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
						<table>
							<tr>
								<th width="160">상품명</th>
								<td id="fin_prdt_nm"></td>
							</tr>
							<tr>
								<th>가입방법</th>
								<td id="join_way"></td>
							</tr>
							<tr>
								<th>만기 후 이자율</th>
								<td id="mtrt_int"></td>
							</tr>
							<tr>
								<th>우대조건</th>
								<td id="spcl_cnd"></td>
							</tr>
							<tr>
								<th>가입대상</th>
								<td id="join_member"></td>
							</tr>
							<tr>
								<th>유의사항</th>
								<td id="etc_note"></td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th>최고한도</th> -->
<!-- 								<td id="savingBase2"></td> -->
<!-- 							</tr> -->
						</table>
					</div>
					<!-- <div id="savingBase2"></div> -->
					<div id="savingBase3"><h4>저축 기간별 금리</h4></div>
					<div id="savingOpt"></div>
				</div>
				
				<div class="modal-footer" style="display: inline;">
					<div id="cal" style="float: left;">금리 계산기<br><p id="tax">일반세율 <span id="taxPercent">15.4%</span>가 적용됩니다.</p></div>
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
	//상품 상세보기 출력
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
		
		// modal 닫기 이벤트
		closeModal();
	})
	
	// 인기상품 상세보기 출력
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
		
		// modal 닫기 이벤트
		closeModal();
	})
	
		// 상품리스트 최고금리 출력
		for(prd of $("#list").find(".prds")){
			var sav_id = prd.getAttribute("data-sav_id");

			$.ajax({
				url:"prdSavOpt",
				data:{sav_id : sav_id},
				async: false
			}).done(function(result){
				for(opt of result){
					if(sav_id == opt.sav_id){
						prd.children[1].children[2].innerText = "최고금리 " + opt.intr_rate2 + "%";
					}
				}
			});
		};
		
		// 인기상품 최고금리 출력
		for(prd of $(".testi_inner").find(".div_sav")){
			var sav_id = prd.getAttribute("data-sav_id");

			$.ajax({
				url:"prdSavOpt",
				data:{sav_id : sav_id},
				async: false
			}).done(function(result){
				for(opt of result){
					if(sav_id == opt.sav_id){
						prd.children[0].children[2].innerText = "최고금리 " + opt.intr_rate2 + "%";
					}
				}
			});
		};
		// 적금 계산 공식
		function calculator(){
			var type = $("#type").text(); //금리유형 추출
			var month = $("#date option:selected").attr('name'); //개월수 추출
			var intr = $("#date option:selected").val(); // 선택된 개월 최고금리 추출
			var saving = document.getElementById("savMoney").value; // 금액 추출
			
			var month1 = month / 12 	// 개월수를 년수로 변환
			var money = Number(saving); // 금액 number로 변환
			var num2 = Number(intr); 	// 최고금리 number로 변환
			var month2 = Number(month); // 개월 number로 변환
			var money1 = money;
			
			if(type == 'S'){ //단리일경우
				var interest = (intr/100) * (month2 + 1)/24;
				var tax = (interest*100) * (1-(15.4 / 100));
				var taxMoney = (money*month) * (tax/100); // 세후 이자액
				var total = (money*month) + taxMoney // 세후 총액
				document.getElementById("totalText").innerHTML = "<div id='totalText'>만기수령액은 <span id='total'>" + Math.round(total) + "원 </span>입니다.</div>";
			}else if(type == 'M'){ //복리일경우
					var interest = money * ( (1+(intr/100)) ** ((month2+1)/12) - (1+(intr/100)) ** (1/12)) / ( (1+(intr/100)) ** (1/12) - 1) - (money * month) // 이자 계산
					var taxMoney = interest * (1- (15.4/100)); // 세후 이자액
					var total = (money * month) + taxMoney; // 세후 총액
				
				document.getElementById("totalText").innerHTML = "<div id='totalText'>만기수령액은 <span id='total'>" + Math.round(total) + "원 </span>입니다.</div>";
			}
			//천단위 콤마
			$("#totalText").html($("#totalText").html().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
		}
		
		// 적금 계산기 호출
		function savMoney() {
			calculator();
			
			$("#savMoney").keyup(function savMoney(){
				calculator();
			})
		}
		// 상품 상세보기 정보
		function makeSavBase(sav){
			/* $("#savingBase1").html("<상품명><br>" + sav.fin_prdt_nm
								  +"<br><가입방법><br>" + sav.join_way
								  +"<br><만기 후 이자율><br>" + sav.mtrt_int
								  +"<br><우대조건><br>" + sav.spcl_cnd
								  +"<br>가입대상 : " + sav.join_member
								  +"<br><유의사항><br>" + sav.etc_note)
			if(sav.max_limit != null){
				$("#savingBase2").html("최고한도 : " + sav.max_limit+"원")
			} */
			
			$("#fin_prdt_nm").html(sav.fin_prdt_nm);
			$("#join_way").html(sav.join_way);
			$("#mtrt_int").html(sav.mtrt_int);
			$("#spcl_cnd").html(sav.spcl_cnd);
			$("#join_member").html(sav.join_member);
			$("#etc_note").html(sav.etc_note);
			
			if(sav.max_limit != 0){
				let tr = `<tr>
							<th>최고한도</th>
							<td id="savingBase2">\${sav.max_limit}</td>
						</tr>`;
				$("table").append(tr);
				//$("#savingBase2").html(dep.max_limit);
				
				for(amt of $("#savingBase2")){
					amt.innerHTML = amt.innerHTML.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 원";
				}
			}
		}
		
		// 상품 상세보기 옵션
		function makeSavOpt(result){
			$('#date').empty();
	        let opthtml = '<option value="">선택</option>';
	        
			for(opt of result){
				$("<div>").append( $("<hr>") )
						  .append( $("<div>").html("적립유형명 : " + opt.rsrv_type_nm))
						  .append( $("<div>").html("저축기간 : " + opt.save_trm + "개월"))
						  .append( $("<div>").html("최소 " + opt.intr_rate + "%") )
						  .append( $("<div>").html("최대 " + opt.intr_rate2 + "%") )
						  .append( $("<div style='display:none;' id='type'>").html(opt.intr_rate_type))
						  .appendTo($("#savingOpt"));

	            opthtml += "<option value='"+opt.intr_rate2+"' name='"+opt.save_trm+"'>"+opt.rsrv_type_nm+" "+opt.save_trm+"개월</option>"
			}
			
	        $("#date").html(opthtml);
	        $("#date").niceSelect("update");
		}
		
		// 모달 창 닫기 이벤트
		function closeModal(){
			$("#modal").on("hidden.bs.modal", function(){
				$(".list > li").remove(); // select개월수 초기화
				$("#date > option").remove(); // select개월수 초기화
				$("#totalText").html(""); // 만기금액 초기화
				$(".depOpt > #depMoney").val(""); // 입력금액 초기화
				$("#savingBase2").closest('tr').remove(); // 최고한도 초기화
			})
		}
		// 더보기
		   $(window).ready(function(){
		      $("#list").children("div").slice(0,10).show().css("display", "flex");
		      
		      $("#read").click(function(e){
		         console.log($("#list").children("div:hidden").length)
		         if( $("#list").children("div:hidden").length == 0){
		        	 $("#read").hide();
		         }else{
			         e.preventDefault();
			         $("#list").children("div:hidden").slice(0,10).show().css("display", "flex");
		         }
		      })
		   })
</script>