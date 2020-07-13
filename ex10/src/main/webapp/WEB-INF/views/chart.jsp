<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <title>구글 차트 라이브러리</title>
    <!-- 라이브러리 Load -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<select id="selChart" style="height:25px;">
		<option value="/chart/sum1">강좌별 평균점수</option>
		<option value="/chart/sum2">학생별 평균점수</option>
		<option value="/chart/sum3">강좌별 수강인원수</option>
		<option value="/chart/sum4">학생별 수강과목수</option>
	</select>
    <div id="chart_div" style="width:600px; height:500px;"></div>    
</body>
	
<script type="text/javascript">
  	var url="/chart/sum1";
  	var varTitle="강좌별 평균점수";
  	changeChart();
  	
  	$("#selChart").change(function(){
  		url=$("#selChart").val();
  		varTitle= $("#selChart option:checked").text();
  		changeChart();
  		
  	})	
    function changeChart(){
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawVisualization);
        function drawVisualization() { 
            $.ajax({
                type:"get",
                url:url,
                dataType:"json",
                success:function(result){

                    /* 데이터 셋팅 */
                    var data = google.visualization.arrayToDataTable(result);

                    /* 옵션 셋팅 */
                    var options = {
                    		  title : varTitle,
                              vAxis: {title: 'Cups'},
                              hAxis: {title: 'Month'},
                              seriesType: 'bars',
                              series: {1: {type: 'line'}}       
                              };
                   

                    /* 차트 그리기 */
                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            });
        }
    }
</script>
</html>