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

	// 파이차트: 카테고리별 지출항목 통계 출력
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawPieChart);

	function drawPieChart() {
		var date = new Date();
		var yearMonth = date.getFullYear() + '-'
				+ ("0" + (1 + date.getMonth())).slice(-2);
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
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawAreaChart);

	function drawAreaChart() {
		
		var date = new Date();
		// 이번달 값 구해서 변수에 담기
		var thisMonth = date.getFullYear() + '-' + ("0" + (1 + date.getMonth())).slice(-2);
		// 지난달 값 구해서 변수에 담기
		var firstDayOfMonth = new Date(date.getFullYear(), date.getMonth(), 1 );
		var lastDayOfMonth = new Date ( firstDayOfMonth.setDate( firstDayOfMonth.getDate() - 1 ) );
		var lastMonth = lastDayOfMonth.getFullYear()+'-'+("0"+(1+lastDayOfMonth.getMonth())).slice(-2);
		
		var jsonData = $.ajax({
			url : "thisPreAnalysis",
			data : {
				user_id : "${loginUser.id}",
				thisMonth : thisMonth,
				lastMonth : lastMonth
			},
			async : false
		}).responseText;
		var obj = jQuery.parseJSON(jsonData);
		console.log(obj)
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'day');
		data.addColumn('number', thisMonth);
		data.addColumn('number', lastMonth);
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
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawColumnChart1);

	function drawColumnChart1() {
		
		var now = new Date();	
		var firstday = now.getFullYear()+'-'+("0"+(now.getMonth()+1)).slice(-2)+"-01";
		console.log(firstday)
		var getLastDay = new Date(now.getFullYear(), now.getMonth()+1, 0);
		var lastday = now.getFullYear()+'-'+("0"+(now.getMonth()+1))+'-'+getLastDay.getDate();
		console.log(lastday)
		

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
		console.log(obj)
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
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawColumnChart2);

	function drawColumnChart2() {
		
		var now = new Date();	
		//
		var getLastDay = new Date(now.getFullYear(), now.getMonth()+1, 0);
		var lastMonth =	now.getFullYear()+'-'+("0"+(now.getMonth()+1)).slice(-2)+'-'+(getLastDay.getDate());
		console.log("이번달 마지막날========> " + lastMonth);
		
		var sixMonthAgo = new Date(now.setMonth(now.getMonth()-5));	// 여섯달 전
		console.log("여섯달전______:"+sixMonthAgo)
		var firstMonth = sixMonthAgo.getFullYear()+'-'+(sixMonthAgo.getMonth()+1)+'-01';
		console.log("여섯달 전 첫쨋날========> "+firstMonth);

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
		console.log(obj)
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
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawColumnChart3);

	function drawColumnChart3() {
		
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
		console.log(obj)
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
	}
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
</body>
</html>