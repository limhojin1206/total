<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="color: gray">LHJ Copyright &copy; LHJ</div>

<script>
	var ws = new WebSocket("ws://192.168.10.72/ws/alert");
	ws.onmessage =  function(e){
		console.log(e.data + " / " + typeof e.data);
		window.alert(e.data);
	}

</script>