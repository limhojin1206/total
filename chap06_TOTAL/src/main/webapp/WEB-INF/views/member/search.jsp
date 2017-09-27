<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h3>친구 찾기</h3>
	<p>
		<input type="text" id="srch" style="padding:2px;width:40%; font-size:16pt;"/> 
	</p>
</div>
<div align="center" id="list" />
<script>
	<%-- select * from member where id like #{id} --%>
	$("#srch").keyup(function(){
		$("#list").html("<h4>검색결과</h4>")
		var a = $("#srch").val();
		console.log(a);
		if(a.length==0){
			return;
		}
		
		$.ajax({
			"url" : "searchAjax",
			"data" : {
				"id" : $("#srch").val()
			}
		}).done(function(obj){
			for (var i = 0; i < obj.length; i++) {
				var t =  "<b>"+obj[i].ID +"</b> ("+ obj[i].EMAIL + ")<br/>";
				$("#list").append(t);	
			}
		});
	});

</script>