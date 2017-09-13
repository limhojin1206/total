<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="right">
	<c:if test="${!empty auth}"><b>${auth.ID }</b>님 환영합니다!!  |</c:if> 
	<c:choose>
		<c:when test="${empty auth}"><a href="/member/login">LOGIN</a> | <a href="/member/join">JOIN</a></c:when>
		<c:otherwise><a href="/member/logout">LOGOUT</a> </c:otherwise>
	</c:choose>
	
	
	 | <a href="/market/list">MARKET</a> | <a href="/board/list">BOARD</a>
	
</div>