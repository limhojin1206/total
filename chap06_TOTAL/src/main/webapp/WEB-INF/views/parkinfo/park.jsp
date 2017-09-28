<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div align="center">
	<h2>주차장 정보 / ${data.list_total_count }</h2>
	<table style="width: 80%">
		<thead>
			<tr>
				<th style="width: 40%">#주차장위치</th>
				<th style="width: 20%">#수용공간</th>
				<th style="width: 20%">#주차장종류명</th>
				<th style="width: 20%">#일최고요금</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="obj" items="${data.row }">
				<tr>
					<td>${obj.ADDR }</td>
					<td><fmt:formatNumber value="${obj.CAPACITY }" pattern="#,###" /></td>
					<td>${obj.PARKING_TYPE_NM }</td>
					<td>${obj.DAY_MAXIMUM }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


