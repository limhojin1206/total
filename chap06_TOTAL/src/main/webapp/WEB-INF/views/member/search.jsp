<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h3>친구 찾기</h3>
	<p>
		<input type="text" id="srch" style="padding:2px;width:40%; font-size:16pt;"/> 
	</p>
</div>
<div>
	<table>
		<thead>
			<tr>
				<th>ID</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="t" items="${friendlist}">
			<tr>
				<td>${t.ID }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

</div>
<script>
	
	<%-- select * from member where id like #{id} --%>
	$("#srch").keyup(function(){
		var a = $("#srch").val();
		console.log(a);
		$.ajax({
			"uri" : "member/friendlist",
			"data" : {
				"id" : $("#srch").val()
			}
		}).done(function(obj){
		});
	});

</script>