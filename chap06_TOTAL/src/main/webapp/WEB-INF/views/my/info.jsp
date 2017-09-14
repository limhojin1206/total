<%@page import="java.util.Map"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div align="center">
	<div>
		<h2>프로필</h2>
	</div>
	<div>
			<p>
			<b>ID : ${auth.ID }</b><br/>
			<b>E-MAIL :  ${auth.EMAIL } </b><br/>
			<b>NAME : ${auth.NAME }</b><br/>
			<b>GENDER : ${auth.GENDER }</b><br/>
			<b>BIRTH : ${auth.BIRTH }</b><br/>
			<b>ADDRESS : ${auth.ADDRESS }</b><br/>
			</p>
		
		<a href="/member/adjust"><button type="submit" style="width: 150px;">정보수정</button></a>
		<a href="/"><button type="button" style="width: 150px;">메인으로</button></a>
		<a href="/member/drop"><button type="submit" style="width: 150px;">탈퇴하기</button></a>
		
	</div>
</div>