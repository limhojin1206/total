<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<div>
		<h2>프로필</h2>
	</div>
	<div>
	<c:choose>
		<c:when test="${! empty auth.URI }">
			<img id="pre" src="${auth.URI}" style="width:200; height: 200" />
		</c:when>
		<c:otherwise>
			<img id="pre" src="/profiles/default.png" alt="기본이미지" style="width:200; height: 200" />
		</c:otherwise>
	</c:choose>
	<br/>
	<a href="/my/profile"><button type="button">프로필 변경</button></a>
	</div>
	<div>
			<table>
				<tbody>
					<tr>
						<td align="right"><b>ID</b></td>
						<td>${auth.ID }</td>
					</tr>
					<tr>
						<td align="right"><b>EMAIL</b></td>
						<td>${auth.EMAIL }</td>
					</tr>
					<tr>
						<td align="right"><b>NAME</b></td>
						<td><c:if test="${empty auth.NAME}"> 정보없음</c:if>${auth.NAME }</td>
					</tr>
					<tr>
						<td align="right"><b>GENDER</b></td>
						<td><c:if test="${empty auth.GENDER}"> 정보없음</c:if>${auth.GENDER }</td>
					</tr>
					<tr>
						<td align="right"><b>BIRTH</b></td>
						<td><c:if test="${empty auth.BIRTH}"> 정보없음</c:if>${auth.BIRTH }</td>
					</tr>
					<tr>
						<td align="right"><b>ADDRESS</b></td>
						<td><c:if test="${empty auth.ADDRESS}"> 정보없음</c:if>${auth.ADDRESS }</td>
					</tr>
				
				</tbody>
			
			</table>
		
		<a href="/my/adjust"><button type="submit" style="width: 150px;">정보수정</button></a>
		<a href="/"><button type="button" style="width: 150px;">메인으로</button></a>
		<a href="/member/drop"><button type="submit" style="width: 150px;">탈퇴하기</button></a>
		
	</div>
</div>