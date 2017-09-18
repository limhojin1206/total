<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="right">
	<c:if test="${!empty auth}">
	<a href="/my/profile">
	<c:choose>
				<c:when test="${! empty auth.URI }">
					<img id="navpre" src="${auth.URI}" style="width:50; height: 50;object-fit: cover;object-position: top;border-radius: 50%;" />
				</c:when>
				<c:otherwise>
					<img id="navpre" src="/profiles/default.png" alt="기본이미지" style="width:50; height: 50;object-fit: cover;object-position: top;border-radius: 50%;" />
				</c:otherwise>
	</c:choose>
	</a>

	
	
	<a href="/my/info"><b>${auth.ID }</b></a>님 환영합니다!!
	
	  |</c:if> 
	<c:choose>
		<c:when test="${empty auth}"><a href="/member/login">LOGIN</a> | <a href="/member/join">JOIN</a></c:when>
		<c:otherwise><a href="/member/logout">LOGOUT </a> | <a href="/my/info">INFO</a></c:otherwise>
	</c:choose>
	
	
	 | <a href="/market/list">MARKET</a> | <a href="/board/blist">BOARD</a> | <a href="/member/mlist">전체 회원 정보</a>
	
</div>