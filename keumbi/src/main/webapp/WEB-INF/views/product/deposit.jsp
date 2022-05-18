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
		<div id="list"></div>
	</div>
</section>

<c:forEach var="pd" items="${prdDepBase}" varStatus="status">
	<div class="depositList">
		<div id="bankName">${pd.kor_co_nm}</div>
		<div id="depName">${pd.fin_prdt_nm}</div>
		<div id="group"
			style="border-bottom: 1px solid; display: inline-block;">
			${pd.join_way }
			<button type="button" class="btn btn-join">가입하기</button>
			<button type="button" class="btn btn-select" data-toggle="modal"
				id="selModal">상세보기</button>
			<input type="button" class="btn btn-select" data-toggle="modal"
				value="상세보기" class="selModal">
		</div>
	</div>
	<br>

	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title">${pd.kor_co_nm}</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div id="depositOpt"></div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">가입하러가기</button>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<script>
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
	
	$("#list").on("click",".depView",function(){
		var dep_id = $(this).parent().data("dep_id");
		$.ajax({
			url:"prdDepOpt",
			data:{dep_id:dep_id}
		}).done(function(result){
			console.log(result);
			for(opt of result){
				$("<div>").append( $("<div>").html("최소 " + opt.intr_rate + "%") )
						  .append( $("<div>").html("최대 " + opt.intr_rate2 + "%") )
						  .append( $("<div>").html(opt.save_trm + "개월") )
						  .appendTo($("#dep"+opt.dep_id))
			}
			
		})
		
	})
</script>