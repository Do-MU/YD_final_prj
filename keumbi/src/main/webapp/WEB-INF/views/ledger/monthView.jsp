<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8' />
<script
	src="${pageContext.request.contextPath}/resources/ledger/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ledger/main.css">
<script>
	if (!'${loginUser.id}') {
		alert('로그인이 필요합니다.');
		window.location = "userLoginForm";
	}

	function priceToString(price) {
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			//editable : true,
			selectable : true,
			//businessHours : false,
			dayMaxEvents : true, 
			progressiveEventRendering : true,
			events : "totalTrans",
			eventColor: '#ffffff00',
			dateClick : function(info) {
				
				$("#listHead").empty();
				$("#listBody").empty();
				$('#empty').empty();
				
				const date = info.dateStr;
				$("#title").html(date)
				
				$.ajax({
					type : 'GET',
					url : "dayView",
					data : {
						tdate : date,
						user_id : "${loginUser.id}"
					}
				}).done(function(datas) {
					console.log(datas)
				
					if(datas.length != 0) {
						
						let tr1 = `<tr>
								      <th scope="col">#</th>
								      <th scope="col">분류</th>
								      <th scope="col">내용</th>
								      <th scope="col">금액</th>
							       </tr>`;
						
						$('#listHead').append(tr1);
						
						for(data of datas) {
							let price = priceToString(data.amt);
							let tr2 = `<tr>
									      <th scope="row">\${data.num}</th>
									      <td>\${data.val}</td>
									      <td>\${data.content}</td>
									      <td data-iocode=\${data.io_code}>\${price}원</td>
									   </tr>`;
							
									   
							$('#listBody').append(tr2);		
							//$("#dayTotal").
						}
					} else {
						
						$('#empty').html("해당 날짜에 거래내역이 없습니다.");
					}	
				});
				
				
			},
			customButtons : {
				cashInsertButton : {
					text : '현금내역등록',
					click : function() {
						$('#myModal').modal('show');
					}
				}
			},
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'cashInsertButton'
			}
		});

		calendar.render();

	});
	
	
</script>

<style>
.out {
	color: red !important;
}

.in {
	color: blue !important;
}

body {
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
[data-iocode="I1"] {
	color : red;
}
[data-iocode="I2"] {
	color : blue;
}
</style>

</head>

<body>

	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>가계부</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">
			<c:if test="${not empty loginUser.id}">
	      		<div id='calendar'></div>
	    	</c:if>

	<!-- 클릭한 날짜의 입출금 내역 출력 되는 곳 -->
	<div id="dayView">
		<p class="h2 text-center" id="title"></p>
		<p class="h4 text-right" id="dayTotal"></p>
		<table class="table" id="table">
	  		<thead class="thead-dark" id="listHead">   
	  		</thead>
			<tbody id="listBody">    
			</tbody>
		</table>
		<p class="h2 text-center" id="empty"></p>
	</div>
	<!-- 클릭한 날짜 입출금 내역 끝 -->
	</div>
	</section>

	<!-- 현금 지출수입내역 입력 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" name="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">현금거래 등록하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="cashInsertFrm" name="modalForm">
						<input type="hidden" name="user_id" value="user1">
						<div>
							<input type="radio" id="choice1" name="io_code" value="I1">
							<label for="choice1">지출</label> 
							<input type="radio" id="choice2" name="io_code" value="I2"> 
							<label for="choice2">수입</label>
						</div>
						<label>날짜 </label> <input type="date" name="tdate"> <br>
						<br> <label>분류 </label> <select name="cat_code">
							<option value="">선택</option>
							<!-- <option value="D001">식비</option>
							<option value="D002">카페/간식</option>
							<option value="D003">술/유흥</option>
							<option value="D004">생활</option>
							<option value="D005">온라인쇼핑</option>
							<option value="D006">패션/쇼핑</option>
							<option value="D007">뷰티/미용</option>
							<option value="D008">교통</option>
							<option value="D009">주거/통신</option>
							<option value="D010">의료/건강</option>
							<option value="D011">금융</option>
							<option value="D012">문화/여가</option>
							<option value="D013">여행/숙박</option>
							<option value="D014">교육/학습</option>
							<option value="D015">여행/숙박</option>
							<option value="D016">급여</option>
							<option value="D017">이체</option>
							<option value="D018">ATM출금</option>
							<option value="D019">기타</option> -->
							<c:forEach var="c" items="${code}">
								<option value="${c.code}">${c.val}</option>
							</c:forEach>
						</select> <br>
						<br> <label>금액 </label> <input type="number" name="amt">
						<br> <label>내용 </label> <input type="text" name="content">
						<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="btnInsert()">입출금내역 입력</button>	
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝 -->

</body>
<script>
	//현금 입출금 입력 처리
	const url = "http://localhost/prj/cashInsert";
	function btnInsert() {
		
		var form = document.modalForm;
		
	    if (!form.io_code.value) {
	        alert("지출/수입을 선택해주세요.");
	        return;
	    }
	    if (!form.tdate.value) {
	        alert("거래 날짜를 선택해주세요.");
	        return;
	    }
	    if (!form.cat_code.value) {
	        alert("분류를 선택해주세요.");
	        return;
	    }
	    if (!form.amt.value) {
	        alert("금액을 입력해주세요.");
	        form.amt.focus();
	        return;
	    }
	    if (!form.content.value) {
	        alert("내용을 입력해주세요.");
	        form.content.focus();
	        return;
	    }
		$.ajax(url, {
			method : 'POST',
			data : $("#cashInsertFrm").serialize()
		}).done(function(result) {
			//입력한 정보값이 달력에 바로 출력 되도록 해야함....
			console.log(result)
			
			$('#myModal').modal('hide');
			$('#myModal').on('hidden.bs.modal', function (e) { 
				document.forms['modalForm'].reset(); 
			})	
		});
	}
</script>

</html>
