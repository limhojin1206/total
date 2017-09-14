<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
	<div style="width: 40%;">
	<hr/>
	<h2>${item.NUM}. ${item.NAME} </h2>
	<hr/>
	<table>
	<thead>
		<th style="width: 30%;"/>
		<th style="width: 70%;"/>
		
	</thead>
	<tbody>
		<tr>
			<td>시작 가격 |</td>
			<td align="right"><fmt:formatNumber value="${item.STARTPRICE}"/></td>
		</tr>
		<tr>
			<td>현재 가격 |</td>
			<td align="right">
				<fmt:formatNumber value="${item.NOWPRICE}"/>
				<small><c:if test="${item.NOWPRICE == 0}">(입찰자 없음)</c:if></small>
			</td>
		</tr>	
		<tr>
			<td>즉구 가격 |</td>
			<td align="right"><c:if test="${! empty item.IMMEDIATEPRICE }"><fmt:formatNumber value="${item.IMMEDIATEPRICE}"/></c:if></td>
		</tr>
		<tr>
			<td>마감 기한 |</td>
			<td align="right"><c:if test="${! empty item.DEADLINE }"><fmt:formatDate value="${item.DEADLINE}" pattern="yy.MM.dd."/></c:if></td>
		</tr>
	</tbody>
	</table>
	<hr/>
	가격입력하기  : <input type="text" id="price" /><br/>
	<hr/>
	<button type="button" id="bt" >입찰</button> | 
	<a href="/market/list"><button type="button">취소</button></a>
	</div>
</div>
	<script>
		document.getElementById("bt").onclick = function(){
			window.alert("입찰 누름");
		}
	
	</script>