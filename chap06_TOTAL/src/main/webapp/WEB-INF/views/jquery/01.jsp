<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h2><span id="jq">JQuery</span> <small id="ch" ></small></h2>
	jquery의 기본 형태는 <b>$(selector).action();</b> 이런식으로 되어있음.<br/>
	javascript랑은 다르게, 선택된 요소(들)이 어떤 특정한 액션이 발생함. 
<p>
	<c:forTokens items="월,화,수,목,금" delims="," var="str">
		<button class="wk">${str}</button>
	</c:forTokens>
	<button id="r">리셋</button>
</p>
<script>
	// id 설정된건 # class는 . tag는 태그이름
	$("button").click(function(){
		console.log("button에 click 액션 설정함");
	});
	$(".wk").click(function(){
		//window.alert(this.innerHTML);
		$("#ch").innerHTML=this.innerHTML;
	});
	$("#r").click(function(){
		$("#ch").innerHTML="";
	});
	
	$("#jq").click(function(){
		$("button").fadeToggle();
	});
	
	console.log(document.getElementById("jq"));	// javascript로 얻은 상태
	console.log("========================");
	console.log($("#jq"));						// jquery로 얻은 상태
	console.log("========================");
	console.log($(document.getElementById("jq")));
	
	/*
	var ar = document.getElementsByClassName("wk");
	for(var i=0; i<ar.length;i++){
		ar[i].onclick = function(){
			document.getElementById("ch").innerHTML = this.innerHTML;
		}
	}
	document.getElementById("r").onclick = function(){
		document.getElementById("ch").innerHTML = "";
	}
	*/
	

</script>

</div>