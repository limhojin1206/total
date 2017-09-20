<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.my-box { border:1px solid; padding:10px; background-color:yellow;}
</style>
<div>
	<h3>CHATTING</h3>
	<div id="log" style="height:80%;
				width: 93%;
				padding:5px;
				text-align: left;
				background-color: #AAFFAA;
				overflow-y : scroll;
				word-break : break-all;
				font-size: 10pt;
				">
	</div>
	<input type="text" id="msg" style="width:97%; padding:3px;"/>
</div>
<script>
	document.getElementById("msg").onkeyup = function(e){
		if(e.code == "Enter"){
			if(this.value.length != 0){
				ws.send(this.value);
				this.value="";
			}
		}
	}

	var ws = new WebSocket("ws://192.168.10.72/ws/chat");
	ws.onopen = function(e){
		document.getElementById("log").innerHTML += "<p><b>[채팅 서버 접속 성공]</b></p>";
		
	}
	
	ws.onerror=function(e){
		if(window.confirm("채팅서버 접속 실패\n다시접속하시겠습니까?")){
			ws=new WebSocket("ws://192.168.10.72/ws/chat");
		}
	}
	
	ws.onmessage = function(e){
		
		var a = JSON.parse(e.data);
		switch(a.mode){
		case "join" :
			document.getElementById("log").innerHTML += "<div align=\"center\" style=\"color:gray\"><small>"+ a.sender + "님께서 입장하셨습니다.(" + a.cnt + "명 접속중)</small></div><br/>";
			break;
		case "out" :
			document.getElementById("log").innerHTML += "<div align=\"center\" style=\"color:gray\"><small>"+ a.sender + "님께서 나가셨습니다.(" + a.cnt + "명 접속중)</small></div><br/>";
			break;
		case "send" : 
			var msg = "<b>["+a.sender+"]</b> " + a.msg;
			document.getElementById("log").innerHTML += "<mark>"+msg+"</mark><br/>";
			break;
		case "my" :
			document.getElementById("log").innerHTML += "<div align=\"center\" style=\"color:gray\"><small>채팅방에 입장하였습니다.(" + a.cnt + "명 접속중)</small></div><br/>";
			break;
		case "mysend" :
			document.getElementById("log").innerHTML += "<div class=\"my-box\" align=\"right\"><b>"+a.msg+"</b></div><br/>";
			break;
			
			
		}
		
		if(document.getElementById("msg").value.length == 0){
			var loglist = document.getElementById("log");
			loglist.scrollTop = loglist.scrollHeight+25;
		}
		
	}
</script>