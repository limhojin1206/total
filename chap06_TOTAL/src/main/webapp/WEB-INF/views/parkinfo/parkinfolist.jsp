<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center">
	<h2>주차장 정보</h2>
	<form action="/parkinfo/parkinfolist" method="get">주소 검색 : <input type="text" name ="parkinfosearch" value="${param.parkinfosearch }" /></form>
	총 ${fn:length(parkinfoalllist) } 개 <br/><br/>
	
	<div>
		<a href="/parkinfo/parkinfolist?parkinfosearch=${param.parkinfosearch }&page=${page-1}"><c:if test="${page > 1 }">◀</c:if></a>
		<c:forEach var="ch" begin="1" end="${((fn:length(parkinfoalllist) % 10.0)==0) ? (fn:length(parkinfoalllist) / 10) : (fn:length(parkinfoalllist) / 10) +1    }" step="1">
			<c:choose>
				<c:when test="${ch == page}">
					<b>[${ch}]</b>
				</c:when>
				<c:otherwise>
					<a href="/parkinfo/parkinfolist?parkinfosearch=${param.parkinfosearch }&page=${ch}">[${ch}]</a> 
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<a href="/parkinfo/parkinfolist?parkinfosearch=${param.parkinfosearch }&page=${page+1}"><c:if test="${page < (fn:length(parkinfoalllist) / 10) }">▶</c:if></a>
	</div>


	<table style="width: 80%;">
		<thead>
			<tr>
				<th width="20%">주차장명</th>
				<th width="20%">주소</th>
				<th width="12%">전화번호</th>
				<th width="10%">가능량</th>
				<th width="10%">유무료</th>
				<th width="14%">기본 요금</th>
				<th width="14%">추가 요금</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="t" items="${parkinfolist}">
				<tr>
					<td>${t.PARKING_NAME}</td>
					<td>${t.ADDR}</td>
					<td>${t.TEL}</td>
					<td><fmt:formatNumber value="${t.CAPACITY}"/>대</td>
					<td>${t.PAY_NM}</td>
					<td><fmt:formatNumber value="${t.RATES * t.TIME_RATE}"/>원(기본 <fmt:formatNumber value="${t.TIME_RATE}"/>분)</td>
					<td> <fmt:formatNumber value="${t.ADD_TIME_RATE}"/>분당 <fmt:formatNumber value="${t.ADD_TIME_RATE * t.ADD_RATES}"/>원</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</div>