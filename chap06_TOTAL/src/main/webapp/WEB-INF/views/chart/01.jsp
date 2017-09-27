<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h3>데이터 시각화 01(google chart)</h3>
	<c:forEach var="t" items="${list }" varStatus="vs">
		${t.GENDER } : ${t.CNT } <c:if test="${!vs.last }">|</c:if>
	</c:forEach>
	
	<div id="chartV" style="width:400px; height:400px">
	</div>
	<small>Google PIE CHART</small>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load("current", {"packages":["corechart"]});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('string', 'gender');
		data.addColumn('number', 'count');
		 data.addRows([
	    	  <c:forEach var="t" items="${list }" varStatus="vs">
	  			["${t.GENDER }",  ${t.CNT }] <c:if test="${!vs.last }">,</c:if>
	  		 </c:forEach>
	      ]);
	 
	 var options = {
			    "title" : "남/녀 성비",
			    "sliceVisibilityThreshold": .2,
				"is3D" : true
			  };
	/*
		  var data = google.visualization.arrayToDataTable([
		    ['Task', 'Hours per Day'],
		    ['Work',     11],
		    ['Eat',      2],
		    ['Commute',  2],
		    ['Watch TV', 2],
		    ['Sleep',    7]
		  ]);
		  var options = {
		    "title" : "My Daily Activities"
		  };
	*/
	  var chart = new google.visualization.PieChart(document.getElementById('chartV'));
	
	



  chart.draw(data, options);
}
</script>