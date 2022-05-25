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
	
	// 파이차트 - 월별 지출항목 통계 
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawPieChart);

	
	function drawPieChart() {
		var date = new Date();
		var yearMonth = date.getFullYear()+'-'+("0" + (1 + date.getMonth())).slice(-2);
		var jsonData = $.ajax({
							url : "monthlyAnalysis",
							data : {
								user_id : "${loginUser.id}",
								yearMonth : yearMonth
							},
							dataType : "json",
							async : false
						}).responseText;		
		var obj = jQuery.parseJSON(jsonData);
        var data = google.visualization.arrayToDataTable(obj);
        data.addColumn('string', '카테고리');        
        data.addColumn('amt', '지출액');        
        
		/* var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], 
				[ 'Work', 11 ], 
				[ 'Eat', 2 ],
				[ 'Commute', 2 ], 
				[ 'Watch TV', 2 ], 
				[ 'Sleep', 7 ] 
		]); */

		var options = {
			title : yearMonth+' 지출 통계'
		};

		var chart = new google.visualization.PieChart(document.getElementById('piechart'));

		chart.draw(data, options);
	}

	//라인차트
	google.charts.load('current', {
		packages : [ 'corechart', 'line' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {

		var data = new google.visualization.DataTable();
		data.addColumn('number', 'X');
		data.addColumn('number', 'Dogs');

		data.addRows([ [ 0, 0 ], [ 1, 10 ], [ 2, 23 ], [ 3, 17 ], [ 4, 18 ],
				[ 5, 9 ], [ 6, 11 ], [ 7, 27 ], [ 8, 33 ], [ 9, 40 ],
				[ 10, 32 ], [ 11, 35 ], [ 12, 30 ], [ 13, 40 ], [ 14, 42 ],
				[ 15, 47 ], [ 16, 44 ], [ 17, 48 ], [ 18, 52 ], [ 19, 54 ],
				[ 20, 42 ], [ 21, 55 ], [ 22, 56 ], [ 23, 57 ], [ 24, 60 ],
				[ 25, 50 ], [ 26, 52 ], [ 27, 51 ], [ 28, 49 ], [ 29, 53 ],
				[ 30, 55 ], [ 31, 60 ], [ 32, 61 ], [ 33, 59 ], [ 34, 62 ],
				[ 35, 65 ], [ 36, 62 ], [ 37, 58 ], [ 38, 55 ], [ 39, 61 ],
				[ 40, 64 ], [ 41, 65 ], [ 42, 63 ], [ 43, 66 ], [ 44, 67 ],
				[ 45, 69 ], [ 46, 69 ], [ 47, 70 ], [ 48, 72 ], [ 49, 68 ],
				[ 50, 66 ], [ 51, 65 ], [ 52, 67 ], [ 53, 70 ], [ 54, 71 ],
				[ 55, 72 ], [ 56, 73 ], [ 57, 75 ], [ 58, 70 ], [ 59, 68 ],
				[ 60, 64 ], [ 61, 60 ], [ 62, 65 ], [ 63, 67 ], [ 64, 68 ],
				[ 65, 69 ], [ 66, 70 ], [ 67, 72 ], [ 68, 75 ], [ 69, 80 ] ]);

		var options = {
			hAxis : {
				title : 'Time'
			},
			vAxis : {
				title : 'Popularity'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));

		chart.draw(data, options);
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

	<!-- pie chart -->
	<div id="piechart" style="width: 900px; height: 500px;"></div>

	<!-- line chart -->
	<div id="chart_div"></div>
</body>
</html>