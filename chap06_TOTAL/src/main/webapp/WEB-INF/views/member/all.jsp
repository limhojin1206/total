<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div align="center">
	<h2>전체 회원 정보</h2><br/>
	총 : ${fn:length(memberAllList)} 명
	<div>
		<c:choose>
			<c:when test="${(fn:length(memberAllList) % 5 == 0)}">
				<a href="/member/mlist?page=${page-1}"><c:if test="${page > 1}">◀</c:if></a>
				<c:forEach var="ch" begin="1" end="${(fn:length(memberAllList) / 5)}" step="1">
					<c:choose>
						<c:when test="${ch == page}">
							<b>[${ch}]</b>
						</c:when>
						<c:otherwise>
							<a href="/member/mlist?page=${ch}">[${ch}]</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="/member/mlist?page=${page+1}"><c:if test="${page < (fn:length(memberAllList) / 5) }">▶</c:if></a>
			</c:when>
			
			<c:otherwise>
				<a href="/member/mlist?page=${page-1}"><c:if test="${page > 1}">◀</c:if></a>
				<c:forEach var="ch" begin="1" end="${(fn:length(memberAllList) / 5)+1}" step="1">
					<c:choose>
						<c:when test="${ch == page}">
							<b>[${ch}]</b>
						</c:when>
						<c:otherwise>
							<a href="/member/mlist?page=${ch}">[${ch}]</a> 
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<a href="/member/mlist?page=${page+1}"><c:if test="${page < (fn:length(memberAllList) / 5) }">▶</c:if></a>
			</c:otherwise>
		</c:choose>
	</div>
	<table>
		<tbody>
			<c:forEach var="ml" items="${memberlist}">
				<tr>
					<td align="left" style="width: 20%;">
						<c:choose>
							<c:when test="${! empty ml.URI }">
								<img src="${ml.URI}" style="width:50; height: 50;object-fit: cover;object-position: top;border-radius: 50%;" />
							</c:when>
							<c:otherwise>
								<img src="/profiles/default.png" alt="기본이미지" style="width:50; height: 50;object-fit: cover;object-position: top;border-radius: 50%;" />
							</c:otherwise>
						</c:choose>
					</td>
					<td align="right" style="width: 40%;">
						${ml.ID }
					</td>
					<td align="right" style="width: 40%;">
						${ml.EMAIL }
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>