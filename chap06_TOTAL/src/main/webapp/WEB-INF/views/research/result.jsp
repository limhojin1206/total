<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h3>평점 결과</h3>
	<div id="chartV" style="width:400px; height:400px">
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
    	var str;
    	  $.ajax({
  			"url" : "/research/showresult",
  			"async" : false
  		}).done(function(obj){
  			console.log(obj);
  			str = obj;
  		});
    	var data = new google.visualization.arrayToDataTable(str);
        var options = {
          width: 400,
          legend: { position: 'none' },
          chart: {
            title: '',
            subtitle: '' },
          axes: {
            x: {
            	0: { side: 'down', label: ''} // Top x-axis.
            	
            }
          },
          bar: { groupWidth: "90%" }
        };
        var chart = new google.charts.Bar(document.getElementById('chartV'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
    </script>