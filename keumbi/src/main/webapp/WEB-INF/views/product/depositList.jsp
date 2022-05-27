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
#depositBase1, #depositBase2{
	font-size:1.25em;
	line-height:40px;
}
#depositBase3{
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


#total, #taxPercent{	
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

#depMoney{
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

#list{
	display:none;
}
</style>


<section class="banner_area">
	<div class="container box_1620">
		<div class="banner_inner d-flex align-items-center">
			<div class="container">
				<div class="banner_content text-center">
					<h2>예금상품추천</h2>
					<div class="page_link">
						<a href="home">Home</a>
						<a href="prdDepositList">예금상품추천</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="contact_area p_120">
	<div class="container">
		<div id="list">
			<c:forEach var="d" items="${depList}">
				<div class="prds" data-dep_id="${d.dep_id}">
					<div class="div_img"><img src="${pageContext.request.contextPath}/resources/img/bank_logo/${d.kor_co_nm}.jpg" width="150px" height="150px"></div>
					<div class="div_exp">
						<div class="div_banknm">${d.kor_co_nm}</div>
						<div class="div_prdnm">${d.fin_prdt_nm}</div>
						<div class="div_intr"></div>
						<div class="div_joinway">${d.join_way}</div>
					</div>
					<div class="div_btn">
						<button class="depView">자세히 보기</button>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
		<div id="plus_button" class="btn_wrap">
			<a href="javascript:;" class="button">더보기</a>
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
					<div id="depositBase1"></div>
					<div id="depositBase2"></div>
					<div id="depositBase3">저축 기간별 금리</div>
					<div id="depositOpt"></div>
				</div>
				
				<div class="modal-footer" style="display: inline;">
					<div id="cal" style="float: left;">금리 계산기<br><p id="tax">일반세율 <span id="taxPercent">15.4%</span>가 적용됩니다.</p></div>
					<div class="depOpt" style="float: right" onchange="depMoney()">
						<select id="date">
							<option value="" selected>선택</option>
						</select>
						<input type="text" id="depMoney" name="depMoney" placeholder="숫자만 입력해주세요">원
					</div>
				</div>
				<div id="totalText"></div>
			</div>
		</div>
	</div>
</section>

<script>	
	//상세보기시 옵션 출력
	$(".prds").on("click", ".depView", function(){
		$("#modal").modal("show"); //modal 창 생성
		$('.modal-body').animate({scrollTop: 0},400); //스크롤 상단이동
		
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
			//console.log(result);
			
	         $('#date').empty();
	         let opthtml = '<option value="">선택</option>';
	         
			for(opt of result){
				$("<div>").append( $("<hr>") )
						  .append( $("<div>").html("저축기간 : " + opt.save_trm + "개월"))
						  .append( $("<div>").html("최소 " + opt.intr_rate + "%") )
						  .append( $("<div>").html("최대 " + opt.intr_rate2 + "%") )
						  .append( $("<div style='display:none;' id='type'>").html(opt.intr_rate_type))
						  .appendTo($("#depositOpt"));

	            opthtml += "<option value='"+opt.intr_rate2+"' name='"+opt.save_trm+"'>"+opt.save_trm+"개월</option>"
			}

	         $("#date").html(opthtml);
	         $("#date").niceSelect("update");
		});
		
		/*modal 닫기 이벤트*/
		$("#modal").on("hidden.bs.modal", function(){
			$(".list > li").remove(); // select개월수 초기화
			$("#date > option").remove(); // select개월수 초기화
			$("#totalText").html(""); // 만기금액 초기화
			$(".depOpt > #depMoney").val(""); // 입력금액 초기화
		})
	});
	
	// 상품리스트 최고금리 출력
	for(prd of $("#list").find(".prds")){
		var dep_id = prd.getAttribute("data-dep_id");

		$.ajax({
			url:"prdDepOpt",
			data:{dep_id : dep_id},
			async: false
		}).done(function(result){
			for(opt of result){
				if(dep_id == opt.dep_id){
					prd.children[1].children[2].innerText = "최고금리 " + opt.intr_rate2 + "%";
				}
			}
		});
	};
	
	
	// 예금 계산 공식
	function calculator(){
		var type = $("#type").text(); //금리유형 추출
		var month = $("#date option:selected").attr('name'); //개월수 추출
		var month1 = month / 12 // 개월수를 년수로 변환
		
		var intr = $("#date option:selected").val(); // 선택된 개월 최고금리 추출
		var deposit = document.getElementById("depMoney").value; // 금액 추출
		
		var money = Number(deposit); // 금액 number로 변환
		var num2 = Number(intr); // 최고금리 number로 변환
		
		if(type == 'S'){ //단리일경우
			var interest = money * (num2/100);
			var tax = interest * (15.4 / 100);
			var total = money + (interest - tax);			
			document.getElementById("totalText").innerHTML = "<div id='totalText'>만기수령액은 <span id='total'>" + Math.round(total) + "원 </span>입니다.</div>";
		}else if(type == 'M'){ //복리일경우
			var price = money * ((1+(num2/100)) ** month1) //세전금액: 입력된금액 * ((1+(금리/100))^년수)
			var tax = (price - money) * (15.4 / 100); // 세금계산 (만기액 - 원금) * 15.4%
			var total = (price - tax); // 세후금액: 금액 - 세금
			document.getElementById("totalText").innerHTML = "<div id='totalText'>만기수령액은 <span id='total'>" + Math.round(total) + "원 </span>입니다.</div>";
		}
		//천단위 콤마
		$("#totalText").html($("#totalText").html().toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
	}
	
	// 예금 계산기 호출
	function depMoney() {
		calculator();
		
		$("#depMoney").keyup(function depMoney(){
			calculator();
		})
	}
	
	// 더보기 왜안돼애애애ㅐ애액
	/*$(function(){
		$("div").slice(0,10).show();
		$("#plus_button").click(function(e){
			e.preventDefault();
			$("div:hidden").slice(0,10).show();
			if($("div:hidden").length == 0){
				alert("없음")
			}
		})
		
	}) */
	
</script>