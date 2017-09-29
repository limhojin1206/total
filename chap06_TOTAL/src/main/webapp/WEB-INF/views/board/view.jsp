<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div align="center" >
	<div>
		<h2><span id="parent" >${t.NUM}</span>번 글 | ${t.TITLE}</h2>
		<p>작성자 : ${t.WRITER} | 조회수 : <fmt:formatNumber value="${t.COUNT}"/> | 작성일 : <fmt:formatDate value="${t.WRITEDATE}" pattern="yy.MM.dd HH:mm"/>
		</p>
		<textarea rows="10" style="width: 60%;" readonly>${t.CONTENT}</textarea>
	</div>
	
	<br/><br/>
	<div>
		<div style="width: 60%;">
			<hr/>
			<p align="left"><small>댓글</small></p>
		</div>
			<input type="text" id="writer" style="padding:3px; width: 120px;" placeholder="아이디" required/>
			<input type="text" id="content" style="padding:3px; width: 340px;" placeholder="댓글내용" required/>
			<input type="password" id="pass" style="padding:3px; width: 100px;" placeholder="비밀번호" required/>
			<button id="sbt" type="button">남기기</button>
		<div style="width: 60%;">
			<hr/>
			<p align="left"><small>최근 댓글</small></p>
			<p id="mentlist"/>
			<hr/>
		</div>
	</div>
	<div>
		<a href="/board/blist"><button type="button">전체글</button></a>
	</div>
</div>

<script>
	document.getElementById("sbt").onclick = function(){
		var xhr = new XMLHttpRequest();
		var obj = {
				"parent" : document.getElementById("parent").innerHTML,
				"writer" : document.getElementById("writer").value,
				"content" : document.getElementById("content").value,
				"pass" : document.getElementById("pass").value
		}
		xhr.open("post","/board/reply" ,true);
		xhr.send(JSON.stringify(obj));
		xhr.onreadystatechange = function() {
			if(this.readyState==4) {
				var obj= JSON.parse(this.responseText);
				console.log("obj : "+obj);
				if(obj == -1){
					window.alert("도배금지");
				}
				document.getElementById("writer").innerHTML = "";
				document.getElementById("content").innerHTML = "";
				document.getElementById("pass").innerHTML = "";
				mentlist();
			}
		}
		mentlist();
	}
	
	var mentlist = function(){
		t=11;
		var xhr = new XMLHttpRequest();
		var obj = {
				"parent" : parseInt(document.getElementById("parent").innerHTML)
		}
		xhr.open("post","/board/replylist" ,true);
		xhr.send(JSON.stringify(obj));
		xhr.onreadystatechange = function() {
			if(this.readyState==4) {
				var obj= JSON.parse(this.responseText);
				var html = "";
				html += "<table>";
				html += "<tbody>";
				for(idx in obj){
					html += "<tr>";
					html += "<td style=\"width: 120px;\"><b>"+ obj[idx].WRITER +"</b></td>";
					html += "<td style=\"width: 500px;\">"+ obj[idx].CONTENT +"</td>";
					html += "<td><small><input type=\"text\" id=\"dpass\" style=\"padding:2px; width: 100px;\" placeholder=\"비밀번호\" required/></small></td>"
					html += "<td style=\"width: 80px;\"><button id=\"dbt\" ><span id=\"dcode\" value="+obj[idx].NUM+"/>삭제</button></td>"
					html += "</tr>";
				}
				html += "</tbody>";
				html += "</table>";
				document.getElementById("mentlist").innerHTML = html;
			}
		}
	}
	mentlist();
	
	
	
</script>
