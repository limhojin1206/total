<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>JQuery Simple AJAX</h3>
<div>
	<button id="a" value="aa">AJAX</button>
	<button id="b">AJAX</button>
</div>
<script>
	$("#a").click(function(){
		// $.ajax().done();
		$.ajax({
			"type":"post",		// default :"get"
			"async" : false,	// default : true
			"url":"/jquery/dst03",
			"data" : {
				"id" : "LHJ",
				"pw" : "asd" 
			}
		}).done(function(r){
			console.log(r+" / "+ typeof r);
			//var obj = JSON.parse(r);
			//window.alert(obj.name +" / " + obj.gender);
			window.alert(r.name +" / " + r.gender);
		});
	});
	
	$("#b").click(function(){
		$.ajax({
			"url":"/jquery/dst03"
		}).done(function(r){
			console.log(r+" / "+ typeof r);
			window.alert(r.name +" / " + r.gender);
		});
	});
</script>