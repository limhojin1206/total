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
<div align="right">
	
</div>
<div align="center">
	<h2>경매 목록</h2> 
	<table style="width: 80%;">
		<thead>
			<tr>
				<th width="10%">번호</th>
				<th width="30%">물품</th>
				<th width="12%">시작가</th>
				<th width="12%">현재가</th>
				<th width="12%">즉구가</th>
				<th width="12%">마감일</th>
				<th width="12%">입찰</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="t" items="${list}">
				<tr>
					<td><a href="/market/tender/${t.NUM }">${t.NUM}</a></td>
					<td><a href="/market/tender/${t.NUM }">${t.NAME}</a></td>
					<td><fmt:formatNumber value="${t.STARTPRICE}"/></td>
					<td><a href="/market/tender/${t.NUM }"><fmt:formatNumber value="${t.NOWPRICE}"/></a></td>
					<td><fmt:formatNumber value="${t.IMMEDIATEPRICE}"/></td>
					<td><fmt:formatDate value="${t.DEADLINE}" pattern="yy.MM.dd."/></td>
					<td><a href="/market/tender/${t.NUM }"><button type="button">입찰하기</button></a></td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	<div style="width:80%">
		<hr/>
		<form action="/market/search">
			시작가  : <input type="text" name="lessprice" required value="${param.lessprice }"/> 이하 
			<button type="submit"> 검색</button> <br/>
			<input type="checkbox" name="ck" ${param.ck ne null ? 'checked':''} /><small>(즉구만 검색)</small>
		</form>
		<c:if test="${!empty search}">
			<table style="width: 80%;">
				<thead>
					<tr>
						<th width="10%">번호</th>
						<th width="30%">물품</th>
						<th width="10%">시작가</th>
						<th width="10%">현재가</th>
						<th width="10%">즉구가</th>
						<th width="10%">마감일</th>
						<th width="18%">입찰</th>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach var="s" items="${search}">
						<tr>
							<td>${s.NUM}</td>
							<td>${s.NAME}</td>
							<td><fmt:formatNumber value="${s.STARTPRICE}"/></td>
							<td><fmt:formatNumber value="${s.NOWPRICE}"/></td>
							<td><fmt:formatNumber value="${s.IMMEDIATEPRICE}"/></td>
							<td><fmt:formatDate value="${s.DEADLINE}" pattern="yy.MM.dd."/></td>
							<td>
							<a href="/market/tender/${s.NUM }"><button type="button">입찰하기</button></a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</div>

