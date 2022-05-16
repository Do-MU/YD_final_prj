<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8' />
<script src="${pageContext.request.contextPath}/resources/ledger/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/ledger/main.css">

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      //initialDate: '2022-05-13',
      editable: true,
      selectable: true,
      businessHours: false,
      dayMaxEvents: true, // allow "more" link when too many events
      progressiveEventRendering: true,
      events : "totalTrans",
      eventColor : "#ffffff00"
    });    

    calendar.render();
    
  });
	  
</script>
<style>

.out {
	color : red !important;
}

.in {
  	color : blue !important;
}

body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 1100px;
	margin: 0 auto;
}
</style>
</head>
<body>

	<div id='calendar'></div>

</body>
</html>
