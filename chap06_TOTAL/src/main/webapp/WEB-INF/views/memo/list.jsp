<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
th {
		border-bottom: 1px solid;
		text-align: center;
	}
</style>
<div align="center">
	<h2>MEMO</h2> 
	<form action="/memo/remove" name="table" method="get">
	<table style="width: 60%;" >
		<thead>
			<tr>
				<th width="10%"><input type="checkbox" id="all" onchange="javascript:check()" /></th>
				<th width="10%">보낸사람</th>
				<th width="80%">내용</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="t" items="${memoBlist}" varStatus="tn">
				<tr>
					<td><input type="checkbox" class="change" onchange="javascript:check()" name="no" value="${t.NO}"/></td>
					
					<td><a href="/memo/send?target=${t.SENDER }" >${t.SENDER }</a></td>
					
					<td>${t.CONTENT }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	<a href="/memo/send"><button type="button">메모 보내기</button></a>

	<div>
		<c:choose>
			<c:when test="${(fn:length(memolist) % 5.0) == 0}">
				<a href="/memo/list?page=${page-1}"><c:if test="${page > 1 }">◀</c:if></a>
				<c:forEach var="ch" begin="1" end="${(fn:length(memolist) / 5)}" step="1">
					<c:choose>
						<c:when test="${ch == page}">
							<b>[${ch}]</b>
						</c:when>
						<c:otherwise>
							<a href="/memo/list?page=${ch}">[${ch}]</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="/memo/list?page=${page+1}"><c:if test="${page < (fn:length(memolist) / 5) }">▶</c:if></a>
			</c:when>
			
			<c:otherwise>
				<a href="/memo/list?page=${page-1}"><c:if test="${page > 1 }">◀</c:if></a>
				<c:forEach var="ch" begin="1" end="${(fn:length(memolist) / 5) +1}" step="1">
					<c:choose>
						<c:when test="${ch == page}">
							<b>[${ch}]</b>
						</c:when>
						<c:otherwise>
							<a href="/memo/list?page=${ch}">[${ch}]</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="/memo/list?page=${page+1}"><c:if test="${page < (fn:length(memolist) / 5 ) }">▶</c:if></a>
			</c:otherwise>
		</c:choose>
	</div>
</div>


<script>
document.getElementById("all").onchange = function() {
	for(i=0; i < table.no.length; i++) {
		table.no[i].checked = this.checked;
	}
}

function check(obj){
	var m = document.getElementsByClassName("change");
	var c=0;
	for(var i=0;i<m.length;i++){
		if(m[i].checked){
			c++;
		}
	}
	if(c == m.length){
		document.getElementById("all").checked = true;
	}else{
		document.getElementById("all").checked = false;
	}
	console.log(m.length);
	console.log(c);
}
</script>