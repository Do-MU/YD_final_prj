<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- fullcalendar -->
<script src="${pageContext.request.contextPath}/resources/ledger/main.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ledger/main.css">
<!-- fullcalendar 언어 CDN -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/locales-all.js"></script>
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
			//progressiveEventRendering : true,
			locale: "ko",
			eventColor: '#ffffff00',
			height: 680,
			header: { center : 'title'},
			events: function(info, successCallback, failureCallback) {

			    const startDate = info.start;
			    
				$.ajax({
					url : "totalTrans",
					data : { 
						tdate : startDate,
						user_id : "${loginUser.id}"
					},
					success : 
						function(result) {
						
							var events = [];
						
							if(result!=null) {
							
								$.each(result, function(index, element) {
									var price = priceToString(element.title);
									events.push({
	                                	 title: price,
	                                	 start: element.start,
	                                	 className: element.className
	                                })
                                })                                
							}
							successCallback(events);
						}		
				})
			},
			dateClick : function(info) {
				
				$("#listHead").empty();
				$("#listBody").empty();
				$("#dayOutTotal").empty();
				$("#dayInTotal").empty();
				$('#empty').empty();
				
				const date = info.dateStr;
				$("#title").html(date)
				
				$.ajax({
					url : "dayTotalAmt",
					data : {
						tdate : date,
						user_id : "${loginUser.id}"
					}
				}).done(function(data) {
				
					for(d of data) {
						if(d.io_code=='I1') {
							var dayOutTotal = priceToString(d.amt);
							$("#dayOutTotal").html('총 지출: ' + dayOutTotal + '원');
						} else {
							var dayInTotal = priceToString(d.amt);
							$("#dayInTotal").html('총 수입: ' + dayInTotal + '원');
						}
					}
				});
				
				$.ajax({
					type : 'GET',
					url : "dayView",
					data : {
						tdate : date,
						user_id : "${loginUser.id}"
					}
				}).done(function(datas) {
				
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
							
						}
					} else {
						$('#empty').html("거래내역이 없습니다.");
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
			},
			/* eventSources: [{ //현금 내역 등록
				events: function btnInsert(info, successCallback, failureCallback) {
					$.ajax({
						url: "cashInsert",
						method: 'POST',
						data : $("#cashInsertFrm").serialize(),
						success: function(data) {
							successCallback(data);
							$('#myModal').modal('hide');
							$('#myModal').on('hidden.bs.modal', function (e) { 
								document.forms['modalForm'].reset(); 
							})
						}
					});
				}
			}] */
		});

		calendar.render();

	});
	
	//현금 입출금 입력 처리
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
		$.ajax({
			url : "cashInsert",
			method : 'POST',
			data : $("#cashInsertFrm").serialize(),
			success : function(result) {
				//입력한 정보값이 달력에 바로 출력 되도록....
				console.log(result)
				
				$('#myModal').modal('hide');
				$('#myModal').on('hidden.bs.modal', function (e) { 
					document.forms['modalForm'].reset(); 
				})
			}
		});
	}
	
	//오늘날짜 거래내역 자동출력
	window.addEventListener('DOMContentLoaded', function todayView() {
		var curDate = new Date().toISOString().substring(0,10);
		
		$("#title").html(curDate);
		
		$.ajax({
			url : "dayTotalAmt",
			data : {
				tdate : curDate,
				user_id : "${loginUser.id}"
			}
		}).done(function(data) {
		
			for(d of data) {
				if(d.io_code=='I1') {
					var dayOutTotal = priceToString(d.amt);
					$("#dayOutTotal").html('총 지출: ' + dayOutTotal + '원');
				} else {
					var dayInTotal = priceToString(d.amt);
					$("#dayInTotal").html('총 수입: ' + dayInTotal + '원');
				}
			}
		});
		
		$.ajax({
			type : 'GET',
			url : "dayView",
			data : {
				tdate : curDate,
				user_id : "${loginUser.id}"
			}
		}).done(function(datas) {
		
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
					
				}
			} else {
				$('#empty').html("거래내역이 없습니다.");
			}	
		});
	});
	
	function btnSearch(e) {
		e.preventDefault();
		
		var form = document.searchForm;
		if (!form.keyword.value) {
	        alert("검색어를 입력해주세요.");
	        return;
	    }
		
		$.ajax({
			url : "ledgerSearch",
			data : $("#ledgerSearchFrm").serialize()
		}).done(function(datas) {
			console.log(datas)
		
			$("#listHead").empty();
			$("#listBody").empty();
			$("#dayOutTotal").empty();
			$("#dayInTotal").empty();
			$('#empty').empty();
			$("#title").empty();
			
			
		if(datas.length != 0) {
				
			 	$("#title").html("최근 한달 \'" + datas[0].keyword + "\' 검색결과");
			 	
				let tr1 = `<tr>
						      <th scope="col">날짜</th>
						      <th scope="col">분류</th>
						      <th scope="col">내용</th>
						      <th scope="col">금액</th>
					       </tr>`;
				
				$('#listHead').append(tr1);
				
				for(d of datas) {
					let price = priceToString(d.amt);
					let date = new Date(d.tdate).toISOString().substring(0,10);
					let tr2 = `<tr>
							      <th scope="row">\${date}</th>
							      <td>\${d.val}</td>
							      <td>\${d.content}</td>
							      <td data-iocode=\${d.io_code}>\${price}원</td>
							   </tr>`;
					   
					$('#listBody').append(tr2);		
					
				}
			} else {
				$('#empty').html("검색 결과가 없습니다.");
			}
		
			document.getElementById("ledgerSearchFrm").reset();
			$("#keyInput").focus();
		})
	}
	
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
#calendar, #ledgerFooter {
	width : 850px;
	margin-left : auto;
	margin-right : auto;
}
</style>

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
	    </div>
	</section>

	<!-- 가계부 달력 하단 부분 시작 -->
	<div id="ledgerFooter">
		<!-- 가계부 검색창 -->
		<div id="ledgerSearch">
			<div class="row">
				<form id="ledgerSearchFrm" name="searchForm">
					<input type="hidden" name="user_id" value="${loginUser.id}">
					<table class="pull-right">
						<tr>
							<td><input type="text" class="form-control" placeholder="검색어 입력" name="keyword" maxlength="100" id="keyInput"></td>
							<td><button class="btn btn-dark" onclick='btnSearch(event)'>검색</button></td>	
						</tr>
					</table>
				</form>
			</div>
		</div>
		
		<!-- 오늘날짜(디폴트)와 클릭한 날짜의 입출금 내역 출력 되는 곳 -->
		<div id="dayView" class="container-fluid">
			<p class="h2 text-center" id="title"></p>
			<div id="dayTotal">
				<p class="h4 text-center" id="dayOutTotal"></p>
				<p class="h4 text-center" id="dayInTotal"></p>
			</div>
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
	<!-- 가계부 달력 하단 부분 끝 -->

	<!-- 현금 지출수입내역 입력 Modal -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" name="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">현금거래 등록하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="cashInsertFrm" name="modalForm">
						<input type="hidden" name="user_id" value="${loginUser.id}">
						<div>
							<input type="radio" id="choice1" name="io_code" value="I1">
							<label for="choice1">지출</label> 
							<input type="radio" id="choice2" name="io_code" value="I2"> 
							<label for="choice2">수입</label>
						</div>
						<label>날짜 </label> 
						<input type="date" name="tdate"> <br><br> 
						<label>분류 </label> 
						<select name="cat_code">
							<option value="">선택</option>
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
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					<button type="button" class="btn btn-primary" onclick="btnInsert()">입출금내역 입력</button>	
				</div>
			</div>
		</div>
	</div>
	<!-- Modal 끝 -->
