<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<form action="/member/join" method="post" autocomplete="off">
		<h2>회 원 가 입</h2>
		<b>ID</b>
		<br/>
		<input id="ick" type="text" name="id" required="required"/><br/>
		<span id="idck">
			<script>
				document.getElementById("ick").onkeyup = function() {
					var xhr = new XMLHttpRequest();
					console.log(document.getElementById("ick").value);
					var obj = {
							"id" : document.getElementById("ick").value
					}
					xhr.open("post","/member/signup_check/id" ,true);
					xhr.send(JSON.stringify(obj));
					xhr.onreadystatechange = function() {
						if(this.readyState==4){
							if(document.getElementById("ick").value.length==0){
								document.getElementById("idck").innerHTML="<b>아아디를 입력해주세요</b>";
							}else{
								document.getElementById("idck").innerHTML = this.responseText;
							}
						}
					}
				}
			</script>
		</span><br/><br/>
		
		<b>PASS</b><br/>
		<input id="p" type="password" name="pass" required="required"/><br/>
		<b>PASSCHECK</b><br/>
		<input id="pck" type="password" name="passcheck" required="required"/><br/>
		<span id="passck"></span><br/>
		<script>
			document.getElementById("pck").onblur = function() {	
				var p = document.getElementById("p");
				var pck = document.getElementById("pck");
				if(p.value.length != 0 && pck.value.length != 0){
					if(p.value==pck.value){
						document.getElementById("passck").innerHTML = "<b style=\"color:blue\">일치합니다</b>";
					}else{
						document.getElementById("passck").innerHTML = "<b style=\"color:red\">불일치합니다</b>";
					}
				}else{
					document.getElementById("passck").innerHTML = "<b>입력이 필요합니다.</b>";
				}
			}
			
			document.getElementById("p").onblur = function() {	
				var p = document.getElementById("p");
				var pck = document.getElementById("pck");
				if(p.value.length != 0 && pck.value.length != 0){
					if(p.value==pck.value){
						document.getElementById("passck").innerHTML = "<b style=\"color:blue\">일치합니다</b>";
					}else{
						document.getElementById("passck").innerHTML = "<b style=\"color:red\">불일치합니다</b>";
					}
				}else{
					document.getElementById("passck").innerHTML = "<b>입력이 필요합니다.</b>";
				}
			}
			
		</script>
		
		<b>EMAIL</b><br/>
		<input id="eck" type="email" name="email" required="required"/><br/>
		<span id="eckv"></span><br/><br/>
			<script>
				document.getElementById("eck").onkeyup = function() {
					var xhr = new XMLHttpRequest();
					console.log(document.getElementById("eck").value);
					var obj = {
							"email" : document.getElementById("eck").value
					}
					xhr.open("post","/member/signup_check/email" ,true);
					xhr.send(JSON.stringify(obj));
					xhr.onreadystatechange = function() {
						if(this.readyState==4){
							if(document.getElementById("eck").value.length==0){
								document.getElementById("eckv").innerHTML="<b>메일주소를 입력해주세요.</b>";
							}else{
								document.getElementById("eckv").innerHTML = this.responseText;
							}
						}
					}
				}
			</script>
			
		<button type="submit" style="width: 173px;">JOIN</button>
	</form>
		<a href="/member/login"><button type="button" style="width: 173px;">LOGIN</button></a>
</div>