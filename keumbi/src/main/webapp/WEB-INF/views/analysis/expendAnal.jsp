<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- google charts -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	
	// 로그인 체크 
	if (!'${loginUser.id}') {
		alert('로그인이 필요합니다.');
		window.location = "userLoginForm";
	}	
	
	var year, month, day;
	getToday();

	function getToday() {
		var date = new Date();
		year = date.getFullYear();
		month = date.getMonth();
	 	day = date.getDate();
	 	console.log(year+"---"+month+"---"+day)
	}

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
		drawColumnChart1();
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

		var options = {
			title : yearMonth + ' 지출 통계'
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		chart.draw(data, options);
	}

	// 영역차트: 이번달과 지난달 지출액 비교
	function drawAreaChart() {	
		var thisMonth = year + '-'+('0'+(month+1)).slice(-2) 
		var prevMonth =  getPrevMonth();
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
		for (let i = 0; i < obj.length; i++) {
			arr.push([ obj[i].dt, obj[i].amt1, obj[i].amt2 ]);
		}
		data.addRows(arr);

		var options = {
			title : '당월-전월 지출액 누적 비교',
			hAxis : {
				title : 'day',
				titleTextStyle : {
					color : '#333'
				}
			},
			vAxis : {
				minValue : 0
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('areachart'));
		chart.draw(data, options);
	}
	
	// 컬럼차트1번 : 한달간 일별 지출 통계 -> 컬럼차트
	function drawColumnChart1() {
		var firstday = year + '-'+('0'+(month+1)).slice(-2) + '-01';
		var lastday = getLastDay();
		console.log(firstday + "^^^^^^^^^^^^^^^^^^" + lastday)
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
		data.addColumn('string', 'day');
		data.addColumn('number', '지출');
		var arr = [];
		for (let i = 0; i < obj.length; i++) {
			arr.push([ obj[i].dt, obj[i].amt]);
		}
		data.addRows(arr);
		
		var options = {
			chart : {
				title : '나의 일별 지출 차트',
				subtitle : '한달 간 일별 지출 총액을 확인해보세요.',
			}
		};

		var chart = new google.charts.Bar(document
				.getElementById('columnchart1'));

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
		data.addColumn('string', 'month');
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

		var chart = new google.charts.Bar(document
				.getElementById('columnchart2'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	}
	
	//컬럼차트 3번 : 연도별 지출 통계 
	/* function drawColumnChart3() {
		
		var now = new Date();	
		var firstYear = '2012-01-01';
		var lastYear = '2022-12-31';

		var jsonData = $.ajax({
			url : "columnChart3",
			data : {
				user_id : "${loginUser.id}",
				firstYear : firstYear,
				lastYear : lastYear
			},
			async : false
		}).responseText;
		var obj = jQuery.parseJSON(jsonData);
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'year');
		data.addColumn('number', '지출');
		var arr = [];
		for (let i = 0; i < obj.length; i++) {
			arr.push([ obj[i].year, obj[i].amt]);
		}
		data.addRows(arr);
		
		var options = {
			chart : {
				title : '연도별 지출 차트',
				subtitle : '최근 10년 간 연도별 지출 총액을 확인해보세요.',
			}
		};

		var chart = new google.charts.Bar(document
				.getElementById('columnchart3'));

		chart.draw(data, google.charts.Bar.convertOptions(options));
	} */
</script>
<body>
	<section class="banner_area">
		<div class="box_1620">
			<div class="banner_inner d-flex align-items-center">
				<div class="container">
					<div class="banner_content text-center">
						<h3>지출분석</h3>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 버튼&차트 영역 -->
	<div id="myStatistics">
		<!-- 전월-당월-익월 버튼 -->
		<div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn btn-secondary" id="prevMonth">지난달</button>
			<button type="button" class="btn btn-secondary" id="thisMonth">이번달</button>
			<button type="button" class="btn btn-secondary" id="nextMonth">다음달</button>
		</div>
	
		<div class="chart-group">
			<!-- pie chart : 카테코리별 지출 통계 -->
			<div id="piechart" style="width: 900px; height: 500px;"></div>
		
			<!-- area chart : 당월-전월 지출 누적 비교 통계 -->
			<div id="areachart" style="width: 100%; height: 500px;"></div>
		
			<!-- column chart1 : 일별 지출 통계 -->
			<div id="columnchart1" style="width: 800px; height: 500px;"></div>
			
			<!-- column chart2 : 월별 지출 통계 -->
			<div id="columnchart2" style="width: 800px; height: 500px;"></div>
			
			<!-- column chart3 : 연도별 지출 통계 -->
			<div id="columnchart3" style="width: 800px; height: 500px;"></div>
		</div>
	</div>
	

<script>

	
	//전월-당월-익월 버튼 function
	$("#prevMonth").on("click", function() {
		month-- 
		var date = new Date(year, month, 1);
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();		
		
		drawChart();			
	})
	
	$("#thisMonth").on("click", function() {
		getToday();
		drawChart();
	})
	
	$("#nextMonth").on("click", function() {
		month++ 
		var date = new Date(year, month, day);
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		drawChart();
	})
</script>
</body>
</html>