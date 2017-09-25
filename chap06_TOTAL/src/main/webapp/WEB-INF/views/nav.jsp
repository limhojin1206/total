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
		<a href="/my/info"><b>${auth.ID }</b></a>님 환영합니다!! |
		<script>
			var lws = new WebSocket("ws://192.168.10.72/ws/login");
			
			lws.onmessage = function(e){
				var obj = JSON.parse(e.data);
				
				switch(obj.mode){
				case "memo" :
					if(window.confirm(obj.send+"님께서 쪽지를 보내셨습니다. 확인하시겠습니까?")){
						location.href="/memo/list";
					}
				}
			}
			
			
		</script>	
	</c:if> 
	  
	 
	<c:choose>
		<c:when test="${empty auth}"><a href="/member/login">LOGIN</a> | <a href="/member/join">JOIN</a></c:when>
		<c:otherwise><a href="/member/logout">LOGOUT </a> | <a href="/my/info">INFO</a> | <a href="/memo/list">MEMO</a></c:otherwise>  
	</c:choose>
	
	
	
	 | <a href="/market/list">MARKET</a> | <a href="/board/blist">BOARD</a> | <a href="/member/mlist">전체 회원 정보</a><br/>
	 | <a href="/jquery/01">JQUERY</a> | <a href="javascript:openchat()">CHAT</a> | <a href="/parkinfo/parkinfolist">PARKINFO</a>
</div>

<script>
function openchat() {
	var url = "/chat/main";
	window.open(url, "chat", "width=300, height=500");
}
</script>