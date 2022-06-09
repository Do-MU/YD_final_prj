<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="http://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#li_name {
	margin-right: 5px;
}

#li_noti {
	width: 30px;
	height:120px;
	text-align: center;
}

#li_noti:hover {
	cursor: pointer;
}
#modal_noti{
	position: fixed;
	top:0%;
	right:0%;
    transform: translate(28%, 7%);
}
#modal_noti .modal-content{
	width: 400px;
}
#mod_notiList{
	min-height: 250px;
	max-height: 500px;
	overflow: auto;
}
#modal_noti #mod_btns{
	display:flex;
	padding: 0 50px 10px;
}
#modal_noti #mod_readAll{
	flex:2;
	text-align:right;
	margin-right:5px;
}
#modal_noti #mod_readDel{
	flex:3;
	margin-left:5px;
}
#modal_noti #mod_readAll:hover,
#modal_noti #mod_readDel:hover{
	cursor:pointer;
	color:#585858;
}
#modal_noti #mod_btns p{
	margin:0 auto;
	text-align: center;
}
#modal_noti .mod_notis{
	padding: 10px 20px;
}
.mod_notis_read{
	background-color: #DCDCDC;
}
#modal_noti .mod_data{
	line-height : 30px;
}
#modal_noti .mod_title{
	color:black;
}
#modal_noti .mod_contents{
	font-size:0.8em;
}
#modal_noti:after {
	 border-top:0px solid transparent;
	 border-left: 10px solid transparent;
	 border-right: 10px solid transparent;
	 border-bottom: 10px solid white;
	 content:"";
	 position:absolute;
	 right:50%;
	 top:20px;
}
#modal_noti hr {
	margin : 0;
}
.badge{
	background-color: red;
	color: white;
	position: relative;
    top: -69%;
    right: -36%;
}
.navbar_fixed .badge{
    top: -50%;
}
.mod_data:hover{
	cursor: pointer;
}
</style>
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container box_1620">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="home"><img src="${pageContext.request.contextPath}/resources/img/logo.png" alt=""></a>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">계좌</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="accountList">내 계좌 목록</a></li>
								<li class="nav-item"><a class="nav-link" href="accRemitForm">송금</a></li>
							</ul>
						</li>
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">카드</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="myCardListView">내 카드 목록</a></li>
								<li class="nav-item"><a class="nav-link" href="PrdCardListView">상품추천</a></li>
							</ul>
						</li>
						<li class="nav-item submenu dropdown">
							<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">금융상품</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="prdDepositList">예금상품</a></li>
								<li class="nav-item"><a class="nav-link" href="prdSavingList">적금상품</a></li>
								<li class="nav-item"><a class="nav-link" href="prdLoanList">대출상품</a></li>
							</ul>
						</li>
						<li class="nav-item"><a class="nav-link" href="monthView">가계부</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList">커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="tips">팁</a></li>
						<li class="nav-item"><a class="nav-link" href="prdChallengeList">챌린지</a></li>
						<li class="nav-item"><a class="nav-link" href="#"></a></li>
						<c:if test="${empty loginUser}">
							<li class="nav-item"><a class="nav-link" href="userLoginForm">로그인</a></li>
						</c:if>
							
						<c:if test="${not empty loginUser}">
							<li class="nav-item submenu dropdown" id="li_name">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${loginUser.name} 님</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="userUpdateForm">나의 정보</a></li>
									<li class="nav-item"><a class="nav-link" href="challengeList">나의 챌린지</a></li>
									<li class="nav-item"><a class="nav-link" href="expendAnal">지출분석</a></li>
									<li class="nav-item"><a class="nav-link" href="qnaList">고객센터</a></li>
								</ul>
							</li>
							<li class="nav-item" id="li_noti">
								<i id="noti" class="nav-link bi bi-bell-fill"></i>
								<span class="badge badge-number"></span>
							</li>
							<li class="nav-item"><a class="nav-link" href="userLoginForm">로그아웃</a></li>
							
							<div class="modal" id="userInfoModal" tabindex="-1">
								  <div class="modal-dialog">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title">Modal title</h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body">
								        <p>Modal body text goes here.</p>
								      </div>
								      <div class="modal-footer">
								        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
								        <button type="button" class="btn btn-primary">Save changes</button>
								      </div>
								    </div>
								  </div>
							</div>
						</c:if>
					</ul>
				</div> 
			</div>
		</nav>
	</div>
