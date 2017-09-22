<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
								if(this.responseText == "true"){
									flag1=true;
									console.log(flag1);
									valid();
									document.getElementById("idck").innerHTML= "<span style=\"color:blue\"><b>사용가능한 아이디입니다.</b></span>";
								}else{
									flag1=false;
									console.log(flag1);
									valid();
									document.getElementById("idck").innerHTML= "<span style=\"color:red\"><b>사용할수 없는 아이디입니다.</b></span>";
								}
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
						flag2=true;
						console.log(flag2);
						valid();
						document.getElementById("passck").innerHTML = "<b style=\"color:blue\">일치합니다</b>";
					}else{
						flag2=false;
						console.log(flag2);
						valid();
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
						flag2=true;
						console.log(flag2);
						valid();
					}else{
						document.getElementById("passck").innerHTML = "<b style=\"color:red\">불일치합니다</b>";
						flag2=false;
						console.log(flag2);
						valid();
					}
				}else{
					document.getElementById("passck").innerHTML = "<b>입력이 필요합니다.</b>";
				}
			}
			
		</script>
		
		<b>EMAIL</b><br/>
		<input id="eck" type="email" name="email" required="required" /><br/>
		<button type="button" id="emailckbt" style="width: 173px;" disabled="disabled">인증키 전송</button><br/>
		<script>
			if(document.getElementById("eck").value != null){
				document.getElementById("emailckbt").onclick= function (){
					var xhr = new XMLHttpRequest();
					var obj = {
							"email" : document.getElementById("eck").value
					}
						xhr.open("post","/member/emailck" ,true);
						xhr.send(JSON.stringify(obj));
						xhr.onreadystatechange = function() {
							if(this.readyState==4){
								window.alert("인증키 전송");
								document.getElementById("emailckbt").style.display="none";
								document.getElementById("eckv").style.display="none";
								document.getElementById("ckip").style.display="block";
								document.getElementById("ckbt").style.display="block";
								document.getElementById("eck").readOnly = true;
								console.log(this.responseText);
							}
						}
				}
			}
		
		</script>
		<span id="eckv"></span><br/>
		
			<script>
				document.getElementById("eck").onkeyup = function() {
					var xhr = new XMLHttpRequest();
					console.log(document.getElementById("eck").value);
					var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/; 
					if(!regExp.test(document.getElementById("eck").value)) {
						document.getElementById("emailckbt").disabled=true;
						document.getElementById("eckv").innerHTML="<b>메일주소를 입력해주세요.</b>";
						return;
					} 
					var obj = {
							"email" : document.getElementById("eck").value
					}
					xhr.open("post","/member/signup_check/email" ,true);
					xhr.send(JSON.stringify(obj));
					xhr.onreadystatechange = function() {
						if(this.readyState==4){
							if(document.getElementById("eck").value.length==0){
								document.getElementById("emailckbt").disabled=true;
								document.getElementById("eckv").innerHTML="<b>메일주소를 입력해주세요.</b>";
							}else{
								document.getElementById("eckv").innerHTML = this.responseText;
								if(this.responseText == "true"){
									document.getElementById("emailckbt").disabled=false;
									document.getElementById("eckv").innerHTML= "<span style=\"color:blue\"><b>사용가능한 이메일입니다.</b></span>";
								}else{
									document.getElementById("emailckbt").disabled=true;
									document.getElementById("eckv").innerHTML= "<span style=\"color:red\"><b>사용할수 없는 이메일입니다.</b></span>";
								}
								
							}
						}
					}
				}
			</script>
			
		<span id="confirmview"></span>
		<input type="text" style="width: 173px; display: none;" id="ckip" />
		<button type="button" style="width: 173px; display: none;" id="ckbt">인증하기</button><br/><br/>
		<script>
			document.getElementById("ckbt").onclick = function(){
				document.getElementById("eck").readOnly = true;
				var ckip = document.getElementById("ckbt").innerHTML;
				if(document.getElementById("ckip").value != null){
					document.getElementById("ckbt").onclick= function (){
						var xhr = new XMLHttpRequest();
						var obj = {
								"ck" : document.getElementById("ckip").value
						}
							xhr.open("post","/member/confirmEmail" ,true);
							xhr.send(JSON.stringify(obj));
							xhr.onreadystatechange = function() {
								if(this.readyState==4){
									console.log(this.responseText);
									if(this.responseText == "true"){
										document.getElementById("ckip").style.display= "none";
										document.getElementById("ckbt").style.display= "none";
										document.getElementById("confirmview").innerHTML= "<b style=\"color:blue\">인증완료</b>";
										flag3=true;
										console.log(flag3);
										valid();
									}else{
										document.getElementById("confirmview").innerHTML= "<b style=\"color:red\">인증실패</b>";
										document.getElementById("eck").readOnly = false;
										document.getElementById("emailckbt").style.display="block";
										document.getElementById("eckv").style.display="block";
										flag3=false;
										console.log(flag3);
										valid();
									}
								}
							}
					}
				}
			}
		</script>
		
			<button id="join" type="submit" style="width: 173px;" disabled="disabled">JOIN</button>
		
	</form>
</div>
<script>
	var flag1=false;
	var flag2=false;
	var flag3=false;
	var valid = function(){
		if(flag1 && flag2 && flag3){
			document.getElementById("join").disabled=false;
		}else{
			document.getElementById("join").disabled=true;
		}
	}
</script>