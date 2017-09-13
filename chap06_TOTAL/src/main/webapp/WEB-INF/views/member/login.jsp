<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<form action="/member/login" method="post">
		<h2>로그인</h2>
		<c:if test="${!empty temp }">
			<b style="color: red">login failed..</b>
		</c:if><br/>
		<b>ID or EMAIL</b><br/>
		<input type="text" name="ids" required="required"/><br/>
		<b>PASS</b><br/>
		<input type="password" name="pass" required="required"/><br/> <br/>
		
		<button type="submit" style="width: 173px;">LOGIN</button>
	</form>
		<a href="/member/join"><button type="button" style="width: 173px;">JOIN</button></a><br/><br/>
		
		<a href="/market/list"><button type="button" style="width: 173px;">경매홈</button></a>
</div>
