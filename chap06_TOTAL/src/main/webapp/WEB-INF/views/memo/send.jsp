<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div align="center">
	<form action="/memo/send" method="post">
		<input type="hidden" name="sender" value="${auth.ID}"/>
		<b>받는 사람</b><br/>
		<c:choose>
			<c:when test="${empty param.target }">
				<input type="text" name ="receiver" placeholder="받는 사람" required="required"/><br/>
			</c:when>
			<c:otherwise>
				<input type="text" name ="receiver" value="${param.target }" required="required"/><br/>
			</c:otherwise>		
		</c:choose>
		<b>보내는 내용</b><br/>
		<textarea rows="6" cols="40" name="content" placeholder="보내는 내용"></textarea><br/> <br/>
		<button type="submit" style="width: 173px;">전송</button>
	</form>
</div>