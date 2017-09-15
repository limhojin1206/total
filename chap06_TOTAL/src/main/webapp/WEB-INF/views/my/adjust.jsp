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
		<input type="text" name="name" value= "${auth.NAME}" required/><br/>
		<b>GENDER</b><br/>
		<b>BIRTH</b><br/>
		<b>ADDRESS</b><br/>
		<input type="text" name="address" value="${auth.ADDRESS}" required/><br/> <br/>

	<button type="submit" style="width: 150px;">수정완료</button>
	</form>
	<a href="/my/info"><button type="submit" style="width: 150px;">수정취소</button></a>
</div>