<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">


	// 로그인 체크 
	if (!'${loginUser.id}') {
		//alert('로그인이 필요합니다.');
		swal("로그인이 필요합니다.", {icon: 'error'}).then((value) => {
			window.location = "userLoginForm";			
		})
	}	
	
	//금액 천단위 쉼표 function
	function priceToString(price) {
	    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	//날짜 구하는 function
	var year, month, day;
	getToday();

	function getToday() {
		var date = new Date();
		year = date.getFullYear();
		month = date.getMonth();
	 	day = date.getDate();
	 	//console.log(year+"---"+month+"---"+day)
	}
	
	$(document).ready(function() {
		let print = year+'-'+(month+1);
		$("#thisMonth").html(year+'년 '+(month+1)+'월');
	});
	
	// 이전달 연월 구하는 함수 -> 영역차트
	function getPrevMonth() {
		var tdate = new Date(year, month, day);
		var tyear = tdate.getFullYear();
		var tmonth = tdate.getMonth();	
		return tyear + '-' + ("0"+tmonth).slice(-2)
	}
	
	// 6개월전 1일 구하는 함수 -> 컬럼차트
	function getFirstMonth() {
		var firstm = month-5
		var tdate = new Date(year, firstm, 1);
		var tyear = tdate.getFullYear();
		var tmonth = tdate.getMonth();	
		return tyear + '-' + ("0"+(tmonth+1)).slice(-2)+'-01';
	}
	
	// 마지막 월일 구하는 함수 -> 영역차트, 컬럼차트	
	function getLastDay() {
		 
		var tdate = new Date(year, month+1, 0);
		var tyear = tdate.getFullYear();
		var tmonth = tdate.getMonth();
		var tday = tdate.getDate();		
		return tyear + '-' + ("0"+(tmonth+1)).slice(-2) + '-' + tday	
		
	}
	
	google.charts.load('current', {
		'packages' : [ 'corechart', 'bar']
	});
	
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		drawPieChart();
		drawAreaChart();
		//drawColumnChart1();
		drawColumnChart2();
		//drawColumnChart3(); 
	}
	
	
	// 파이차트: 카테고리별 지출항목 통계 출력
	function drawPieChart() {
		var yearMonth = year + '-'+('0'+(month+1)).slice(-2) 
		var jsonData = $.ajax({
			url : "monthlyAnalysis",
			data : {
				user_id : "${loginUser.id}",
				yearMonth : yearMonth
			},
			async : false
		}).responseText;

		var obj = jQuery.parseJSON(jsonData);
		var data = new google.visualization.DataTable();
		data.addColumn('string', '카테고리');
		data.addColumn('number', '지출액');

		var arr = [];
		for (let i = 0; i < obj.length; i++) {
			arr.push([ obj[i].val, obj[i].amt ]);
		}
		data.addRows(arr);
		
		if(obj[0] != null){
			let title = (month+1)+'월 지출 통계';
			let m1 = '지출이 가장 많았던 곳'; 
			let m2 = `1위 <span style='font-weight: bold;'>#\${obj[0].val}</span> <span style='color:rgb(51, 102, 204); font-weight: bold;'>\${priceToString(obj[0].amt)}원</span>`;
			$(".pie-title").text(title);
			$(".pie-message1").text(m1);
			$(".pie-message2").html(m2);
		}else {
			let m = '거래내역이 없어요!!';
			$(".pie-message1").text(m);
		}
		if(obj[1] != null) {
			let m3 = `2위 <span style='font-weight:bold;'>#\${obj[1].val}</span>  <span style='color:rgb(220, 57, 18); font-weight: bold;'>\${priceToString(obj[1].amt)}원</span>`;
			$(".pie-message3").html(m3);	
		}
		if(obj[2] != null) {
			let m4 = `3위 <span style='font-weight: bold;'>#\${obj[2].val}</span> <span style='color:rgb(255, 153, 0); font-weight: bold;'>\${priceToString(obj[2].amt)}원</span>`;
			$(".pie-message4").html(m4);
		}
		var options = {
				fontSize : 15,
				//title : tt,
				titleFontSize : 20
		};
		
		var chart = new google.visualization.PieChart(document.getElementById('piechart'));

		chart.draw(data, options);
	}

	// 영역차트: 이번달과 지난달 지출액 비교
	function drawAreaChart() {	
		var thisMonth = year + '-'+('0'+(month+1)).slice(-2) 
		var prevMonth =  getPrevMonth();
		
		let title = prevMonth.slice(-2) + '월-' + thisMonth.slice(-2) + '월 지출 누적 비교';
		$(".area1-title").text(title);
		
		var jsonData = $.ajax({
			url : "thisPreAnalysis",
			data : {
				user_id : "${loginUser.id}",
				thisMonth : thisMonth,
				prevMonth : prevMonth
			},
			async : false
		}).responseText;
		
		var obj = jQuery.parseJSON(jsonData);
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'day');
		data.addColumn('number', thisMonth);
		data.addColumn('number', prevMonth);
		
		var arr = [];
		var today = new Date();
		let tt = '';
		
		if(year == today.getFullYear() && month == today.getMonth()){
			for (let i = 0; i < obj.length; i++) {
				if(i<today.getDate()&&i%2==0){
					arr.push([ obj[i].dt, obj[i].amt1, obj[i].amt2 ]);
				}else if(i>=today.getDate()&&i%2==0){
					arr.push([ obj[i].dt, null, obj[i].amt2 ]);
				}else if(i<today.getDate() && i%2 != 0){
					arr.push([ '', obj[i].amt1, obj[i].amt2 ]);
				}else{
					arr.push([ '', null, obj[i].amt2 ]);
				}
			}
			
			
			if(obj[today.getDate()-1].amt1 > obj[today.getDate()-1].amt2){
				tt = '오늘까지 지출금액 약 '+Math.round(obj[today.getDate()-1].amt1/10000)+'만원\n';
				tt += '지난달 이맘때보다 약 '+Math.round((obj[today.getDate()-1].amt1 - obj[today.getDate()-1].amt2)/10000)+'만원 정도 더 썼어요.';
			}else if( obj[today.getDate()-1].amt1 < obj[today.getDate()-1].amt2) {
				tt = '오늘까지 지출금액 약 '+Math.round(obj[today.getDate()-1].amt1/10000)+'만원\n';
				tt += '지난달 이맘때보다 약 '+Math.round((obj[today.getDate()-1].amt2 - obj[today.getDate()-1].amt1)/10000)+'만원 정도 덜 썼어요.';
			}else{
				tt = '오늘까지 지출금액 약 '+Math.round(obj[today.getDate()-1].amt1/10000)+'만원\n';
				tt += '지난달 이맘때와 비슷하게 썼어요.';
			}
		}else{
			for (let i = 0; i < obj.length; i++) {
				if(i%2==0){
					arr.push([ obj[i].dt, obj[i].amt1, obj[i].amt2 ]);
				}else{
					arr.push([ '', obj[i].amt1, obj[i].amt2 ]);
				}
			}	
				tt = (month+1)+'월 총 지출 약 '+Math.round( obj[obj.length-1].amt1/10000 )+'만원\n';
				tt += month+'월 총 지출 약 '+Math.round( obj[obj.length-1].amt2/10000 )+'만원\n';
	
		}
		
		data.addRows(arr);
		
		var options = {
			title : tt,
			titleFontSize: 20,
			vAxis : {
				minValue : 100000
			},
			colors: ['#2E64FE', '#848484'],
			animation:{
		        duration: 1000,
		        easing: 'in',
		      }
		};

		var chart = new google.visualization.AreaChart(document.getElementById('areachart'));
		chart.draw(data, options);
	}
	
	// 컬럼차트1번 : 한달간 일별 지출 통계 -> 컬럼차트
	function drawColumnChart1() {
		var firstday = year + '-'+('0'+(month+1)).slice(-2) + '-01';
		var lastday = getLastDay();
		
		var jsonData = $.ajax({
			url : "columnChart1",
			data : {
				user_id : "${loginUser.id}",
				firstday : firstday,
				lastday : lastday
			},
			async : false
		}).responseText;
		var obj = jQuery.parseJSON(jsonData);
		var data = new google.visualization.DataTable();
		data.addColumn('string', '');
		data.addColumn('number', '지출');
		var arr = [];
		for (let i = 0; i < obj.length; i++) {
			arr.push([ obj[i].dt, obj[i].amt]);
		}
		data.addRows(arr);
					
		var options = {
			chart : {
				title : '나의 일별 지출 차트'
				
			}
		};

		var chart = new google.charts.Bar(document.getElementById('columnchart'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
	
	
	//컬럼차트 2번 : 월별 지출 통계 
	function drawColumnChart2() {

		var firstMonth = getFirstMonth();
		var lastMonth =	getLastDay();

		var jsonData = $.ajax({
			url : "columnChart2",
			data : {
				user_id : "${loginUser.id}",
				firstMonth : firstMonth,
				lastMonth : lastMonth
			},
			async : false
		}).responseText;
		var obj = jQuery.parseJSON(jsonData);
		var data = new google.visualization.DataTable();
		data.addColumn('string', '');
		data.addColumn('number', '지출');
		var arr = [];
		for (let i = 0; i < obj.length; i++) {
			arr.push([ obj[i].month, obj[i].amt]);
		}
		data.addRows(arr);
		
		var options = {
			chart : {
				title : '나의 월별 지출 차트',
				subtitle : '최근 6개월 간 월별 지출 총액을 확인해보세요.',
			}
		};

		var chart = new google.charts.Bar(document.getElementById('columnchart'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
</script>
<style>
.chart-group div {
	margin: 0 auto;
}

.tabnav {
	background-color: #f8f8f8;
	width: 80%;
	font-size: 0;
	padding: 0;
	margin: 0 auto;
	display: flex;
	justify-content: center;
}

.tabnav li {
	display: inline-block;
	height: 46px;
	width: 50%;
	text-align: center;
}

.tabnav li a:before {
	content: "";
	position: absolute;
	left: 0;
	top: 0px;
	width: 100%;
	height: 3px;
}

.tabnav li a.active:before {
	background: #66CDAA;
}

.tabnav li a {
	position: relative;
	display: block;
	background: #f8f8f8;
	color: #000;
	padding: 0 30px;
	line-height: 46px;
	text-decoration: none;
	font-size: 16px;
}

.tabnav li a:hover, .tabnav li a.active {
	background: #fff;
	color: #2E2EFE;
}

.tabcontent {
	padding: 20px;
}

#thisMonth {
	color: black;
	font-size: 45px;
	font-weight: bold;
}

#thisMonth:hover {
	cursor: pointer;
}

#div_boxs {
	display: flex;
}

#div_boxs div {
	line-height: 70px;
	margin: 0 20px;
}

#div_boxs button {
	border: none;
	background-color: white;
	font-size: 45px;
	padding: 0;
}

.card-body {
	margin: 0px;
}

.card-title {
	color: black;
	font-size: x-large;
}

.card-text {
	color: black;
	font-size: x-large;
	text-align: left;
}
</style>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h2>지출분석</h2>
						<div class="page_link">
							<a href="home">Home</a> <a href="expendAnal">지출분석</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="contact_area p_120">
		<div class="container">
			<!-- 버튼&차트 영역 -->
			<div id="myStatistics">
				<div id="div_boxs">
					<div>
						<button type="button" class="btn" id="prevMonth">
							<i class="bi bi-caret-left-fill"></i>
						</button>
					</div>
					<div id="thisMonth"></div>
					<div>
						<button type="button" class="btn" id="nextMonth" disabled>
							<i class="bi bi-caret-right-fill"></i>
						</button>
					</div>
				</div>

				<div class="chart-group">
					<!-- pie chart : 카테고리별 지출 통계 -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title pie-title">카테고리별 지출 통계</h5>
							<p class="card-text pie-message1"></p>
							<p class="card-text pie-message2"></p>
							<p class="card-text pie-message3"></p>
							<p class="card-text pie-message4"></p>
						</div>
						<div id="piechart" style="width: 900px; height: 500px;"></div>
					</div>


					<!-- area chart : 당월-전월 지출 누적 비교 통계 -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title area1-title"></h5>
							<p class="card-text area-message1"></p>
							<p class="card-text area-message2"></p>
							<p class="card-text area-message3"></p>
							<p class="card-text area-message4"></p>
						</div>
						<div id="areachart" style="width: 100%; height: 500px;"></div>
					</div>


					<!-- column chart : 월별/일별 지출 통계 -->
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">월별/일별 지출 통계</h5>
							<p class="card-text"></p>
							<p class="card-text">
								<small class="text-muted"></small>
							</p>
						</div>
						<div class="tab">
							<div class="tabcontent">
								<div id="tab">
									<div id="columnchart" style="width: 800px; height: 500px;"></div>
								</div>
							</div>
							<ul class="tabnav">
								<li><a href="#tab1">월별</a></li>
								<li><a href="#tab2">일별</a></li>
							</ul>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>


	<script>
	//전월-당월-익월 버튼 function
	$("#prevMonth").on("click", function() {
		month-- 
		var date = new Date(year, month, 1);
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		$("#thisMonth").html(year+'년 '+(month+1)+'월');
		drawChart();
		$("#nextMonth").removeAttr("disabled");
		$('.tabnav a').removeClass('active');
		$('.tabnav a').eq(0).addClass('active');
	})
	
	$("#thisMonth").on("click", function() {
		getToday();
		$("#thisMonth").html(year+'년 '+(month+1)+'월');
		$("#nextMonth").attr("disabled","disabled");
		drawChart();
		$('.tabnav a').removeClass('active');
		$('.tabnav a').eq(0).addClass('active');
	})
	
	$("#nextMonth").on("click", function() {
		month++ 
		var date = new Date(year, month, day);
		var today = new Date();
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		if(year == today.getFullYear() && month == today.getMonth()){
			$("#nextMonth").attr("disabled","disabled");
		}
		$("#thisMonth").html(year+'년 '+(month+1)+'월');
		drawChart();
		$('.tabnav a').removeClass('active');
		$('.tabnav a').eq(0).addClass('active');
	})
	
	$('.tabnav a').on('click', function() {
		$('.tabnav a').removeClass('active');
		$(this).addClass('active');
		let url = $(this).attr("href");
		tab = url.substr(1, url.length);
		//console.log(tab)
		if(tab=='tab1'){
			drawColumnChart2();
		}else{
			drawColumnChart1();				
		}
	}).filter(':eq(0)').click();
	
	//차트 크기 조정
	$(window).resize(function() {
        if(this.resizeTO) clearTimeout(this.resizeTO);
        this.resizeTO = setTimeout(function() {
            drawVisualization();
        }, 200);
    })
</script>
</body>
</html>