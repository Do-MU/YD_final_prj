<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
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

<section class="contact_area p_120">
	<div class="container">
		<div id="list"></div><br>
	</div>
	
	<div class="modal fade" id="modal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="bankName"></h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div id="depositOpt"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='depositJoinForm'">가입하러가기</button>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	// 리스트 목록 출력
	$.ajax({
		url:"prdDepBase"
	}).done(function(result){
		for(dep of result){
			$("<div>").data("dep_id",dep.dep_id)
					  .append( $("<div>").html(dep.kor_co_nm) )
					  .append( $("<div>").html(dep.fin_prdt_nm) )
					  .append( $("<div>").html(dep.join_way) )
					  .append( $("<button>").html("상세보기").addClass("depView") )
					  .append( $("<div>").attr("id","dep"+dep.dep_id))
					  .appendTo($("#list"))
		}
	});
	
	//상세보기시 옵션 출력
	$("#list").on("click",".depView",function(){
		$("#bankName").html("");
		$("#depositOpt").html("");
		
		var dep_id = $(this).parent().data("dep_id");
		$("#modal").modal("show");
		
		$.ajax({
			url: "prdDepBase",
			data:{dep_id: dep_id}
		}).done(function(result){
				$("<div>").append($("<div>").html(dep.kor_co_nm))
						  .appendTo($("#bankName"))
		});
		
		$.ajax({
			url:"prdDepOpt",
			data:{dep_id:dep_id}
		}).done(function(result){
			for(opt of result){
				$("<div>").append( $("<div>").html(opt.save_trm + "개월"))
						  .append( $("<div>").html("최소 " + opt.intr_rate + "%") )
						  .append( $("<div>").html("최대 " + opt.intr_rate2 + "%") )
						  .appendTo($("#depositOpt"))
			}
		});
	});
	
</script>