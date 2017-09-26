<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h3 id="t">JQuery Animation effect</h3>
</div>

<div>
	<button id="bt1">버튼</button>
	<button id="bt2">FADE IN/OUT</button>
	<button id="bt3">SLID UP/DOWN</button>
	<button id="bt4">ANIMATE</button>
</div>
<div style="height:150px; background: silver;" id="tg" >
	<h4>아무거나,,</h4>
</div>

<div style="height:150px; background: fuchsia; display:none" >
	<h4>아무거나,,</h4>
</div>
<script>
	$("#bt4").click(function(){
		$("#tg").animate({"height":300}).animate({"font-size":"30pt"}).slideUp();
	});

	$("#bt3").click(function(){
		$("#tg").slideUp();
		$("#tg").next().slideDown();
	});

	
	$("#bt2").click(function(){
		$("#tg").fadeOut();
		$("#tg").next().fadeIn();
		$("#t").fadeToggle();
	});

	$("#bt1").click(function(){
		// hide, show, toggle
		$("#tg").hide();
		$("#tg").next().show(1000);
		$("#t").toggle();
	});
</script>