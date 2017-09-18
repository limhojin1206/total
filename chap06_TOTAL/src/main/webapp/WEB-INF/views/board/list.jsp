<%@page import="java.util.*"%>
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
	<h2>게시판</h2> 
	<table style="width: 60%;">
		<thead>
			<tr>
				<th width="20%">글번호</th>
				<th width="45%">글제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="10%">작성일</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach var="t" items="${boardlist}">
				<tr>
					<td>${t.NUM}</td>
					<td><a href="/board/view/${t.NUM}">
								<c:choose>
									<c:when test="${fn:length(t.TITLE) gt 10 }">
										${fn:substring(t.TITLE, 0, 10)}...<c:if test="${ !empty t.CNT}">[${t.CNT}]</c:if>
									</c:when>
									<c:otherwise>
										${t.TITLE} <c:if test="${ !empty t.CNT}">[${t.CNT}]</c:if>
									</c:otherwise>
								</c:choose>
								</a></td>
					<td>
						${t.WRITER }
					</td>
					<td><fmt:formatNumber value="${t.COUNT}"/></td>
					<td><fmt:formatDate value="${t.WRITEDATE}" pattern="yy.MM.dd"/></td>
				</tr>
			</c:forEach>
			
		</tbody>
		<tfoot align="center">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</tfoot>
	</table>
	<a href="/board/add"><button type="button">글작성</button></a>
	<div>
		<c:if test="${page > 1 }">◀</c:if>
		<c:choose>
			<c:when test="${(fn:length(boardAllList) % 5.0) == 0}">
				<c:forEach var="ch" begin="1" end="${(fn:length(boardAllList) / 5)}" step="1">
					<c:choose>
						<c:when test="${ch == page}">
							<b>[${ch}]</b>
						</c:when>
						<c:otherwise>
							<a href="/board/blist?page=${ch}">[${ch}]</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="ch" begin="1" end="${(fn:length(boardAllList) / 5) +1}" step="1">
					<c:choose>
						<c:when test="${ch == page}">
							<b>[${ch}]</b>
						</c:when>
						<c:otherwise>
							<a href="/board/blist?page=${ch}">[${ch}]</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		<c:if test="${page < (fn:length(boardAllList) / 5) }">▶</c:if>
	</div>
</div>