</header>

<!-- NOTI MODAL -->
<div class="modal fade" id="modal_noti" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">

			<div class="modal-body">
				<div id="mod_btns">
					<p id="mod_readAll">전체 읽음</p>
					<p>|</p>
					<p id="mod_readDel">읽은 알림 지우기</p>
				</div>
				<hr>
				<div id="mod_notiList"></div>
			</div>

			<div class="modal-footer">
			</div>

		</div>
	</div>
</div>


<script>
	function notiSelect(){
		var cnt = 0;
		$.ajax({
			url:"notiSelect"
		}).done(function(notis){
			if(notis.length != 0){
				for(n of notis){
					if(n.noti_read_code == 'AR0'){
						cnt++;
						let html = '<div class="mod_data"><div class="mod_title" data-code='+n.noti_code+" data-num="+n.num+'>'+n.val+'</div><div class="mod_contents">'+n.noti_contents+'</div></div>';
						$("<div>").html(html).addClass("mod_notis").appendTo($("#mod_notiList"));
						$("#mod_notiList").append($("<hr>"));
					}else{
						let html = '<div class="mod_data"><div class="mod_title" data-code='+n.noti_code+" data-num="+n.num+'>'+n.val+'</div><div class="mod_contents">'+n.noti_contents+'</div></div>';
						$("<div>").html(html).addClass("mod_notis mod_notis_read").appendTo($("#mod_notiList"));
						$("#mod_notiList").append($("<hr>"));
					}
				}
			}else{
				$("<div>").html("알림이 없습니다.").css("text-align","center").css("line-height","100px").appendTo($("#mod_notiList"));
				$(".badge").attr("hidden","hidden");
			}
			if(cnt == 0){
				$(".badge").attr("hidden","hidden");
			}
			$(".badge").text(cnt);
		});
	}

	if(${loginUser!=null}){
		notiSelect();
	}
	
	$("#li_noti").click(function(){
		$("#modal_noti").modal("show");
	});

	$("#mod_readAll").on('click',function(){
		$("#mod_notiList").html("");
		$.ajax({
			url:"notiReadAll",
			data:{id:"${loginUser.id}"}
		}).done(function(){
			notiSelect();
			$(".badge").attr("hidden","hidden");
		});
	});
	
	$("#mod_readDel").on('click',function(){
		$("#mod_notiList").html("");
		$.ajax({
			url:"notiReadDel",
			data:{id:"${loginUser.id}"}
		}).done(function(){
			notiSelect();
		});
	})
	
	// 알림 선택시 -> 각 viewPage 이동
	$("#mod_notiList").on("click", ".mod_notis", function(){
		let noti_code = $(this).children().children('.mod_title').data('code');	// code
		let num = $(this).children().children('.mod_title').data('num');		// num
		if(noti_code == 'N1' || noti_code == 'N4' || noti_code == 'N10'){		// 게시판 알림
			getRead(num)
			location.href='boardList';
		} else if(noti_code == 'N2' || noti_code == 'N5'){						// 계좌 알림
			getRead(num)
			location.href='accountList';
		} else if(noti_code == 'N3'){											// 고객센터 알림
			getRead(num)
			location.href='qnaList';	
		} else if(noti_code == 'N6'){											// 제재 알림
			getRead(num)
			location.href='userUpdateForm';
		} else if(noti_code == 'N7'|| noti_code == 'N8' || noti_code == 'N9'){	//챌린지 알림
			getRead(num)
			location.href='challengeList';
		}
	})
	
	// 알림 선택시 -> 읽음 처리
	function getRead(num){
		$.ajax({
			url:"notiReadOne",
			data:{
				id : "${loginUser.id}",
				num : num
			}
		}).done(function(){
// 			notiSelect();
// 			$(".badge").attr("hidden","hidden");
		});
	}
</script>