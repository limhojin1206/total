<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid">
			<!-- 
	<div class="navbar-header">
		<c:if test="${!empty auth}">
	<a href="/my/profile" class="navbar-text" >
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
	</c:if> 
    </div>
     -->
			<script>
				var lws = new WebSocket("ws://192.168.10.72/ws/login");

				lws.onmessage = function(e) {
					var obj = JSON.parse(e.data);

					switch (obj.mode) {
					case "memo":
						if (window.confirm(obj.send
								+ "님께서 쪽지를 보내셨습니다. 확인하시겠습니까?")) {
							location.href = "/memo/list";
						}
					}
				}
			</script>

			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Necessary Login <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/memo/list">MEMO</a></li>
						<li><a href="/market/list">MARKET</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">not Necessary Login <span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="/chart/03">CAHRT</a></li>
						<li><a href="/member/search">FRIEND</a></li>
						<li><a href="/jquery/04">JQUERY</a></li>
						<li><a href="/parkinfo/parkinfolist">PARKINFO</a></li>
						<li><a href="/research/result">RESEARCH</a></li>
					</ul></li>
				<li><a href="/board/blist">BOADR</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="javascript:openchat()" class="navbar-text"
					style="margin: 0;">CHAT</a></li>
				<li><a href="/member/mlist" class="navbar-text"
					style="margin: 0;">전체 회원 정보</a></li>
				<c:choose>
					<c:when test="${empty auth}">
						<li><a href="/member/join"><span
								class="glyphicon glyphicon-user"></span> Join</a></li>
						<li><a href="/member/login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a>
					</c:when>
					<c:otherwise>
						<li><a href="/my/info"><span
								class="glyphicon glyphicon-user"></span> INFO</a></li>
						<li><a href="/member/logout"><span
								class="glyphicon glyphicon-log-out"></span> LOGOUT</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
	</div>
	<script>
		var lws = new WebSocket("ws://192.168.10.72/ws/login");
		lws.onmessage = function(e) {
			var obj = JSON.parse(e.data);

			switch (obj.mode) {
			case "memo":
				if (window.confirm(obj.send + "님께서 쪽지를 보내셨습니다. 확인하시겠습니까?")) {
					location.href = "/memo/list";
				}
			}
		}
	</script>
	<script>
		function openchat() {
			var url = "/chat/main";
			window.open(url, "chat", "width=300, height=500");
		}
	</script>