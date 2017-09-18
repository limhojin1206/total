<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<h2>정보 수정</h2>
	<form action="/my/adjust" method="post">
		<b>ID</b><br/>
		<input type="text" name="id" value="${auth.ID}" readonly required/><br/>
		<b>PASS</b><br/>
		<input type="password" name="pass" value= "${auth.PASS}" required/><br/>
		<b>EMAIL</b><br/>
		<input type="email" name="email" value= "${auth.EMAIL}" readonly required/><br/> 
		<b>NAME</b><br/>
		<input type="text" name="name" value= "${auth.NAME}" /><br/>
		<b>GENDER</b><br/>
		<c:choose>
			<c:when test="${auth.GENDER =='남' }">
				<input type="radio" name="gender" value="남" checked="checked" required />남
				<input type="radio" name="gender" value="여" required />여<br/>
			</c:when>
			<c:when test="${auth.GENDER == '여' }">
				<input type="radio" name="gender" value="남" required />남
				<input type="radio" name="gender" value="여" checked="checked" required />여<br/>
			</c:when>
		</c:choose>		
		<b>BIRTH</b><br/>
			<select>
				<c:forEach var="i" begin="1900" step="1" end="2017">
					<c:choose>
						<c:when test="${i == auth.BIRTH }">
							<option selected="${auth.BIRTH }">${i }</option>
						</c:when>
						<c:otherwise>
								<option>${i }</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<br/>
		<b>ADDRESS</b><br/>
		<input type="text" name="address" value="${auth.ADDRESS}"/><br/> <br/>

	<button type="submit" style="width: 150px;">수정완료</button>
	</form>
	<a href="/my/info"><button type="button" style="width: 150px;">수정취소</button></a>
</div>